package top.lucheng.server.service;

import top.lucheng.server.pojo.Friend;
import com.baomidou.mybatisplus.extension.service.IService;
import top.lucheng.server.pojo.User;

import java.util.List;
import java.util.Map;

/**
* @author 61580
* @description 针对表【friend】的数据库操作Service
* @createDate 2022-10-08 20:19:26
*/
public interface FriendService extends IService<Friend> {
    public User addFriendByPhone(Integer uid, String  phone,String mark);

    public User getFriend(String identityType,String identifier);

    public List<Map<String,Object>> getFriends(Integer uid) throws IllegalAccessException;
}
