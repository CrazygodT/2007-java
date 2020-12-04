<%--
  Created by IntelliJ IDEA.
  User: 长虹桥北
  Date: 2020/11/26
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
    <script src="/js/jquery-3.3.1.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">商品管理</a></dd>
                        <dd><a href="">管理</a></dd>
                        <dd><a href="">管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">

            <table class="layui-hide" id="test" lay-filter="demo"></table>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../src/layui.js"></script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'/good/findAll'
            ,cols: [[
                {field:'id', width:80, title: '商品ID', sort: true}
                ,{field:'goodsName', width:80, title: '商品名称'}
                ,{field:'price', width:80, title: '商品价格'}
                ,{field:'score', width:80, title: '评分'}
                ,{field:'deployDate', title: '生产日期', width:80}
                ,{field:'imgPath', title: '图片', width:80}
                ,{field:'comment', title: '备注信息', width:80}
                ,{field:'typeId', title: '商品类别ID', width:80}

                ,{field:'typename', title: '商品类别名称', width:80}
                ,{field:'level', title: '类别级别', width:80}
                ,{field:'pid', title: '父类别ID', width:80}



                ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
            ]]
            ,page: true
        });

    });
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.id + ' 的查看操作');
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        type:'post',
                        url:'/good/delete',
                        data:{id:data.id},
                        dataType:'json',
                        // data:JSON.stringify({id:data.id}),
                        // contentType:"applection/json",
                        success:function (data) {
                            if (data==1) {
                                obj.del();
                                layer.close(index);
                            }
                        },
                        error:function () {
                            alert("删除失败")
                        }
                    })

                });
            } else if(obj.event === 'edit'){
                //layer.alert('编辑行：<br>'+ JSON.stringify(data))
                window.location.href="/good.jsp";
                window.localStorage.setItem("id",data.id);
            }
        });
    });
</script>
</body>
</html>
