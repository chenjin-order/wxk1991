package com.wxk1991.service;

import com.wxk1991.entity.ArticleType;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.vo.ArticleTypeVo;

import java.util.List;

/**
 * <p>
 * 文章分类1 服务类
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
public interface IArticleTypeService extends IService<ArticleType> {

    List<ArticleTypeVo> articleTypeList();
}
