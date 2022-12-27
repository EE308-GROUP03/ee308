package top.lucheng.server.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import top.lucheng.server.pojo.User;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JwtToken生成的工具类
 * JWT token的格式：header.payload.signature
 * header的格式（算法、token的类型）,默认：{"alg": "HS512","typ": "JWT"}
 * payload的格式 设置：（用户信息、创建时间、生成时间）
 * signature的生成算法：
 * HMACSHA512(base64UrlEncode(header) + "." +base64UrlEncode(payload),secret)
 */

@Component
@ConfigurationProperties(prefix = "jwt")
public class JWTUtils {

    //定义token返回头部
    public static String header;

    //token前缀
    public static String tokenPrefix;

    //签名密钥
    public static String secret;

    //有效期
    public static long expireTime;

    //存进客户端的token的key名
    public static final String USER_LOGIN_TOKEN = "USER_LOGIN_TOKEN";

    public void setHeader(String header) {
        JWTUtils.header = header;
    }

    public void setTokenPrefix(String tokenPrefix) {
        JWTUtils.tokenPrefix = tokenPrefix;
    }

    public void setSecret(String secret) {
        JWTUtils.secret = secret;
    }

    public void setExpireTime(int expireTimeInt) {
        JWTUtils.expireTime = expireTimeInt * 1000L * 60;
    }

    /**
     * 创建TOKEN
     *
     * @return
     */
    public static String createToken(User user) {
        Map<String, Object> map = new HashMap<>();
        map.put("algorithm", "HS256");
        map.put("type", "JWT");
        return "Bearer " + JWT.create()
                .withHeader(map)
                .withClaim("id", user.getId())
                .withClaim("nickname", user.getNickname())
                .withClaim("avatar", user.getAvatar())
                .withClaim("level", user.getLevel())
                .withClaim("status",user.getStatus())
                .withExpiresAt(new Date(System.currentTimeMillis() + expireTime))
                .sign(Algorithm.HMAC512(secret));
    }


    /**
     * 验证token
     *
     * @param token
     */
    public static String validateToken(String token) {
        return JWT.require(Algorithm.HMAC512(secret))
                .build()
                .verify(token.replace(tokenPrefix, ""))
                .getSubject();
    }

    /**
     * 检查token是否需要更新,需要更新返回用户id,否则返回null
     *
     * @param token
     * @return
     */
    public static Integer isNeedUpdate(String token) {
        // 使用默认Parser
        DecodedJWT decodedJWT = JWT.decode(token.replace(tokenPrefix, ""));
        //获取token过期时间
        Date expiresAt  = decodedJWT.getExpiresAt();
        //如果剩余过期时间少于过期时常的一般时 需要更新
        if ((expiresAt.getTime() - System.currentTimeMillis()) < (expireTime >> 1)) {
            return decodedJWT.getClaim("id").asInt();
        }
        return null;
    }


}