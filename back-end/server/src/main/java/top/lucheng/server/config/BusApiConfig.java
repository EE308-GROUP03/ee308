package top.lucheng.server.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@Data
public class BusApiConfig {
    @Value("${bus-api.uname}")
    String uname;
    @Value("${bus-api.secret}")
    String secret;

}
