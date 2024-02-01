package com.wxk1991.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.system.OsInfo;
import cn.hutool.system.HostInfo;
import cn.hutool.system.SystemUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wxk1991.dto.ad.AdDto;
import com.wxk1991.dto.article.ArticlePageDto;
import com.wxk1991.dto.article.ArticleTypeAddDto;
import com.wxk1991.dto.article.ArticleTypeUpdateDto;
import com.wxk1991.dto.user.UserDto;
import com.wxk1991.dto.user.UserListPageDto;
import com.wxk1991.entity.*;
import com.wxk1991.service.*;
import com.wxk1991.service.impl.*;
import com.wxk1991.utils.CommonPage;
import com.wxk1991.utils.CommonResult;
import com.wxk1991.vo.ArticleTypeVo;
import com.wxk1991.vo.ArticleVo;
import com.wxk1991.vo.AdVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/wxk1991")
@Slf4j
public class AdminController {

    @Autowired
    private IArticleTypeService articleTypeService;

    @Autowired
    private IArticleTagService articleTagService;

    @Autowired
    private IArticleTagListService articleTagListService;

    @Autowired
    private IArticleService articleService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ILinkService linkService;

    @Autowired
    private IAdTypeService adTypeService;

    @Autowired
    private IAdService adService;

    @GetMapping("/")
    public String adminIndex(Model model) {

        //系统信息
        OsInfo osInfo = SystemUtil.getOsInfo();
        HostInfo hostInfo = SystemUtil.getHostInfo();
        model.addAttribute("osName", osInfo.getName());
        model.addAttribute("hostAddress", hostInfo.getAddress());

        //文章数量
        int articleTypeCount = articleTypeService.count();
        int articleTagCount = articleTagListService.count();
        int articleCount = articleService.count();
        model.addAttribute("articleTypeCount", articleTypeCount);
        model.addAttribute("articleTagCount", articleTagCount);
        model.addAttribute("articleCount", articleCount);

        //用户数量
        int userCount = userService.count();
        model.addAttribute("userCount", userCount);


        return "/admin/index";
    }

    /**
     * 用户查询
     *
     * @param userListPageDto
     * @param model
     * @return
     */
    @GetMapping("/user/list")
    public String userList(@Valid UserListPageDto userListPageDto, Model model) {
        Integer pageNumber = userListPageDto.getPageNumber();
        String userName = userListPageDto.getUserName();

        IPage<User> userPage = new Page<>(pageNumber, 20);
        LambdaQueryWrapper<User> userLambdaQueryWrapper = Wrappers.<User>lambdaQuery().orderByDesc(User::getUserRegisterTime);
        if (StrUtil.isNotBlank(userName)) {
            userLambdaQueryWrapper.like(User::getUserName, userName);
            model.addAttribute("userName", userName);
        }

        IPage<User> userIPage = userService.page(userPage, userLambdaQueryWrapper);
        model.addAttribute("userPage", CommonPage.restPage(userIPage));

        return "/admin/userList";
    }

    /**
     * 用户删除
     *
     * @param userId
     * @return
     */
    @PostMapping("/user/del")
    @ResponseBody
    public CommonResult userDel(String userId) {
        if (StrUtil.isBlank(userId)) {
            return CommonResult.failed("参数错误，请刷新页面重试");
        }
        if (articleService.count(Wrappers.<Article>lambdaQuery().eq(Article::getUserId, userId)) > 0) {
            return CommonResult.failed("该用户发布过文章，无法删除，请冻结用户");
        }

        if (userService.removeById(userId)) {
            return CommonResult.success("删除成功");
        }
        return CommonResult.failed("删除失败");
    }

    /**
     * 用户修改
     *
     * @param userDto
     * @return
     */
    @PostMapping("/user/update")
    @ResponseBody
    public CommonResult userUpdate(@Valid UserDto userDto) {

        User user = userService.getById(userDto.getUserId());
        if (Objects.isNull(user)) {
            return CommonResult.failed("用户id 不正确");
        }
        Date userRegisterTime = user.getUserRegisterTime();
        String userPassword = userDto.getUserPassword();
        if (StrUtil.isNotBlank(userPassword)) {
            //用户密码 = md5 （注册时间 + 用户明文密码）
            userDto.setUserPassword(SecureUtil.md5(userRegisterTime + userPassword));
        } else {
            userDto.setUserPassword(null);
        }
        BeanUtils.copyProperties(userDto, user);

        if (userService.updateById(user)) {
            return CommonResult.success("修改成功");
        }
        return CommonResult.failed("修改失败，请重试");
    }

