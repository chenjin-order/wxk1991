package com.wxk1991.entity;

import java.time.LocalDateTime;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Ad implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 广告id
     */
    @TableId("ad_id")
    private String adId;

    /**
     * 广告类型id
     */
    private String adTypeId;

    /**
     * 广告标题
     */
    private String adTitle;

    /**
     * 广告的url地址
     */
    private String adUrl;

    /**
     * 广告排序，越小越排在前面
     */
    private Integer adSort;

    /**
     * 广告开始时间
     */
    private LocalDateTime adBeginTime;

    /**
     * 广告结束时间
     */
    private LocalDateTime adEndTime;

    /**
     * 添加广告的时间
     */
    private LocalDateTime adAddTime;


}