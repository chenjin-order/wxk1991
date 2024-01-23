package com.wxk1991.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.wxk1991.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.wxk1991.vo.ArticleVo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2024-01-19
 */
public interface ArticleMapper extends BaseMapper<Article> {
    /**
     * 文章列表
     * @param articlePage
     * @param articleTitle
     * @return
     */
    IPage<ArticleVo> articleList(IPage<ArticleVo> articlePage, @Param("articleTitle") String articleTitle);
}