    @GetMapping("/article/type/list")
    public String articleTypeList(Model model) {
        List<ArticleTypeVo> articleTypeVoList = articleTypeService.articleTypeList();
        model.addAttribute("articleTypeVoList", articleTypeVoList);
        return "/admin/articleTypeList";
    }

    /**
     * 添加文章类型
     *
     * @param articleTypeAddDto
     * @return
     */
    @PostMapping("/article/type/add")
    @ResponseBody
    public CommonResult articleTypeAdd(@Valid() ArticleTypeAddDto articleTypeAddDto) {
        ArticleType articleType = new ArticleType();
        BeanUtils.copyProperties(articleTypeAddDto, articleType);
        articleType.setArticleTypeAddTime(DateUtil.date());
        if (articleTypeService.save(articleType)) {
            return CommonResult.success("添加成功");
        }
        return CommonResult.failed("添加失败");
    }

    /**
     * 修改文章类型
     *
     * @param articleTypeUpdateDto
     * @return
     */
    @PostMapping("/article/type/update")
    @ResponseBody
    public CommonResult articleTypeUpdate(@Valid() ArticleTypeUpdateDto articleTypeUpdateDto) {
        ArticleType articleType = new ArticleType();
        BeanUtils.copyProperties(articleTypeUpdateDto, articleType);

        String articleTypeName = articleType.getArticleTypeName();
        Integer articleTypeSort = articleType.getArticleTypeSort();
        if (StrUtil.isBlank(articleTypeName)) {
            articleType.setArticleTypeName(null);
        }
        if (Objects.isNull(articleTypeSort)) {
            articleType.setArticleTypeSort(null);
        }

        if (articleTypeService.updateById(articleType)) {
            return CommonResult.success("修改成功");
        }
        return CommonResult.failed("修改失败");
    }

    /**
     * 删除文章分类
     *
     * @param articleTypeId
     * @return
     */

    @PostMapping("/article/type/del")
    @ResponseBody
    public CommonResult articleTypeDel(@NotBlank(message = "文章分类id 不能为空") String articleTypeId) {

        if (articleService.count(Wrappers.<Article>lambdaQuery().eq(Article::getArticleTypeId, articleTypeId)) > 0) {
            return CommonResult.failed("请先删除该分类下的文章");
        }
        ;

        if (articleTypeService.removeById(articleTypeId)) {
            return CommonResult.success("删除成功");
        }
        return CommonResult.failed("删除失败");
    }

    /**
     * 文章标签列
     *
     * @param model
     * @return
     */
    @GetMapping("/article/tag/list")
    public String articleTagList(Model model) {
        List<ArticleTag> articleTagList = articleTagService.list(Wrappers.<ArticleTag>lambdaQuery().orderByDesc(ArticleTag::getArticleTagAddTime));
        model.addAttribute("articleTagList", articleTagList);
        return "/admin/articleTagList";
    }

    /**
     * 文章标签 添加
     *
     * @param articleTag
     * @return
     */
    @PostMapping("/article/tag/addOrUpdate")
    @ResponseBody
    public CommonResult articleTagAddOrUpdate(ArticleTag articleTag) {
        String articleTagId = articleTag.getArticleTagId();
        if (StrUtil.isNotBlank(articleTagId)) {
            if (articleTagService.updateById(articleTag)) {
                return CommonResult.success("修改成功");
            }
            return CommonResult.failed("修改失败");
        }


        articleTag.setArticleTagAddTime(DateUtil.date());
        if (articleTagService.save(articleTag)) {
            return CommonResult.success("文章标签添加成功");
        }
        return CommonResult.failed("文章标签添加失败");
    }

    /**
     * 文章标签 删除
     *
     * @param articleTagId
     * @return
     */
    @PostMapping("/article/tag/del")
    @ResponseBody
    public CommonResult articleTagDel(String articleTagId) {

        if (StrUtil.isBlank(articleTagId)) {
            return CommonResult.failed("删除失败，没有获取到文章标签id");
        }

        if (articleTagListService.count(Wrappers.<ArticleTagList>lambdaQuery()
                .eq(ArticleTagList::getArticleTagId, articleTagId)) > 0) {
            return CommonResult.failed("该标签已经被使用，无法删除，请先删除和文章的关联");
        }

        if (articleTagService.removeById(articleTagId)) {
            return CommonResult.success("文章标签删除成功");
        }
        return CommonResult.failed("文章标签删除失败");
    }

