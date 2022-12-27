package top.lucheng.server.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MapperTest {
    @Autowired
    CouponMapper couponMapper;
    @Test
    void couponMapperTest(){
        System.out.println(couponMapper.selectList(null));
    }
}
