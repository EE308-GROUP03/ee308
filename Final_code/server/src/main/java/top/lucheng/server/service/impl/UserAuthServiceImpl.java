package top.lucheng.server.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import top.lucheng.server.pojo.UserAuth;
import top.lucheng.server.service.UserAuthService;
import top.lucheng.server.mapper.UserAuthMapper;
import org.springframework.stereotype.Service;

/**
* @author 61580
* @description 针对表【user_auth】的数据库操作Service实现
* @createDate 2022-10-08 20:19:26
*/
@Service
public class UserAuthServiceImpl extends ServiceImpl<UserAuthMapper, UserAuth>
    implements UserAuthService{

}




