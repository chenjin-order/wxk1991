<#include "../import/adminTop.ftl">

<div class="panel col-sm-2">
    <div class="panel-body">
        <h4 id="adTypeCogInfo">添加广告类型</h4>
        <form class="form-horizontal">
            <div class="form-group">
                <input type="text" class="form-control" name="adTypeTitle" id="adTypeTitle" placeholder="类型名称">

                <input type="text" class="form-control" name="adTypeTag" id="adTypeTag" placeholder="密码">

                <input type="text" class="form-control" name="adTypeSort" id="adTypeSort" placeholder="密码">
            </div>

        </form>
    </div>
</div>

<div class="panel col-sm-10">
    <div class="panel-body">
        <form class="form-horizontal">
            <div class="form-group">
                <div class="col-md-6 col-sm-10">
                    <label for="adTypeId" class="col-sm-2">广告类型
                        <select class="form-control" id="adTypeId" name="adTypeId">
                            <#if adTypeList?? && adTypeList?size gt 0>
                                <#list adTypeList as adType>
                                    <option value="${(adType.adTypeId)!}">${(adType.adTypeTitle)!}</option>
                                </#list>
                            </#if>
                        </select>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="adTitle" class="col-sm-2">广告标题</label>
                <div class="col-md-6 col-sm-10">
                    <input type="text" class="form-control" name="adTitle" id="adTitle" placeholder="广告标题">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="panel col-sm-2">
    <div class="panel-body" style="padding: 5px">


        <ul class="list-group">
            <#if adTypeList?? && adTypeList?size gt 0>
                <#list adTypeList as adType>
                    <li class="list-group-item">
                        <a href="/wxk1991/ad/list?adTypeId=${(adType.adTypeId)!}">
                            ${(adType.adTypeTitle)!}
                        </a>
                        <button onclick="adTypeUpdate(
                                '${(adType.adTypeId)!}',
                                '${(adType.adTypeTitle)!}',
                                '${(adType.adTypeTag)!}',
                                '${(adType.adTypeSort)!}'
                                )" type="button" class="btn btn-mini">
                            <i class="icon icon-cog"></i>
                        </button>
                    </li>
                </#list>
            </#if>
        </ul>
    </div>
</div>
<div class="panel col-sm-10">
    <div class="panel-body">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>广告图片</th>
                <th>广告类型</th>
                <th>广告标题</th>
                <th>广告开始时间</th>
                <th>广告结束时间</th>
                <th>添加广告时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list adVoList as adVo>
                <tr>
                    <td>
                        <img src="${(adVo.adImgUrl)!'/img/null_logo.png'}" class="thumbnail" alt="广告图片">
                    </td>
                    <td>${(adVo.adTypeTitle)!}</td>
                    <td>${(adVo.adTitle)!}</td>
                    <td>${(adVo.adBeginTime)!?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td>${(adVo.adEndTime)!?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td>${(adVo.adAddTime)!?string("yyyy-MM-dd HH:mm:ss")}</td>
                    <td>
                        <div>
                            <button onclick="adUpdate(
                                    '${(adVo.adId)!}',
                                    '${(adVo.adTypeId)!}',
                                    '${(adVo.adTitle)!}',
                                    '${(adVo.adImgUrl)!}',
                                    '${(adVo.adLinkUrl)!}',
                                    '${(adVo.adSort)!}',
                                    '${(adVo.adBeginTime)!?string("yyyy-MM-dd HH:mm:ss")}',
                                    '${(adVo.adEndTime)!?string("yyyy-MM-dd HH:mm:ss")}'
                                    )" class="btn btn-mini" type="button">修改
                            </button>
                            <button onclick="delArticle('${(adVo.adId)!}')" type="button"
                                    class="btn btn-mini"><i class="icon-remove"></i> 删除
                            </button>
                            <a target="_blank" href="${(adVo.adLinkUrl)!}"
                               class="btn btn-mini"><i class="icon icon-eye-open"></i>查看</a>
                        </div>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>

    </div>
</div>

<script>
    function adTypeUpdate(adTypeId, adTypeTitle, adTypeTag, adTypeSort) {

    }

    function adUpdate(adId, adTypeId, adTitle, adImgUrl, adLinkUrl, adSort, adBeginTime, adEndTime) {

    }


</script>

<#include "../import/bottom.ftl">