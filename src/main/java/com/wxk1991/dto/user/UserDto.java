package com.wxk1991.dto.user;


import lombok.Data;

import javax.validation.constraints.NotBlank;


@Data
public class UserDto {
    /**
     * 用户id
     */
    @NotBlank(message = "用户id不能为空")
    private String userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户密码
     */
    private String userPassword;

    /**
     * 是否冻结，0正常，1冻结(冻结后无法登录)
     */
    private Integer userFrozen;


}
