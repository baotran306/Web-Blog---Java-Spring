<%--
  Created by IntelliJ IDEA.
  User: Tran Quoc Bao
  Date: 11/2/2021
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%--    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="assets/customer/css/style.css">
	<style type="text/css">
		.form-group{
			position: relative;
		}
		.form-group i.fa-exclamation-circle{
			visibility: hidden;
		}
		.form-group small{
			visibility: hidden;
		}
		.form-group.error small{
			visibility: visible;
			position:absolute;
			left:0px;
			bottom:-20px;
			color: red;
			font-size: 16px
		}
		.form-group.error i.fa-exclamation-circle{
			visibility: visible;
			position:absolute;
			right:5px;
			top:45px;
			color: red;
			font-size: 14px;
		}
		.form-group.error input{
			border-color: red;
		}
		.form-group.success i.fa-exclamation-circle{
			visibility: hidden;
		}
		.form-group.success small{
			isibility: hidden;
		}
	</style>
</head>
<body>

<div class="d-flex " style='height:100vh;  '>
    <form action="admin/reset-password.htm" id='formResetPassword' method='post' style='margin:auto;border:1px solid #ccc;padding: 50px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);'>
        <div class="form-group" style=''>
            <label for="newPassword" class="form-label">Nhâp mật khẩu</label>
            <input id="newPassword" name="newPassword"  type="password" placeholder="VD: bao_anc@gmail.com" class="form-control">
            <span class="form-message"></span>
        </div>
        <div class="form-group" style=''>
            <label for="passwordRetype" class="form-label">Nhập lại mật khẩu mới</label>
            <input id="passwordRetype" name="passwordRetype" type="password" class="form-control">
            <i class="fas fa-exclamation-circle"></i>
            <small>Error message</small>
        </div>
        <button type='submit' id="submit" class='btn btn-success w-100 mt-4' >
            Đổi mật khẩu
        </button>
    </form>
</div>
<script type="text/javascript">

		var newPassword = document.getElementById("submit");
		function checkInput(){
			var check=true;
			var newPassword = document.getElementById("newPassword");
			const passwordRetype = document.getElementById("passwordRetype");
				if(newPassword.value===passwordRetype.value||passwordRetype.value===null){
					cosole.log(passwordRetype.value);
					setSuccesFor(passwordRetype);
					check=true;
				}else{
					setErrorFor(passwordRetype, "Mật khẩu ko khớp!");
					check=false;
				}		
				return check;
		}
		function setErrorFor(input, message) {
			    const formControl = input.parentElement;
		
			    const small = formControl.querySelector('small');
		
			    small.innerText = message;
			    formControl.className = 'form-group error';
			}

		function setSuccesFor(input) {
		    const formControl = input.parentElement;
		    formControl.className = 'form-group success';
		}
		submit.addEventListener("click",function(event){
			if (checkInput() === true) {
				
	      } else {
	      	event.preventDefault();
	      }
		});
</script>
</body>
