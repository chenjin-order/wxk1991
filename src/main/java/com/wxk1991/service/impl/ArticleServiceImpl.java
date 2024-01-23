package com.wxk1991.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wxk1991.entity.Article;
import com.wxk1991.mapper.ArticleMapper;
import com.wxk1991.service.IArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wxk1991.vo.ArticleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {

    @Autowired
    private ArticleMapper articleMapper;
    /**
     * 文章列表
     * @param articlePage
     * @param articleTitle
     * @return
     */
    @Override
    public IPage<ArticleVo> articleList(IPage<ArticleVo> articlePage, String articleTitle) {
        return articleMapper.articleList(articlePage,articleTitle);
    }
}
