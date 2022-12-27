package top.lucheng.server;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import top.lucheng.server.mapper.UserMapper;

@SpringBootTest
//@MapperScan("top.lucheng.server.mapper")
@RunWith(SpringRunner.class)
class ServerApplicationTests {
    @Autowired
    UserMapper userMapper;

    @Autowired
    RedisTemplate redisTemplate;
    @Test
    void contextLoads(){
        redisTemplate.opsForValue().set("name",2);
        System.out.println(redisTemplate.opsForValue().get("name"));
    }

}
