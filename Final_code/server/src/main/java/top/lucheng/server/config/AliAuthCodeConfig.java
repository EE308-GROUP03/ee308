package top.lucheng.server.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Data
@Component
public class AliAuthCodeConfig {
    @Value("${ali-auth-code.access-key-id}")
    String accessKeyId;
    @Value("${ali-auth-code.access-key-secret}")
    String accessKeySecret;
}
