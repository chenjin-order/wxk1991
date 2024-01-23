package com.wxk1991.vo;

import lombok.Data;

import java.util.Date;

@Data
public class ArticleVO {
    /**
     * 文章id
     */
    private String articleId;

    /**
     * 文章分类id
     */
    private String articleTypeId;

    /**
     * 用户id
     */
    private String userId;
    /**
     * 用户名
     */
    private String userName;

    /**
     * 文章标题
     */
    private String articleTitle;

    /**
     * 文章添加时间
     */
    private Date articleAadTime;

    /**
     * 点赞次数
     */
    private Integer articleGoodNumber;

    /**
     * 观看次数
     */
    private Integer articleLookNumber;

    /**
     * 收藏次数
     */
    private Integer articleCollectionNumber;

    /**
     * 文章类型名称
     */
    private String articleTypeName;
}
