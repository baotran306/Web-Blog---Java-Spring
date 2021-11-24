<%--
  Created by IntelliJ IDEA.
  User: Tran Quoc Bao
  Date: 11/2/2021
  Time: 4:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Xác thực tài khoản</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="assets/customer/css/style.css">

</head>
<body>
<c:if test="${message!=null }">
    <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Xác thực thất bại!</strong> ${message}
    </div>
</c:if>

<div class="d-flex " style='height:100vh;  '>
    <form action="admin/check-verify-number.htm" id='formCheckVerifyNumber' method='post' style='margin:auto;border:1px solid #ccc;padding: 60px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);'>
        <div>
            <h3 class='text-center w-100 mb-5'>Nhập mã xác thực</h3>
        </div>
        <div class='d-flex'>
            <input id="inputVerifyNumber" name="inputVerifyNumber"  type="text" placeholder="Nhập mã xác thực: 123456" class="form-control">
            <button name="btnSendMail" type='submit' class='btn btn-primary btn-sm' style='display:inline-block;width:200px;margin-left:20px;'>
                Gửi lại mã
            </button>

        </div>
        <button name="btnSubmit" type='submit' class='btn btn-success w-100 mt-4' >
            Xác nhận
        </button>
    </form>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script  type="text/javascript">
    setTimeout(()=>$(".alert").hide(),2000)

</script>
</body>
