<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
        <base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>注册界面</title>
		<link rel="stylesheet" href="<%=path %>/css/reset.css" />
		<link rel="stylesheet" href="<%=path %>/css/common.css" />
		<link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css" />
        <!-- 表单验证start -->
        <script type="text/javascript" src="<%=path%>/js/jquery.min.js" ></script>
        <script type="text/javascript" src="<%=path%>/js/common.js" ></script>
        <script src="<%=path %>/js/jquery.js"></script>
        <script src="<%=path %>/js/jquery.validate.js"></script>
        <script src="<%=path%>/js/jquery.metadata.js"></script>
        <!-- 表单验证stop -->
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">

				<div class="logo"></div>
                <div class="reg">
                    <div class="reg-main">
                        <p class="top"><img src="<%=path%>/img/09.png">注册新用户 <i>已有帐号？去<a href="<%=path %>/user/Tologin">登录</a> > </i></p>
                        <form action="<%=path %>/user/checkPhone" id="reguserForm">
                            <table>
                                <tr>
                                    <td class="with">用户名</td>
                                    <td colspan="2"><input type="text" id="username"  name="username" size="32" maxlength="20" placeholder="请输入用户名"  onblur="checkUsername(null,false)"><i style="color: black">必须以字母开头且字母、数字、下划线(_)随意组合</i></td>
                                    <td  class="status" style="color: red" id="td1"></td>
                                </tr>
                                <tr>
                                    <td class="with">手机号</td>
                                    <td colspan="2"><input type="text" id="mobile"  name="mobile" size="32" maxlength="11" placeholder="请输入11位手机号码"  onblur="checkMobile(null,false)"><i style="color: black">*</i></td>
                                    <td  class="status" style="color: red" id="td2"></td>
                                </tr>
                                <tr>
                                    <td class="with">身份证号</td>
                                    <td colspan="2"><input type="text" id="identitycard"  name="identitycard" size="32" maxlength="18" placeholder="请输入您的身份证号"  onblur="checkIdentitycard(null,false)"><i style="color: black">*</i></td>
                                    <td  class="status" style="color: red" id="td3"></td>
                                </tr>
                                <tr>
                                    <td class="with">邮箱</td>
                                    <td colspan="2"><input name="email" id="email" type="text" size="70" placeholder="请输入邮箱地址" onblur="checkEmail(null,false)"><i style="color: black">*</i>
                                    </td>
                                    <td class="status" style="color: red" id="td4"></td>
                                </tr>
                                <tr>
                                    <td class="with">密码</td>
                                    <td colspan="2">
                                        <input type="password"  size="70"  placeholder="请输入原始密码" name="password" id="password" class="{required:true,minlength:6}" maxlength="16"><i style="color: black">*</i>
                                    </td>
                                    <td class="status" style="color: red"></td>
                                </tr>
                                <tr>
                                    <td  class="with" >确认密码</td>
                                    <td colspan="2">
                                        <input type="password" size="70" name="repassword"  placeholder="请再次输入原始密码"  class="{required:true,minlength:6,equalTo:'#password'}" maxlength="16"><i style="color: black">*</i>
                                    </td>
                                    <td class="status" style="color: red"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2">
                                        <input type="button" value="马上注册" class="mszc" onclick="subForm()">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
			</div>
		</div>
		<div style="text-align:center;">
