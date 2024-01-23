package com.wxk1991.dto.article;

import com.wxk1991.dto.base.BasePageDto;
import lombok.Data;

@Data
public class ArticlePageDto extends BasePageDto {
    /**
     * 文章标题
     */
    private String  articleTitle;
}
