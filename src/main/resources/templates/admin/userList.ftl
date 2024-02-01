<#include "../import/adminTop.ftl">
<div class="panel">
    <div class="panel-body">
        <form class="form-horizontal" action="/wxk1991/user/list" method="get">
            <div class="form-group">
                <label for="userName" class="col-sm-1">用户名</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="userName" id="userName" placeholder="用户名">
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-success">查询</button>
                </div>
                <div class="col-sm-1">
                    <a href="/wxk1991/user/list" class="btn btn-success">查询全部</a>
                </div>
            </div>
        </form>
    </div>
</div>

<#if userPage?? && userPage.list?size gt 0 >
    <h4><i class="icon-info-sign"></i> 提示：被冻结的用户无法登陆</h4>
    <div class="panel">
        <div class="panel-body">
            <table class="table">
                <thead>
                <tr>
                    <th>注册时间</th>
                    <th>用户名</th>
                    <th>状态</th>

                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list userPage.list as user>
                    <tr>
                        <td>${(user.userRegisterTime)?string("yyyy-MM-dd HH:mm:ss")}</td>
                        <td>${(user.userName)!}</td>
                        <td>
                            <#if (user.userFrozen)?? && (user.userFrozen)==1>
                                <span class="label label-danger">冻结</span>
                            <#else >
                                <span class="label label-success">正常</span>
                            </#if>
                        </td>
                        <td>
                            <button
                                    onclick="userUpdate('${(user.userId)!}','${(user.userName)!}','${(user.userFrozen)!}')"
                                    type="button" class="btn btn-mini"><i class="icon-cog"></i> 修改
                            </button>
                            <button onclick="delUser('${(user.userId)!}')" type="button" class="btn btn-mini"><i
                                        class="icon-remove"></i> 删除
                            </button>
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

                    <#if userPage.pageNumber lte 1>
                        <li class="previous disabled">
                            <a href="javascript:void(0)"><i class="icon-chevron-left"></i></a>
                        </li>
                    <#else>
                        <li class="previous" onclick="getNewData('${userPage.pageNumber-1}')">
                            <a href="javascript:void(0)"><i class="icon-chevron-left"></i></a>
                        </li>
                    </#if>
                    <li>
                        <a href="javascript:void(0)" class="btn">
                            ${userPage.pageNumber}页/共${userPage.totalPage}</a>
                    </li>
                    <#if userPage.pageNumber gte userPage.totalPage>
                        <li class="next disabled">
                            <a href="javascript:void(0)"><i class="icon-chevron-right"></i></a>
                        </li>
                    <#else>
                        <li class="next" onclick="getNewData('${userPage.pageNumber+1}')">
                            <a href="javascript:void(0)"><i class="icon-chevron-right"></i></a>
                        </li>
                    </#if>
                    <li class="previous" onclick="getNewData('${userPage.totalPage}')">
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

<div class="modal fade" id="userUpdateModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/wxk1991/user/update" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                                class="sr-only">关闭</span></button>
                    <h4 class="modal-title">修改用户</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="userId" id="userId">
                    <div class="form-group">
                        <label for="userNameUpdate">用户名：</label>
                        <input type="text" class="form-control" disabled="disabled" id="userNameUpdate"
                               placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="userPassword">用户密码：</label>
                        <input type="password" class="form-control" name="userPassword" id="userPassword"
                               placeholder="用户密码">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputMoney1">是否冻结</label>
                        <div class="input-group">
                            <label class="radio-inline">
                                <input type="radio" name="userFrozen" value="0" checked="checked"> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="userFrozen" value="1"> 冻结
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" onclick="userUpdateAction()" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    function userUpdateAction() {
        let userId = $("#userId").val();
        let userName = $("#userNameUpdate").val();
        let userPassword = $("#userPassword").val();
        let userFrozen = $("input[name='userFrozen']:checked").val();
        if (!checkNotNull(userId)) {
            zuiMsg("程序出错，请刷新页面重试");
            return;
        }
        if (!checkNotNull(userFrozen)) {
            zuiMsg("请选择是否冻结用户");
            return;
        }
        $.post("/wxk1991/user/update", {
                userId: userId,
                // userName: userName,
                userPassword: userPassword,
                userFrozen: userFrozen
            },
            function (data) {
                if (data.code == 200) {
                    alert(data.message)
                    location.reload();
                    return;
                }
                zuiMsg(data.message);
            })
    }

    function userUpdate(userId, userName, userFrozen) {
        $('#userUpdateModal').modal('toggle', 'center');
        $("#userId").val(userId);
        $("#userNameUpdate").val(userName);
        $(":radio[name='userFrozen'][value='" + userFrozen + "']").prop("checked", "checked");
    }

    function delUser(userId) {
        if (confirm("是否删除")) {
            if (!checkNotNull(userId)) {
                new $.zui.Messager('程序出错，请刷新页面重试', {
                    type: 'warning',
                    placement: 'center'
                }).show();
                return;
            }
            $.post("/wxk1991/user/del", {
                    userId: userId
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


    function getNewData(pageNumber) {
        if (!checkNotNull(pageNumber)) {
            pageNumber = 1;
        }
        window.location.href = "/wxk1991/user/list?pageNumber=" + pageNumber + "<#if (userName?? && userName?length>0)>&userName=${userName!}</#if>";
    }

    function renderPage() {
        let renderPageNumber = $("#renderPageNumber").val();
        if (!checkNotNull(renderPageNumber)) {
            new $.zui.Messager('请输入跳转的页码', {
                type: 'warning',
                placement: 'center'
            }).show();
            return;
        }
        let totalPage = '${userPage.totalPage}';
        if (parseInt(renderPageNumber) > parseInt(totalPage)) {
            renderPageNumber = totalPage;
        }
        getNewData(renderPageNumber);
    }


</script>
<#include "../import/bottom.ftl">