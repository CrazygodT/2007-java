<%--
  Created by IntelliJ IDEA.
  User: 长虹桥北
  Date: 2020/11/27
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
    <script src="/js/jquery-3.3.1.js"></script>
</head>
<body>
<div>
    <form class="layui-form" action="" lay-filter="example">
        <input type="hidden" name="id">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <input type="text" name="goodsName" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">商品价格</label>
            <div class="layui-input-block">
                <input type="text" name="price" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">评分</label>
            <div class="layui-input-block">
                <input type="text" name="score" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">生产日期</label>
            <div class="layui-input-block">
                <input type="datetime" name="deployDate" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图片</label>
            <div class="layui-input-block">
                <input type="text" name="imgPath" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <input type="text" name="comment" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类别ID</label>
            <div class="layui-input-block">
                <input type="text" name="typeId" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品类别名称</label>
            <div class="layui-input-block">
                <input type="text" name="typename" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">类别</label>
            <div class="layui-input-block">
                <input type="text" name="level" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">父类别id</label>
            <div class="layui-input-block">
                <input type="text" name="pid" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-setval">赋值</button>
                <button type="button" class="layui-btn layui-btn-normal" id="LAY-component-form-getval">取值</button>
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });



        //监听提交
        form.on('submit(demo1)', function(data){
            $.ajax({
                url:'/good/update',
                data:JSON.stringify(data.field),
                type:'post',
                dataType: 'json',
                contentType:"application/json",
                success:function(res){
                    if(res==1){
                        window.location.href="index.jsp"
                    }
                },
                error:function(){
                    alert("修改失败")
                }
            })
            return false;
        });

        //表单赋值
        layui.$('#LAY-component-form-setval').on('click', function(){
            var id = window.localStorage.getItem("id");
            $.ajax({
                type:'get',
                url:'/good/findById',
                data:{id:id},
                dataType:'json',
                success:function (data) {
                    form.val('example', {
                        "goodsName":data.goodsName,
                        "price":data.price,
                        "score":data.score,
                        "deployDate":data.deployDate,
                        "imgPath":data.imgPath,
                        "comment":data.comment,
                        "typeId":data.typeId,
                        "typename":data.typename,
                        "level":data.level,
                        "pid":data.pid,
                        "id":data.id,

                    });
                },
                error:function(){
                    alert("赋值失败")
                }
            })
        });

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</body>
</html>