    /**
     * 文章列表
     *
     * @param articlePagDto
     * @return
     */
    @GetMapping("/article/list")
    public String articleList(@Valid ArticlePageDto articlePagDto, Model model) {
        IPage<ArticleVo> articleVoPage = new Page<>(articlePagDto.getPageNumber(), 20);
        IPage<ArticleVo> articleVoIPage = articleService.articleList(articleVoPage, articlePagDto.getArticleTitle());
        model.addAttribute("articleVoIPage", CommonPage.restPage(articleVoIPage));
        if (StrUtil.isNotBlank(articlePagDto.getArticleTitle())) {
            model.addAttribute("articleTitle", articlePagDto.getArticleTitle());
        }
        return "/admin/articleList";
    }

    /**
     * 文章删除
     *
     * @param articleId
     * @return
     */
    @PostMapping("/article/del")
    @ResponseBody
    public CommonResult articleDel(String articleId) {
        if (articleService.removeById(articleId)) {
            return CommonResult.success("删除成功");
        }
        return CommonResult.failed("删除失败");
    }

    /**
     * 友情链接列表页面
     *
     * @return
     */
    @GetMapping("/link/list")
    public String linkList(Model model) {
        List<Link> linkList = linkService.list(Wrappers.<Link>lambdaQuery().orderByAsc(Link::getLinkSort));
        model.addAttribute("linkList", linkList);
        return "admin/linkList";
    }

    /**
     * 更新友联
     *
     * @param link
     * @return
     */
    @PostMapping("/link/addOrUpdate")
    @ResponseBody
    public CommonResult linkAddOrUpdate(Link link) {
        String linkId = link.getLinkId();
        if (StrUtil.isBlank(linkId)) {
            //添加友链
            link.setLinkAddTime(DateUtil.date());
            if (linkService.save(link)) {
                return CommonResult.success("添加成功");
            }
            return CommonResult.failed("添加失败");
        }
        if (linkService.updateById(link)) {
            return CommonResult.success("更新成功");
        }
        return CommonResult.failed("更新失败");
    }

    /**
     * 删除友联
     *
     * @param linkId
     * @return
     */
    @PostMapping("/link/del")
    @ResponseBody
    public CommonResult LinkDel(String linkId) {
        if (linkService.removeById(linkId)) {
            return CommonResult.success("删除成功");
        }
        return CommonResult.failed("删除失败");
    }

    /**
     * 广告管理
     *
     * @param model
     * @return
     */
    @GetMapping("/ad/list")
    public String adList(String adTypeId, Model model) {
        List<AdType> adTypeList = adTypeService.list(Wrappers.<AdType>lambdaQuery()
                .orderByAsc(AdType::getAdTypeSort));
        model.addAttribute("adTypeList", adTypeList);

        List<AdVo> adVoList = adService.adList(adTypeId);
        model.addAttribute("adVoList", adVoList);

        return "/admin/adList";
    }

    /**
     * 广告类型管理
     * @param adType
     * @return
     */
    @PostMapping("/ad/type/addOrUpdate")
    @ResponseBody
    public CommonResult adTypeAddOrUpdate(AdType adType) {
        String adTypeId = adType.getAdTypeId();
        if (StrUtil.isBlank(adTypeId)) {
            //添加广告类型
            adType.setAdTypeAddTime(DateUtil.date());
            if (adTypeService.save(adType)) {
                return CommonResult.success("添加成功");
            }
            return CommonResult.failed("添加失败");
        }

        //修改广告类型
        if (adTypeService.updateById(adType)) {
            return CommonResult.success("修改成功");
        }
        return CommonResult.failed("修改失败");
    }
    /**
     * 广告管理
     * @param adDto
     * @return
     */
    @PostMapping("/ad/addOrUpdate")
    @ResponseBody
    public CommonResult adAddOrUpdate(AdDto adDto) {
        String adId = adDto.getAdId();
        Ad ad = new Ad();
        BeanUtils.copyProperties(adDto, ad);
        ad.setAdBeginTime(DateUtil.parseDateTime(adDto.getAdBeginTime()));
        ad.setAdEndTime(DateUtil.parseDateTime(adDto.getAdEndTime()));

        if (StrUtil.isBlank(adId)) {
            //添加广告类型
            ad.setAdAddTime(DateUtil.date());
            if (adService.save(ad)) {
                return CommonResult.success("添加成功");
            }
            return CommonResult.failed("添加失败");
        }

        //修改广告类型
        if (adService.updateById(ad)) {
            return CommonResult.success("修改成功");
        }
        return CommonResult.failed("修改失败");
    }
    /**
     * 删除广告
     *
     * @param adId
     * @return
     */
    @PostMapping("/ad/del")
    @ResponseBody
    public CommonResult adDel(String adId) {
        if (adService.removeById(adId)) {

            return CommonResult.success("删除成功");
        }
        return CommonResult.failed("删除失败");
    }
}
