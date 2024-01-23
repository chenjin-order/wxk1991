package com.wxk1991.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wxk1991.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wxk1991.vo.ArticleVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
public interface IArticleService extends IService<Article> {

    /**
     * 文章列表
     * @param articlePage
     * @param articleTitle
     * @return
     */
    IPage<ArticleVo> articleList(IPage<ArticleVo> articlePage, String articleTitle);
}
