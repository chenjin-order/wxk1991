package com.wxk1991.mapper;

import com.wxk1991.entity.ArticleType;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.ArticleTypeVo;

import java.util.List;

/**
 * <p>
 * 文章分类1 Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
public interface ArticleTypeMapper extends BaseMapper<ArticleType> {

    List<ArticleTypeVo> articleTypeList();
}
