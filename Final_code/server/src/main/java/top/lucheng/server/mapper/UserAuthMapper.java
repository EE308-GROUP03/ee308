package top.lucheng.server.mapper;

import org.apache.ibatis.annotations.Mapper;
import top.lucheng.server.pojo.UserAuth;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author 61580
* @description 针对表【user_auth】的数据库操作Mapper
* @createDate 2022-10-08 20:19:26
* @Entity generator.pojo.UserAuth
*/
@Mapper
public interface UserAuthMapper extends BaseMapper<UserAuth> {

}




