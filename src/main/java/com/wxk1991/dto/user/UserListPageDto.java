package com.wxk1991.dto.user;

import com.wxk1991.dto.base.BasePageDto;
import lombok.Data;

/**
 * @Title: UserListPageDto
 * @create 2021/12/21 22:23
 */
@Data
public class UserListPageDto extends BasePageDto {

    /**
     * 用户名
     */
    private String userName;

}
