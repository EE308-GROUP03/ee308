package top.lucheng.server.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.lucheng.server.pojo.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author 61580
* @description 针对表【user】的数据库操作Mapper
* @createDate 2022-10-08 20:19:26
* @Entity generator.pojo.User
*/
@Mapper
public interface UserMapper extends BaseMapper<User> {

}




