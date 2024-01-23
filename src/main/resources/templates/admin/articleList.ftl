<#include "../import/adminTop.ftl">

<#if articleTypeVoList?? && articleTypeVoList?size gt 0 >
    <div class="panel">
        <div class="panel-body">
            <button type="button" class="btn btn-success" onclick="addOrUpdateArticleType()">添加文章类型</button>
            <hr/>
            <table class="table">
                <thead>
                <tr>
                    <th>排序</th>
                    <th>添加时间</th>
                    <th>文章类型名称</th>
                    <th>文章数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list articleTypeVoList as articleType>
                    <tr>
                        <td>${(articleType.articleTypeSort)!}</td>
                        <td>
                            ${(articleType.getArticleTypeAddTime())?string("yyyy-MM-dd HH:mm:ss")}
                        </td>
                        <td>${(articleType.articleTypeName)!}</td>
                        <td>${(articleType.articleCount)!}</td>
                        <td>
                            <button
                                    onclick="addOrUpdateArticleType('${(articleType.articleTypeId)!}','${(articleType.articleTypeName)!}','${(articleType.articleTypeSort)!}')"
                                    type="button" class="btn btn-mini"><i class="icon-cog"></i> 修改
                            </button>
                            <button onclick="delArticleType('${(articleType.articleTypeId)!}')" type="button"
                                    class="btn btn-mini"><i class="icon-remove"></i> 删除
                            </button>
                        </td>
                    </tr>
                </#list>
                </tbody>
            </table>
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

<div class="modal fade" id="articleTypeUpdateModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/wxk1991/article/update" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                                class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="articleTypeTitle">修改文章类型 </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="articleTypeId" id="articleTypeId">
                    <div class="form-group">
                        <label for="articleTypeName">类型名称：</label>
                        <input type="text" class="form-control" disabled="disabled" id="articleTypeName"
                               placeholder="类型名称">
                    </div>
                    <div class="form-group">
                        <label for="articleTypeSort">类型排序：</label>
                        <input type="number" class="form-control" id="articleTypeSort"
                               placeholder="类型排序">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="articleUpdateAction()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function articleUpdateAction() {
        let articleTypeId = $("#articleTypeId").val();
        let articleTypeName = $("#articleTypeName").val();
        let articleTypeSort = $("#articleTypeSort").val();
        if (!checkNotNull(articleTypeId)) {
            $.post("/wxk1991/article/type/add", {
                    articleTypeName: articleTypeName,
                    articleTypeSort: articleTypeSort,
                },
                function (data) {
                    if (data.code == 200) {
                        alert(data.message)
                        location.reload();
                        return;
                    }
                    zuiMsg(data.message);
                });
        }else {
        $.post("/wxk1991/article/type/update", {
                    articleTypeId: articleTypeId,
                    articleTypeName: articleTypeName,
                    articleTypeSort: articleTypeSort,
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

    function addOrUpdateArticleType(articleTypeId, articleTypeName, articleTypeSort) {
        $('#articleTypeUpdateModal').modal('toggle', 'center');
        $("#articleTypeId").val(articleTypeId);
        $("#articleTypeName").val(articleTypeName);
        $("#articleTypeSort").val(articleTypeSort);
        if (!checkNotNull(articleTypeId)){
            $("#articleTypeName").removeAttr("disabled");
            $("#articleTypeTitle").text("添加文章类型");
        }else {
            $("#articleTypeTitle").text("修改文章类型");

        }
    }

    function delArticleType(articleTypeId) {
        if (confirm("是否删除")) {
            if (!checkNotNull(articleTypeId)) {
                new $.zui.Messager('程序出错，请刷新页面重试', {
                    type: 'warning',
                    placement: 'center'
                }).show();
                return;
            }
            $.post("/wxk1991/article/type/del", {
                    articleTypeId: articleTypeId
                },
                function (data) {
                    if (data.code == 200) {
                        alert(data.message)
                        location.reload();
                        return;
                    }
                    new $.zui.Messager(data.message, {
                        type: 'warning',
                        placement: 'center'
                    }).show();
                });
        }
    }

</script>
<#include "../import/bottom.ftl">