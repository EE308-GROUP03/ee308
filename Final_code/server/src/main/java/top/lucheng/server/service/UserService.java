package top.lucheng.server.service;

import top.lucheng.server.pojo.User;
import com.baomidou.mybatisplus.extension.service.IService;
import top.lucheng.server.pojo.UserParam;

import java.util.concurrent.ExecutionException;

/**
 * @author 61580
 * @description 针对表【user】的数据库操作Service
 * @createDate 2022-10-08 20:19:26
 */
public interface UserService extends IService<User> {

    public String login(UserParam userParam);

    public String tokenLogin(String token);

    public String register(String identifyType, String identifier);

    public Integer getPrivateInformation(String type,Integer uid);

    public String getAuthCode(String phone) throws ExecutionException, InterruptedException;

    public Boolean verifyAuthCode(String phone,String code);
}
