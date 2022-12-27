package top.lucheng.server.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.lucheng.server.service.FriendService;
import top.lucheng.server.utils.R;

@Api(tags = "好友关系管理")
@RestController
@RequestMapping("/friend")
public class FriendController {
    @Autowired
    FriendService friendService;

    @ApiOperation("好友添加")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid",
                    value = "用户id",
                    paramType = "path",
                    dataType = "int",
                    dataTypeClass = Integer.class,
                    required = true),
            @ApiImplicitParam(name = "identity_type",
                    value = "好友标识符类型 如:wechat,",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true),
            @ApiImplicitParam(name = "identifier",
                    value = "好友唯一标识符,如:13105999999",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true),
            @ApiImplicitParam(name = "mark",
                    value = "备注名",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true)
    })
    @PostMapping("/{uid}/{identity_type}/{identifier}/{mark}")
    R addFriend(@PathVariable(value = "uid") Integer uid,
                @PathVariable(value = "identity_type") String identityType,
                @PathVariable(value = "identifier") String identifier,
                @PathVariable(value = "mark") String mark) {
        friendService.addFriendByPhone(uid, identifier, mark);
        //把新好友的基本信息返回??
        return R.ok("好友添加成功");
    }

    @ApiOperation("搜索好友")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "identity_type",
                    value = "好友标识符类型 如:wechat,",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true),
            @ApiImplicitParam(name = "identifier",
                    value = "好友唯一标识符,如:13105999999",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true),
    })
    @GetMapping("/{identity_type}/{identifier}")
    R getFriend(@PathVariable(value = "identity_type") String identityType,
                @PathVariable(value = "identifier") String identifier) {
        return R.ok().put("friend", friendService.getFriend(identityType, identifier));
    }


    @ApiOperation("获取所有好友")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid",
                    value = "用户id",
                    paramType = "path",
                    dataType = "int",
                    dataTypeClass = Integer.class,
                    required = true)
    })
    @GetMapping("/{uid}")
    R getFriends(@PathVariable(value = "uid") Integer uid) throws IllegalAccessException {
        return R.ok().put("friends", friendService.getFriends(uid));
    }
}
