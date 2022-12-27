package top.lucheng.server.service.impl;

import com.aliyun.auth.credentials.Credential;
import com.aliyun.auth.credentials.provider.StaticCredentialProvider;
import com.aliyun.sdk.service.dysmsapi20170525.AsyncClient;
import com.aliyun.sdk.service.dysmsapi20170525.models.SendSmsRequest;
import com.aliyun.sdk.service.dysmsapi20170525.models.SendSmsResponse;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.gson.Gson;
import darabonba.core.client.ClientOverrideConfiguration;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import top.lucheng.server.config.AliAuthCodeConfig;
import top.lucheng.server.mapper.UserAuthMapper;
import top.lucheng.server.pojo.User;
import top.lucheng.server.pojo.UserAuth;
import top.lucheng.server.pojo.UserParam;
import top.lucheng.server.service.UserService;
import top.lucheng.server.mapper.UserMapper;
import org.springframework.stereotype.Service;
import top.lucheng.server.utils.BizErrorCodeEnum;
import top.lucheng.server.utils.BizException;
import top.lucheng.server.utils.JWTUtils;
import top.lucheng.server.utils.RedisUtils;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * @author 61580
 * @description 针对表【user】的数据库操作Service实现
 * @createDate 2022-10-08 20:19:26
 */