</div>
        <div id="show" class="tcc12 none" style="display: none;">
            <div class="tx-ydm">
                <p class="tx-sm"><span class="one"><img src="<%=path%>/img/tx.png">提示</span><span class="two"><img src="<%=path%>/img/14_01.png" class="close"></span></p><br/><br/><br/>
                <p align="center">恭喜你，注册成功</p><br/><br/><br/>
                <p align="center">点击<a href="<%=path %>/user/Tologin">登录</a>进入登录页面</p>
            </div>
        </div>
        <div id="show2" class="tcc12"   style="display: none;">
            <div class="tx-ydm" style="margin-top:250px;">
                <p class="tx-sm"><span class="one"><img src="<%=path%>/img/tx.png">提示</span><span class="two"><img src="<%=path%>/img/14_01.png" class="close"></span></p><br/><br/><br/>
                <p align="center">哦。。。发生了点小意外，不好意思</p><br/><br/><br/>
                <p align="center">点击<a href="<%=path %>/user/register">注册</a>刷新页面</p>
            </div>
        </div>
            <script type="text/javascript">
            $(document).ready(function(){
                $("#reguserForm").validate({
                    errorPlacement: function(error,element) {
                        if ( element.is(":radio") )
                            error.appendTo( element.parent().next().next() );
                        else if ( element.is(":checkbox") )
                            error.appendTo ( element.next() );
                        else
                            error.appendTo( element.parent().next() );
                    },
                    success:function (succ,element) {
                        if(element.name === "password"){
                            succ.text("密码格式输入正确");
                        }else if(element.name === "repassword"){
                            succ.text("确认密码输入正确");
                        }
                    }
                });
                jQuery.extend(jQuery.validator.messages, {
                    required: "&nbsp;&nbsp;该字段不能为空",
                    minlength: jQuery.validator.format("&nbsp;&nbsp;请输入一个长度最少是 {0} 的字符串"),
                    equalTo:"&nbsp;&nbsp;两次输入密码不一致"
                });
                $(".close").click(function(){
                    $(".tcc").css("display","none");
                    window.location.href="<%=path%>/user/register";
                });
            });

            //检验手机号码是否已经被注册
            function checkMobile(callback,isCheck){
                var mobile = document.getElementById("mobile").value;
                var check = !!mobile.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
                var td2 = document.getElementById("td2");
                if(mobile===""){
                    td2.innerHTML="&nbsp;&nbsp;手机号不能为空！";
                }else if(check===false){
                    td2.innerHTML="&nbsp;&nbsp;格式不正确或手机号不可注册！";
                }else{
                    $.ajax({
                        url : "<%=path %>/user/checkPhone",
                        data:{"phone":mobile},
                        type:"post",
                        dataType:"json",
                        success:function (result) {
                            if(result == null){
                                td2.innerHTML = "&nbsp;&nbsp该号码无法注册,请更换！";
                            }
                            if(result.status==="true"||result.status===true){
                                td2.innerHTML = result.message;
                                if (callback!=null){
                                    callback(true,isCheck);
                                }
                            }else{
                                td2.innerHTML = result.message;
                            }
                        }
                    });
                }
            }
            //检查用户名可用性
            function checkUsername(callback,isCheck){
                var username = document.getElementById("username").value;
                var check = !!username.match(/^[a-zA-Z]{1}\w*$/);
                var td1 = document.getElementById("td1");
                if(username===""){
                    td1.innerHTML="&nbsp;&nbsp;用户名不能为空！";
                }else if(check===false){
                    td1.innerHTML="&nbsp;&nbsp;格式不正确！";
                }else{
                    $.ajax({
                        url : "<%=path %>/user/checkUsername",
                        data:{"username":username},
                        type:"post",
                        dataType:"json",
                        success:function (result) {
                            if(result == null){
                                td1.innerHTML = "&nbsp;&nbsp该用户名无法应用,请更换！";
                            }
                            if(result.status==="true"||result.status===true){
                                td1.innerHTML = result.message;
                                if (callback!=null){
                                    callback(true,isCheck);
                                }
                            }else{
                                td1.innerHTML = result.message;
                            }
                        }
                    });
                }
            }
            //检查身份证号是否被注册
            function checkIdentitycard(callback,isCheck) {
                var identitycard = document.getElementById("identitycard").value;
                var check = !!identitycard.match(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/);
                var td3 = document.getElementById("td3");
                if(identitycard===""){
                    td3.innerHTML="&nbsp;&nbsp;身份证号不能为空！";
                }else if(check===false){
                    td3.innerHTML="&nbsp;&nbsp;格式不正确！";
                }else{
                    $.ajax({
                        url : "<%=path %>/user/checkIdentitycard",
                        data:{"identitycard":identitycard},
                        type:"post",
                        dataType:"json",
                        success:function (result) {
                            if(result == null){
                                td3.innerHTML = "&nbsp;&nbsp该身份证号无法应用,请更换！";
                            }
                            if(result.status==="true"||result.status===true){
                                td3.innerHTML = result.message;
                                if (callback!=null){
                                    callback(true,isCheck);
                                }
                            }else{
                                td3.innerHTML = result.message;
                            }
                        }
                    });
                }
            }
            //检查邮箱是否可用
            function checkEmail(callback,isCheck) {
                var email = document.getElementById("email").value;
                var check = !!email.match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$/);
                var td4 = document.getElementById("td4");
                if(email===""){
                    td4.innerHTML="&nbsp;&nbsp;邮箱不能为空！";
                }else if(check===false){
                    td4.innerHTML="&nbsp;&nbsp;格式不正确！";
                }else{
                    $.ajax({
                        url : "<%=path %>/user/checkEmail",
                        data:{"email":email},
                        type:"post",
                        dataType:"json",
                        success:function (result) {
                            if(result == null){
                                td4.innerHTML = "&nbsp;&nbsp该邮箱无法应用,请更换！";
                            }
                            if(result.status==="true"||result.status===true){
                                td4.innerHTML = result.message;
                                if (callback!=null){
                                    callback(true,isCheck);
                                }
                            }else{
                                td4.innerHTML = result.message;
                            }
                        }
                    });
                }
            }
            //提交表单的验证
            function subForm() {
                var valid = $("#reguserForm").valid();
                if (valid) {
                    checkMobile(registerSubmit(true));
                }
            }

            //提交表单信息
            function registerSubmit(result){
                if(result){
                    var mobile = document.getElementById("mobile").value;
                    var email = document.getElementById("email").value;
                    var pwd = document.getElementById("password").value;
                    var username=document.getElementById("username").value;
                    var identitycard=document.getElementById("identitycard").value;
                    $.post("<%=path %>/user/registerSubmit",
                        {"username":username,"phone":mobile,"email":email,"identitycard":identitycard,"pwd":pwd},
                        function(result){
                            if(result == null){
                                registerNo();
                            }
                            if(result.status==="true"||result.status===true){
                                registerOk();
                            }else{
                                registerNo();
                            }
                        },"json");
                }
            }

            //注册成功
            function registerOk(){
                var show = document.getElementById("show");
                show.style.display="block";
            }
            function registerNo(){
                var show2 = document.getElementById("show2");
                show2.style.display="block";
            }
        </script>
	</body>
</html>
