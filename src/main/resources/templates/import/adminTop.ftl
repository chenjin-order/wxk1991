<#include "./top.ftl">
<div class="container">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target=".navbar-collapse-example">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">首页</a>
            </div>
            <div class="collapse navbar-collapse navbar-collapse-example">
                <ul class="nav navbar-nav">
                    <li><a href="/wxk1991/"><i class="icon icon-list-ol"></i>基础数据</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon icon-group"></i>用户管理<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/wxk1991/user/list">用户列表</a></li>
                        </ul>
                    </li><li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon icon-th-list"></i>文章管理<b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="/wxk1991/article/type/list">文章类型</a></li>
                            <li><a href="/wxk1991/article/tag/list">文章标签</a></li>
                            <li><a href="/wxk1991/article/list">文章管理</a></li>
                        </ul>
                    </li>
                    <li><a href="/wxk1991/link/list"><i class="icon icon-smile"></i>友情链接</a></li>
                    <li><a href="/wxk1991/ad/list"><i class="icon icon-dollar"></i>广告管理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="your/nice/url"><i class="icon icon-signout"></i>退出登录</a></li>
                </ul>
            </div>
        </div>
    </nav>
