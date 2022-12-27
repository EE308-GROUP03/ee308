package top.lucheng.server.service.impl;

import com.alibaba.fastjson2.util.BeanUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.tomakehurst.wiremock.common.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.DigestUtils;
import top.lucheng.server.mapper.UserAuthMapper;
import top.lucheng.server.mapper.UserMapper;
import top.lucheng.server.pojo.Friend;
import top.lucheng.server.pojo.User;
import top.lucheng.server.pojo.UserAuth;
import top.lucheng.server.service.FriendService;
import top.lucheng.server.mapper.FriendMapper;
import org.springframework.stereotype.Service;
import top.lucheng.server.utils.BizErrorCodeEnum;
import top.lucheng.server.utils.BizException;

import java.lang.reflect.Field;
import java.util.*;

/**
 * @author 61580
 * @description 针对表【friend】的数据库操作Service实现
 * @createDate 2022-10-08 20:19:26
 */
@Service
public class FriendServiceImpl extends ServiceImpl<FriendMapper, Friend>
        implements FriendService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserAuthMapper userAuthMapper;
    @Autowired
    FriendMapper friendMapper;

    @Override
    public User addFriendByPhone(Integer uid, String phone, String mark) {
        User user = userMapper.selectById(uid);
        UserAuth friendAuth = userAuthMapper.selectOne(new QueryWrapper<UserAuth>()
                .eq("identity_type", "phone")
                .eq("identifier", DigestUtils.md5DigestAsHex(("phone#" + phone).getBytes())));
        Assert.notNull(user, "非法用户发起请求");
        Assert.notNull(friendAuth, "好友申请失败:申请的用户不存在");
        Assert.isTrue(user.getId() != friendAuth.getUid(), "不能请求自己为好友");
        User friend = userMapper.selectById(friendAuth.getUid());
        if (friendMapper.selectOne(new QueryWrapper<Friend>().eq("uid", uid)) != null
                || friendMapper.selectOne(new QueryWrapper<Friend>().eq("fid", friend.getId())) != null)
            throw new BizException(BizErrorCodeEnum.RELATIONSHIP_ALREADY_EXIST);
        save(new Friend() {{
            setUid(uid);
            setFid(friend.getId());
            setMark(mark);
        }});
        save(new Friend() {{
            setUid(friend.getId());
            setFid(uid);
            setMark("新朋友");
        }});
        friend.setBalance(0);
        return friend;
    }

    @Override
    public User getFriend(String identityType, String identifier) {
        if ("phone".equals(identityType)) {
            UserAuth userAuth = userAuthMapper.selectOne(new QueryWrapper<UserAuth>()
                    .eq("identity_type", "phone")
                    .eq("identifier", DigestUtils.md5DigestAsHex(("phone#" + identifier).getBytes()))
            );
            Assert.notNull(userAuth, "无该用户");
            User user = userMapper.selectById(userAuth.getUid());
            user.setBalance(null);
            return user;
        }
        return null;
    }

    @Override
    public List<Map<String,Object>> getFriends(Integer uid) throws IllegalAccessException {
        List<Friend> friendShips = friendMapper.selectList(new QueryWrapper<Friend>().eq("uid", uid));
        List<Map<String,Object>> friends = new ArrayList<>();

        for (int i = 0; i < friendShips.size(); i++) {
            User user = userMapper.selectById(friendShips.get(i).getFid());
            Map<String, Object> map = new HashMap<>();
            Class<?> cla = user.getClass();
            Field[] fields = cla.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String keyName = field.getName();
                Object value = field.get(user);
                if (value == null)
                    value = "";
                map.put(keyName, value);
            }
            map.put("mark",friendShips.get(i).getMark());
            friends.add(map);
        }
        return friends;
    }
}




