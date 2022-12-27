package top.lucheng.server.pojo;

import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

@Data
@ApiModel
public class UserParam {
    /**
     * 登录类型（手机号 邮箱 用户名）或第三方应用名称（微信 微博等）
     */
    @NotNull(message = "登录类型不能为空")
    private String identityType;

    /**
     * 标识（手机号 邮箱 用户名或第三方应用的唯一标识）
     */
    @NotNull
    private String identifier;

    /**
     * 密码凭证（站内的保存密码，站外的不保存或保存token）
     */
    @Null
    private String credential;
}
