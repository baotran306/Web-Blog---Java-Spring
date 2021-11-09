<%--
  Created by IntelliJ IDEA.
  User: Tran Quoc Bao
  Date: 11/2/2021
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%--    <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="stylesheet" href="assets/customer/css/style.css">

</head>
<body>

<c:if test="${message!=null }">
    <div class="alert alert-danger alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Đăng nhập thất bại!</strong> ${message}
    </div>
</c:if>

<div class="d-flex ">
    <div class='w-50  d-flex' style='height:100vh;justify-content: center;'>
        <img src="https://hoangvietduc.com/wp-content/uploads/2021/02/viet-Blog-la-gi-lam-Blogger-kiem-tien-the-nao.jpg" alt="Ảnh background"
             style='width: 600px;align-self: center;align-content: center;'
        >
    </div>
    <div class='w-50  d-flex' style='height:100vh;justify-self: center;'>
        <form action="admin/login.htm" id='formLoginAdmin' method='post' modelAttribute="admin" style='margin:auto;border:1px solid #ccc;width:400px;padding: 50px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);'>
            <h3>Đăng nhập</h3>
            <div class="form-group" style=''>
                <label for="username" class="form-label">Tài khoản</label>
                <input id="username" name="username"  rules='required' inputNoSpace type="text" placeholder="Nhập tài khoản" class="form-control">
                <span class="form-message"></span>
            </div>
            <div class="form-group" style=''>
                <label for="password" class="form-label">Mật khẩu</label>
                <input id="password" name="password" rules='required' inputNoSpace type="password" placeholder="Nhập mật khẩu" class="form-control">
                <span class="form-message"></span>
            </div>
            <button type='submit' class='btn btn-success w-100 mt-4' >
                Xác nhận
            </button>
            <div class='text-center mt-2'>
                <a href='admin/verify-email.htm?verifyEmail'  >Quên mật khẩu?</a>
            </div>
            <hr>
            <!--<div class='btn btn-primary mt-2' style='margin-left: 50%;transform: translateX(-50%);width:120px;'>
              Đăng kí
            </div> -->
        </form>
    </div>
</div>
<style>
    .form-group.invalid .form-control {
        border-color: #f33a58;
    }
    .form-group .form-control:focus {
        border-color: #80bdff;
    }
    .form-group.invalid .form-message {
        color: #f33a58;
    }

    .form-message {
        font-size: 10px;
        padding: 4px 0 0;
    }
