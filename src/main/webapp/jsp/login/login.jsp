<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	    <base href="<%=basePath%>">
		<title>登录界面</title>
		<link rel="stylesheet" href="<%=path%>/css/reset.css" />
		<link rel="stylesheet" href="<%=path%>/css/common.css" />
		<link rel="stylesheet" href="<%=path%>/css/font-awesome.min.css" />
		<script type="text/javascript" src="<%=path%>/js/jquery.min.js" ></script>
		<script type="text/javascript" src="<%=path%>/js/common.js" ></script>
	    <script src="<%=path %>/js/jquery.js"></script>
	</head>
	<body>
		<div class="wrap login_wrap">
			<div class="content">
				<div class="logo"></div>
					<div class="login-xf">
						<div class="lx-nei">
							<ul>
								<li class="yhdl1">用户登录<input id="error" type="text" style="border: none;color: red;margin-left: 30px;width: 180px;background-color:#fff;"value="" disabled="true"/></li>
								<li class="yhm">
									<input id="username" maxlength="11"  type="text" placeholder="用户名/手机号/身份证号/邮箱" onblur="checkUsername()"><span></span>
								</li>
								<li class="yhm1">
									<input id="pwd" type="password" placeholder="密码" onblur="checkPwd()"> <span></span>
								</li>
								<li class="yzmtr">
									<input id="yzm" type="text" maxlength="4" size="30" placeholder="验证码" onblur="checkYZM()">
									<img id="yzmImg" width="101"  height="36" src="<%=path%>/user/codeImage" onclick="changeYzm()">
									<a href="javascript:void(0);" style="margin-left: -5px;" onclick="changeYzm()">换一换</a>
								</li>
								<li class="mouth1">
									<span class="one"><a href="<%=path%>/user/alterPassword">忘记密码</a></span>
									<span class="one" style="margin-left: 200px;"><a href="<%=path%>/user/register">注册</a></span>
								</li>
								<li class="dl">
									<input type="button" value="登录" onclick="login()">
								</li>
							</ul>
						</div>
					</div>
				</div>
		</div>
		<div style="text-align:center;">
</div>
        <input type="hidden" id="url"/>
        <div class="success" id="show">
            <div >
                <div class="cgxd3">
                    <div class="cgxd-main" style="padding-top:30px;">
                        <p class="xdcg"><img src="<%=path%>/img/dlcg.png">  </p>
                        <p class="ddbh"><em id="em"></em></p>
                    </div>
                </div>
            </div>
        </div>
		<script type="text/javascript">
            var checks = false;
            var error = document.getElementById("error");
            var username  = document.getElementById("username");
            var pwd  = document.getElementById("pwd");
            var yzm = document.getElementById("yzm");
            $(function(){
                $("#username").keyup(function (event){
                    if (13 === event.keyCode) {
                        if(checkUsername()){
                            $("#pwd").focus();
                        }
                    }
                });
                $("#pwd").keyup(function (event){
                    if (13 === event.keyCode) {
                        if (checkPwd()){
                            $("#yzm").focus();
                        }
                    }
                });
                $("#yzm").keyup(function (event){
                    if (13 === event.keyCode) {
                        login();
                    }
                });
            });

            function changeYzm(){
                $("#yzmImg").attr("src","<%=path%>/user/codeImage?x=" + Math.random());
            }

            function checkYZM() {
                if (yzm.value === "") {
                    error.value = "验证码不能为空";
                    checks = false;
                } else {
                    $.post("<%=path %>/user/checkCodeImage",
                        {"code": yzm.value},
                        function (result) {
                            if (result == null) {
                                error.value = "验证码错误";
                                checks = false;
                            }
                            if (result.status === "true" || result.status === true) {
                                error.value = "";
                                checks = true;
                            } else {
                                error.value = "验证码错误";
                                checks = false;
                            }
                        }, "json");
                }
            }
            function checkUsername(){
                var identitycardcheck = !!(username.value).match(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/);
                var usernamecheck = !!(username.value).match(/^[a-zA-Z]{1}\w*$/);
                var phoneNumCheck = !!(username.value).match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
                var emailcheck = !!(username.value).match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$/);
                if(!phoneNumCheck&&!usernamecheck&&!identitycardcheck&&!emailcheck){
                    error.value = "用户名输入有误";
                    checks = false;
                    return false;
                }else{
                    error.value = "";
                    checks = true;
                    return true;
                }
            }
            function checkPwd(){
                if(pwd.value===""||pwd.value.length<6){
                    error.value = "密码输入有误";
                    checks = false;
                    return false;
                }else{
                    error.value = "";
                    checks = true;
                    return true;
                }
            }
            function login(){
                checkUsername();
                if(checks){
                    checkPwd();
                    if(checks){
                        if(yzm.value==""){
                            error.value = "验证码不能为空";
                            checks = false;
                        }else{
                            $.post("<%=path %>/user/checkCodeImage",
                                {"code":yzm.value},
                                function(result){
                                    if(result == null){
                                        error.value = "验证码错误";
                                        checks = false;
                                    }
                                    if(result.status==="true"||result.status===true){
                                        $.post("<%=path %>/user/checkLogin",
                                            {"username":username.value,"pwd":pwd.value},
                                            function(result){
                                                if(result == null){
                                                    error.value = result.message;
                                                }
                                                if(result.status==="true"||result.status===true){
                                                    var url = "";
                                                    if(result.message ==null){
                                                        url = "/index/toindex";
                                                    }else{
                                                        url = result.message;
                                                    }
                                                    url ="<%=path%>"+url;
                                                    document.getElementById("url").value = url;
                                                    divshow(5);
                                                }else{
                                                    changeYzm();
                                                    error.value = result.message;
                                                }
                                            },"json");
                                    }else{
                                        error.value = "验证码错误";
                                        checks = false;
                                    }
                                },"json");
                        }
                    }
                }
            }
			function countDown(secs,surl){
                    var loginok = document.getElementById("em");
                    loginok.innerHTML ="";
                    loginok.innerHTML="登录成功！"+secs+"后将跳转到原网页,<a href='javascript:void(0)' onclick='divshow(0)' style='color: red;'>立即跳转</a>";
                    if(--secs>0){
                        setTimeout("countDown("+secs+",'"+surl+"')",1000);
                    }
                    else{
                        location.href=surl;
                    }
                }
			function divshow(time){
                    var url = $("#url").val();
                    document.getElementById("show").style.display="block";
                    countDown(time,url);
                }
		</script>
	</body>
</html>
