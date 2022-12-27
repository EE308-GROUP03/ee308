package top.lucheng.server.config;

import com.alibaba.fastjson2.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.util.Assert;
import top.lucheng.server.utils.HttpClientUtil;

import java.util.HashMap;
import java.util.Map;

@Configuration
@Slf4j
public class ASRConfig {
    @Value("${baidu-asr.grant_type}")
    String grantType;

    @Value("${baidu-asr.client_id}")
    String clientId;

    @Value("${baidu-asr.client_secret}")
    String clientSecret;

    private static final String ACCESS_ERROR = "百度语音识别token认证失败";
    private static final String ACCESS_OK = "百度ASR 成功连接";

    @Lazy
    @Bean
    public String baiduAsrToken() {
        Map<String, String> param = new HashMap<String, String>() {{
            put("grant_type", grantType);
            put("client_id", clientId);
            put("client_secret", clientSecret);
        }};
        String resp = HttpClientUtil.doGet("https://aip.baidubce.com/oauth/2.0/token", param);
        Assert.notNull(resp, ACCESS_ERROR);
        Assert.isTrue(!"".equals(resp), ACCESS_ERROR);
        JSONObject jsonObject = JSONObject.parseObject(resp);
        String token;
        token = (String) jsonObject.get("access_token");
        Assert.notNull(token, ACCESS_ERROR);
        log.info(ACCESS_OK);
        return token;
    }
}