</style>
<script>
    function isEmptyObj(object) {
        return Object.keys(object).length === 0?true:false;
    }
    function isObjhas(object, key) {
        if(isEmptyObj(object)) return false;
        return object ? hasOwnProperty.call(object, key) : false;
    }
    let validatorRules={
        required:function(value){
            return value?undefined:"Vui lòng nhập trường này";
        },
        email:function(value){
            let regex=/^[a-zA-Z]+[1-9a-zA-Z]*@([a-zA-Z]+\.)+[a-zA-Z]+$/g
            return regex.test(value)?undefined:'Email không đúng';
        },
        phone:function(value){
            let regex=/^(09|03|07|08|05)[0-9]{8}$/g
            return regex.test(value)?undefined:'Số điện thoại không đúng ';
        },
        digitAll:function(value){
            let regex=/^\d*$/g
            return regex.test(value)?undefined:'Nhập sai định dạng';
        },
        digits:function(limit){
            return function(value){
                let regexs={
                    '3':/^\d{3}$/,
                    '9':/^\d{9}$/,
                    '10':/^\d{10}$/,
                }
                return regexs[limit].test(value)?undefined:'Nhập sai định dạng';
            }
        },
        length:function(max){
            return function(value){
                return value.length==max?undefined:`Vui lòng nhập chính xác ${max} kí tự`;
            }
        },
        equal:function(selector){
            return function(value){
                let originEleValue=document.querySelector(selector).value
                return value==originEleValue?undefined:'Mật khẩu xác thực không chính xác'
            }
        },
        minLength:function(min){
            return function(value){
                return value.length>=min?undefined:`Vui lòng nhập ít nhất ${min} kí tự`;
            }
        },
        min:function(min){
            return function(value){
                return value>=min?undefined:`Vui lòng nhập lớn hơn hoặc bằng ${min}`;
            }
        },
        maxLength:function(max){
            return function(value){
                return value.length<=max?undefined:`Vui lòng nhập nhiều nhất ${max} kí tự`;
            }
        },
        max:function(max){
            return function(value){
                return value<=max?undefined:`Vui lòng nhập bé hơn hoặc bằng ${max}`;
            }
        },
        childMaxLength:function(max){
            return function(value){
                let kq=undefined;
                let childs=value.split(' ')
                for(let item of childs){
                    if(item.length<=max){

                    }else{
                        kq='Không hợp lệ'
                        break;
                    }
                }
                return kq;
            }
        },
    };
    let formRules={
    };
    function validator(formSelector,options={}){
        console.log('validator')
        console.log('validator validator')
        if(isObjhas(options,'run')){
            options.run()
        }

        let formElement = document.querySelector(formSelector)
        console.log(formElement)

        // no space character
        let inputNoSpace=formElement.querySelectorAll('[inputNoSpace]')
        for(let input of inputNoSpace){
            input.onkeydown=function(e){
                if(e.key==' '){
                    e.preventDefault();
                }
            }
        }
        // no 2 space character
        let inputNo2Space=formElement.querySelectorAll('[inputNo2Space]')
        for(let input of inputNo2Space){
            input.onkeydown=function(e){
                if(e.key==' '){
                    let value=e.target.value
                    if(value.length==0&&value[0]==' ') {
                        e.preventDefault();
                        return
                    }
                    if(value.length>0&&value[value.length-1]==' '){
                        e.preventDefault();
                        return
                    }
                }
            }
        }


        let inputs=formElement.querySelectorAll('[name][rules]')
        for(let  input of inputs){
            let rules=input.getAttribute('rules').split('|')
            for(let rule of rules){
                let ruleInfo
                let isRuleHasValue=rule.includes(':');
                if(isRuleHasValue){
                    ruleInfo=rule.split(':');
                    rule=ruleInfo[0]
                }
                let ruleFunc=validatorRules[rule]
                if(isRuleHasValue){
                    ruleFunc=ruleFunc(ruleInfo[1])
                }
                if(Array.isArray(formRules[input.name])){
                    formRules[input.name].push(ruleFunc)
                }else{
                    formRules[input.name]=[ruleFunc];
                }
            }
            // event listening
            input.onblur=handleValidate
            input.oninput=handleClearError
        }


        let btnSubmit=formElement.querySelector('[type="submit"]')
        formElement.onsubmit=function(e){
            e.preventDefault();
            let inputs=formElement.querySelectorAll('[name][rules]')
            let isValid=true
            for(let  input of inputs){
                let kt=handleValidate({
                    target:input
                })
                if(kt==false)  isValid=false

            }
            console.log(isValid)
            // submit form
            if(isValid){
                console.log('submit form')
                formElement.submit();

            }

        }
    }
    // Validate
    function handleValidate(e){
        let rules=formRules[e.target.name];
        let errorMessage
        // Trim
        e.target.value=e.target.value.trim()
        // delete space
        e.target.value=e.target.value.replace(/ {2,}/g,' ')
        for(let rule of rules){
            errorMessage= rule(e.target.value)
            if(errorMessage) break;
            console.log(errorMessage)
        }
        // show message error
        if(errorMessage){
            let formGroup=getParent(e.target,'.form-group')
            if(formGroup){
                formGroup.classList.add('invalid')
                let formMessage=formGroup.querySelector('.form-message')
                if(formMessage){
                    formMessage.innerText=errorMessage
                    console.log(errorMessage)
                }
            }
        }else{

        }
        return !errorMessage;
    }
    // Clear message error
    function handleClearError(e){
        let formGroup=getParent(e.target,'.form-group')
        if(formGroup.classList.contains('invalid')){
            formGroup.classList.remove('invalid')
            let formMessage=formGroup.querySelector('.form-message')
            if(formMessage){
                formMessage.innerText=""
            }
        }
    }
    function getParent(element,selector){
        while(element.parentElement){
            if(element.parentElement.matches(selector)){
                return element.parentElement
            }
            element=element.parentElement
        }

    }

</script>


<script type="text/javascript"  >
    validator('#formLoginAdmin',{})
</script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script  type="text/javascript">
    setTimeout(()=>$(".alert").hide(),2000)

</script>

</body>
</html>