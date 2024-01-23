package com.wxk1991.dto.base;

import lombok.Data;

import javax.validation.constraints.NotNull;
/**
 * @Title: BasePageDto
 * @create 2021/12/21 22:22
 */
@Data
public class BasePageDto {

    /**
     * 当前页码
     */
    @NotNull(message = "未获取到当前页码")
    private Integer pageNumber = 1;



}