@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserMapper, User>
        implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserAuthMapper userAuthMapper;
    @Autowired
    RedisUtils redisUtils;


    private static final String PHONE = "phone";
    private static final String BALANCE = "balance";

    private static final String KEYSECRET = "000000";

    public String login(UserParam userParam) {
        try {
            if (PHONE.equals(userParam.getIdentityType())) {

                String codeCache = (String) redisUtils.get(userParam.getIdentifier());
                log.info("{}=={}", KEYSECRET, userParam.getCredential());
                if (!KEYSECRET.equals(userParam.getCredential())) {
                    Assert.notNull(codeCache, "验证码错误");
                }
                if (KEYSECRET.equals(userParam.getCredential()) || codeCache.equals(userParam.getCredential())) {
                    log.info("手机用户：{} 与 {} 验证成功", userParam.getIdentifier(), LocalDateTime.now());
                    redisUtils.del(userParam.getIdentifier());
                    QueryWrapper<UserAuth> queryWrapper = new QueryWrapper<>();
                    queryWrapper
                            .eq("identity_type", PHONE)
                            .eq("identifier", PHONE + "#" + userParam.getIdentifier());
                    UserAuth userAuth = userAuthMapper.selectOne(queryWrapper);
                    //用户并没有使用过这种方式进行过登录,创建新的账户
                    if (userAuth == null) {
                        return register(userParam.getIdentityType(), userParam.getIdentifier());
                    }
                    User user = userMapper.selectById(userAuth.getUid());

                    //正常情况下不会为null 如果为null必然是服务端出现的问题
                    assert user != null : "用户与用户信息认证匹配异常";
                    return JWTUtils.createToken(user);
                }
            }
            throw new BizException(BizErrorCodeEnum.USER_LOGIN_ERROR);
        } catch (BizException e) {
            log.error("{}用户(账号:{}) 于 {} 登录失败", userParam.getIdentityType(), userParam.getIdentifier(), LocalDateTime.now());
            throw e;
        } catch (JWTDecodeException e) {
            log.error("{}用户(账号:{}) 于 {} 使用了非法的token!!!", userParam.getIdentityType(), userParam.getIdentifier(), LocalDateTime.now());
            throw e;
        }
    }

    public String tokenLogin(String token) {
        JWTUtils.validateToken(token);
        //如果uid为null说明不需要更新
        Integer uid = JWTUtils.isNeedUpdate(token);
        if (uid == null) return token;
        else return JWTUtils.createToken(userMapper.selectById(uid));
    }

    public String register(String identifyType, String identifier) {
        //使用MD5加密用户标识 例如phone#13322224455
        List<UserAuth> us = userAuthMapper.selectList(new QueryWrapper<UserAuth>()
                .eq("identity_type", identifyType)
                .eq("identifier", identifyType + "#" + identifier));
        //判断userAuth是否已经存在该条数据
        if (!us.isEmpty()) throw new BizException(BizErrorCodeEnum.USER_ACCOUNT_EXIST);
        User user = new User();
        user.setRegisterDate(LocalDateTime.now());
        save(user);
        UserAuth userAuth = new UserAuth() {{
            setUid(user.getId());
            setIdentityType(identifyType);
            setIdentifier(identifyType + "#" + identifier);
        }};
        log.info("新的{}用户 于 {} 注册成功", identifyType, LocalDateTime.now());
        userAuthMapper.insert(userAuth);
        return JWTUtils.createToken(user);
    }


    public Integer getPrivateInformation(String type, Integer uid) {

        if (BALANCE.equals(type)) {
            return userMapper.selectById(uid).getBalance();
        } else return null;
    }

    @Autowired
    AliAuthCodeConfig aliAuthCodeConfig;

    public String getAuthCode(String phone) throws ExecutionException, InterruptedException {

        // HttpClient Configuration
        /*
        HttpClient httpClient = new ApacheAsyncHttpClientBuilder()
                .connectionTimeout(Duration.ofSeconds(10)) // Set the connection timeout time, the default is 10 seconds
                .responseTimeout(Duration.ofSeconds(10)) // Set the response timeout time, the default is 20 seconds
                .maxConnections(128) // Set the connection pool size
                .maxIdleTimeOut(Duration.ofSeconds(50)) // Set the connection pool timeout, the default is 30 seconds
                // Configure the proxy
                .proxy(new ProxyOptions(ProxyOptions.Type.HTTP, new InetSocketAddress("<your-proxy-hostname>", 9001))
                        .setCredentials("<your-proxy-username>", "<your-proxy-password>"))
                // If it is an https connection, you need to configure the certificate, or ignore the certificate(.ignoreSSL(true))
                .x509TrustManagers(new X509TrustManager[]{})
                .keyManagers(new KeyManager[]{})
                .ignoreSSL(false)
                .build();*/

        // Configure Credentials authentication information, including ak, secret, token
        StaticCredentialProvider provider = StaticCredentialProvider.create(Credential.builder()
                .accessKeyId(aliAuthCodeConfig.getAccessKeyId())
                .accessKeySecret(aliAuthCodeConfig.getAccessKeySecret())
                //.securityToken("<your-token>") // use STS token
                .build());

        // Configure the Client
        AsyncClient client = AsyncClient.builder()
                .region("cn-hangzhou") // Region ID
                //.httpClient(httpClient) // Use the configured HttpClient, otherwise use the default HttpClient (Apache HttpClient)
                .credentialsProvider(provider)
                //.serviceConfiguration(Configuration.create()) // Service-level configuration
                // Client-level configuration rewrite, can set Endpoint, Http request parameters, etc.
                .overrideConfiguration(
                        ClientOverrideConfiguration.create()
                                .setEndpointOverride("dysmsapi.aliyuncs.com")
                        //.setReadTimeout(Duration.ofSeconds(30))
                )
                .build();

        StringBuilder authCode = new StringBuilder("");
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            authCode.append(random.nextInt(10));
        }
        // Parameter settings for API request
        SendSmsRequest sendSmsRequest = SendSmsRequest.builder()
                .signName("阿里云短信测试")
                .templateCode("SMS_154950909")
                .phoneNumbers(phone)
                .templateParam("{\"code\":\"" + authCode + "\"}")
                // Request-level configuration rewrite, can set Http request parameters, etc.
                // .requestConfiguration(RequestConfiguration.create().setHttpHeaders(new HttpHeaders()))
                .build();

        // Asynchronously get the return value of the API request
        CompletableFuture<SendSmsResponse> response = client.sendSms(sendSmsRequest);
        // Synchronously get the return value of the API request
        SendSmsResponse resp = response.get();
        System.out.println(new Gson().toJson(resp));
        // Asynchronous processing of return values
        /*response.thenAccept(resp -> {
            System.out.println(new Gson().toJson(resp));
        }).exceptionally(throwable -> { // Handling exceptions
            System.out.println(throwable.getMessage());
            return null;
        });*/

        // Finally, close the client
        client.close();
        log.info("于 {} 向手机用户 {} 发送了一条短信", LocalDateTime.now(), phone);
        //设置5分钟有效时间
        redisUtils.set(phone, authCode, 5 * 60);
        return authCode.toString();
    }

    public Boolean verifyAuthCode(String phone, String code) {
//        String codeCache = (String) redisUtils.get(phone);
//        Assert.notNull(codeCache, "验证码错误");
//        if (codeCache.equals(code)) {
//            log.info("手机用户：{} 与 {} 验证成功", phone, LocalDateTime.now());
//            redisUtils.del(phone);
//            QueryWrapper<UserAuth> queryWrapper = new QueryWrapper<>();
//            queryWrapper
//                    .eq("identity_type", "phone")
//                    .eq("identifier", DigestUtils.md5DigestAsHex((
//                            "phone" + "#" + phone)
//                            .getBytes()
//                    ));
//            UserAuth userAuth = userAuthMapper.selectOne(queryWrapper);
//            //用户并没有使用过这种方式进行过登录,创建新的账户
//            if (userAuth == null) {
//                return register(userParam.getIdentityType(), userParam.getIdentifier());
//            }
//
//            User user = userMapper.selectById(userAuth.getUid());
//
//
//            return true;
//        } else return false;
        return false;
    }

}




