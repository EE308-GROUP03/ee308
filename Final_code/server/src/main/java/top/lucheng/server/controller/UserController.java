package top.lucheng.server.controller;

import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.lucheng.server.pojo.UserParam;
import top.lucheng.server.service.UserService;
import top.lucheng.server.utils.R;

import java.util.concurrent.ExecutionException;

@Api(tags = "用户管理")
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @ApiOperation(value = "用户登录")
    @PostMapping(value = "/login")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userParam",
                    value = "用户登录的三个字段",
                    required = true,
                    paramType = "body",
                    dataType = "UserParam",
                    dataTypeClass = UserParam.class)
    })
    R login(@RequestBody UserParam userParam) {
        return R.ok("登录成功").put("token", userService.login(userParam));
    }

    @ApiOperation(value = "用户token自动登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "authorization",
                    value = "token",
                    paramType = "header",
                    dataType = "String",
                    dataTypeClass = String.class)
    })
    @PostMapping(value = "/login/token")
    R tokenLogin(@RequestHeader(value = "authorization") String token) {

        return R.ok().put("token", userService.tokenLogin(token));
    }

    @PostMapping("/register")
    R register(@RequestBody UserParam userParam) {
        userService.register(userParam.getIdentityType(), userParam.getIdentifier());
        return R.ok("注册成功");
    }

    @ApiOperation(value = "获取个人信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "uid",
                    value = "用户id",
                    paramType = "path",
                    dataType = "int",
                    dataTypeClass = Integer.class,
                    required = true),
            @ApiImplicitParam(name = "type",
                    value = "个人信息类型",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true)
    })
    @GetMapping("private/{type}/{uid}")
    R getPrivateInformation(@PathVariable(value = "uid") Integer uid, @PathVariable(value = "type") String type) {

        return R.ok().put("data", userService.getPrivateInformation(type, uid));
    }


    @ApiOperation(value = "获取短信验证码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "phone",
                    value = "用户手机号码",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true)
    })
    @GetMapping("/code/{phone}")
    R getAuthCode(@PathVariable(value = "phone") String phone) throws ExecutionException, InterruptedException {
        userService.getAuthCode(phone);
        return R.ok("短信返回成功");
    }

    @ApiOperation(value = "验证短信验证码")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "phone",
                    value = "用户手机号码",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true),
            @ApiImplicitParam(name = "code",
                    value = "验证码",
                    paramType = "path",
                    dataType = "String",
                    dataTypeClass = String.class,
                    required = true)
    })
    @PostMapping("/code/{phone}/{code}")
    R verifyAuthCode(@PathVariable(value = "phone") String phone,
                     @PathVariable(value = "code") String code) {
        if (userService.verifyAuthCode(phone, code)) return R.ok("验证成功");
        else return R.error(400, "验证码错误");
    }
}
