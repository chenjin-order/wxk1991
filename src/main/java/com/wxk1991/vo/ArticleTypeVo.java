package com.wxk1991.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * <p>
 * 文章分类1
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
@Data

public class ArticleTypeVo  {


    /**
     * 文章分类id
     */
    private String articleTypeId;

    /**
     * 文章分类名称
     */
    private String articleTypeName;

    /**
     * 文章分类拍戏。越小越靠前
     */
    private Integer articleTypeSort;

    /**
     * 添加时间
     */
    private Date articleTypeAddTime;
    /**
     * 文章数量
     */
    @TableField(exist = false)
    private Integer articleCount;
}
