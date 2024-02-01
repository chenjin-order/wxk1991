<#include "../import/adminTop.ftl">

<#if articleVoIPage?? && articleVoIPage.list?size gt 0 >
    <form class="form-horizontal" action="/wxk1991/article/list" method="get">
        <div class="form-group">
            <label for="articleTitle" class="col-sm-1">文章标题</label>
            <div class=" col-sm-3">
                <input type="text" value="${articleTitle!}" class="form-control" name="articleTitle" id="articleTitle"
                       placeholder="文章标题">
            </div>
            <div class="col-sm-2">
                <button type="submit" class="btn btn-success"><i class="icon icon-search"></i>搜索</button>
                <a href="/wxk1991/article/list" class="btn btn-success"><i class="icon icon-search"></i>全部</a>
            </div>
        </div>
    </form>
    <div class="panel">
        <div class="panel-body">
            <h4>当前：${(articleVoIPage.total)!0}篇文章</h4>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>发布时间</th>
                    <th>文章类型</th>
                    <th>发布者</th>
                    <th>文章标题</th>
                    <th>浏览数</th>
                    <th>点赞数</th>
                    <th>收藏数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list articleVoIPage.list as articleVo>
                    <tr>
                        <td>
                            ${(articleVo.articleAddTime?string("yyyy-MM-dd HH:mm:ss"))}
                        </td>
                        <td>${(articleVo.articleTypeName)!}</td>
                        <td>${(articleVo.userName)!}</td>
                        <td>${(articleVo.articleTitle)!}</td>
                        <td>${(articleVo.articleLookNumber)!}</td>
                        <td>${(articleVo.articleGoodNumber)!}</td>
                        <td>${(articleVo.articleCollectionNumber)!}</td>
                        <td>
                            <div style="text-align: right">
                                <button onclick="delArticle('${(articleVo.articleId)!}')" type="button"
                                        class="btn btn-mini"><i class="icon-remove"></i> 删除
                                </button>
                                <a target="_blank" href="/view/article/${(articleVo.articleId)!}"
                                   class="btn btn-mini"><i class="icon icon-eye-open"></i>查看</a>
                            </div>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>


    <div class="panel">
        <div class="panel-body" style="padding: 0;">
            <div class="col-sm-12" style="padding: 0;text-align: center;">
                <ul class="pager" style="margin-top: 10px;margin-bottom: 10px;">
                    <li class="previous" onclick="getNewData(1)">
                        <a href="javascript:void(0)"><i class="icon-step-backward"></i></a>
                    </li>

                    <#if articleVoIPage.pageNumber lte 1>
                        <li class="previous disabled">
                            <a href="javascript:void(0)"><i class="icon-chevron-left"></i></a>
                        </li>
                    <#else>
                        <li class="previous" onclick="getNewData('${articleVoIPage.pageNumber-1}')">
                            <a href="javascript:void(0)"><i class="icon-chevron-left"></i></a>
                        </li>
                    </#if>
                    <li>
                        <a href="javascript:void(0)" class="btn">
                            ${articleVoIPage.pageNumber}页/共${articleVoIPage.totalPage}</a>
                    </li>
                    <#if articleVoIPage.pageNumber gte articleVoIPage.totalPage>
                        <li class="next disabled">
                            <a href="javascript:void(0)"><i class="icon-chevron-right"></i></a>
                        </li>
                    <#else>
                        <li class="next" onclick="getNewData('${articleVoIPage.pageNumber+1}')">
                            <a href="javascript:void(0)"><i class="icon-chevron-right"></i></a>
                        </li>
                    </#if>
                    <li class="previous" onclick="getNewData('${articleVoIPage.totalPage}')">
                        <a href="javascript:void(0)"><i class="icon-step-forward"></i></a>
                    </li>


                    <li class="next">
                        <a href="javascript:void(0)">
                            <input type="number" id="renderPageNumber" maxlength="5"
                                   style="width:50px;height: 20px;" oninput="value=value.replace(/[^\d]/g,'')">
                        </a>
                    </li>
                    <li class="next">
                        <a href="javascript:void(0)" onclick="renderPage()"
                           style="padding-left: 2px;padding-right: 2px;">
                            跳转
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


<#else >
    <div class="panel">
        <div class="panel-body" style="padding: 0;">
            <div style="text-align: center;">
                <h3><i class="icon icon-coffee"></i></h3>
                <h3>暂无数据</h3>
            </div>
        </div>
    </div>
</#if>



<script type="text/javascript">


    function delArticle(articleId) {
        if (confirm("是否删除")) {
            if (!checkNotNull(articleId)) {
                zuiMsg("程序出错，请刷新页面重试");

                return;
            }
            $.post("/wxk1991/article/del", {
                    articleId: articleId
                },
                function (data) {
                    if (data.code == 200) {
                        alert(data.message)
                        location.reload();
                        return;
                    }
                    zuiMsg(data.message);

                });
        }
    }

    function getNewData(pageNumber) {
        if (!checkNotNull(pageNumber)) {
            pageNumber = 1;
        }
        window.location.href = "/wxk1991/article/list?pageNumber=" + pageNumber + "<#if (articleName?? && articleName?length>0)>&articleName=${articleName!}</#if>";
    }

    function renderPage() {
        let renderPageNumber = $("#renderPageNumber").val();
        if (!checkNotNull(renderPageNumber)) {
            zuiMsg("请输入跳转的页码!");
            return;
        }
        let totalPage = '${articleVoIPage.totalPage}';
        if (parseInt(renderPageNumber) > parseInt(totalPage)) {
            renderPageNumber = totalPage;
        }
        getNewData(renderPageNumber);
    }
</script>
<#include "../import/bottom.ftl">