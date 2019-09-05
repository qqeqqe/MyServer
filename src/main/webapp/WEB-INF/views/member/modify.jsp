<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	
	<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.js"></script>	
		
	<!-- 정규화 플러그인 연결 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.js"></script>
		
	<title>회원가입</title>
	<style>
		.box0{
		position: absolute;
		background-image: url(<%=request.getContextPath()%>/resources/img/login.png);
		width: 100%; height: 770px;
		}

		.box1{
		position: absolute;
		width: 189px; height: 56px;
		background-image: url(<%=request.getContextPath()%>/resources/img/logo.png);
		left: 3%; top: 3%;
		}
		
		.box2{
		position: absolute;
		width: 450px; height: 680px;
		transform: translate(-50%);
		left: 50%; top: 10%;
		background-color: rgba(0,0,0,.75);
		padding: 60px 68px 40px;
		border-radius: 30px;
		}

		.box2-id{
		width: 317px;
	    height: 30px;
	    background: #333;
	    border-radius: 20px;
	    color: #fff;
	    border: 0;
		}
		
		.box2-2, .form-control[readonly]{
		background-color: gray;
		}
		
		.box2-0>.box2-5{
		color:gray;
		padding: 2px 6px 6px 30px;
		}
		
		.box2-9{
		float: right;
		width: 180px;
		color:gray;
		}
		
		
		/* 2 끝*/ 
		/* 공용 시작*/
		*{ margin: 0;	padding : 0; }

		.public-line{
			/* border: solid 1px blue; */
		}

		.public-font{
			color: white;
			font-weight: 700;
		}

		.public-box{
		margin-top: 20px;
		position: relative;
		width: 317px; height: 30px;
		background: #333;
		border-radius: 20px;
		color: #fff;
		padding-left: 30px;
		border: 0;
		}

		.box2-focus:focus{
		background-color: white;
		border: 1px solid red;
		box-shadow: 0 0 0 0.2rem rgba(255,0,0,.40);
		}

		.box2-9>button , .public-box2{
		display: inline-block;
		margin: 50px 0px 0px 0px;
		border : 1px solid red;
		text-align: center;
		cursor: pointer;
		height: 30px;
		width: 80px;
		border-radius: 13px;
		background:none;
		color: gray;
		}
	
		.public-box2:hover{
		background-color: #ff0000;
		color: #ffffff;
		border : 1px solid red;
		} 
		
		.box2-0>.public-boxLine{
			margin-top: 28px;
		}		
		/* 공용 끝*/
		
		 .row{
		margin: 5px 0px 0px 30px;
		border: none;
		}
		
		.error{
		color: red; 
		} 
		
		label{
		margin-bottom: 0px;
		font-size: 11px;
		}

	</style>
	<script type="text/javascript">
	function checkSame(sel1, sel2){
		var val1 = $(sel1).val();
		var val2 = $(sel2).val();
		if(val1 == val2)
			return true;
		return false;
	}
	function checkLength(sel,min,max){
		var val = $(sel).val();
		if(val.length >= min && val.length <= max )
			return true;
		return false;
	}
	
	$(document).ready(function(){
		$('#modify').submit(function(){
			//checkLength('input[name=pw]',8,13) : 새비밀번호를 입력했다면 8~13자리이면 회원 정보 수정해야함
			//$('input[name=pw]').val().length==0 : 새비밀번호를 입력하지 않았다면 회원 정보 수정해야함
			if(!(checkLength('input[name=pw]',8,13)||$('input[name=pw]').val().length==0)){
				alert('새비밀번호로 수정하려면 8~13자리를 입력하거나 비밀번호를 수정하지 않으려면 새비밀번호를 입력하지 마세요.')
				return false;
			}
			if(!checkSame('input[name=pw]','input[name=pw2]')){
				alert('비밀번호와 일치하지 않습니다.')
				return false;
			}
			if($('input[type=email]').val().length == 0){
				alert('이메일을 입력해주세요.')
				return false;
			}
			alert('회원수정에 성공했습니다.');
			return true;
		})	
		
		$('#dup').click(function(){
			var id = $('input[name=id]').val();
			$.ajax({
        async:true,
        type:'POST',
        data:id,
        url:"<%=request.getContextPath()%>/dup",
        dataType:"json",
        contentType:"application/json; charset=UTF-8",
        success : function(data){
            if(data.isMember){
            	//아이디가 있을 때 =>회원가입 불가
            	alert('가입된 아이디입니다.');
            	isMember = 1;
            }else{
            	//아이디가 없는 아이디일 때 =>회원가입 가능
            	alert('회원가입이 가능한 아이디입니다.');
            	isMember = 0;
            }
        },
        error:function(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
	    });
		})
		

		$('body').keydown(function(e))
		{
			if(e.which == 116){
				location.href = "<%=request.getContextPath()%>/member/modify";
			}
		})
	})
	
	</script>
</head>
<body>

<div class="box0"></div>
		<a href="http://localhost:8080/my/"><div class="box1 public-line"></div></a>

		<div class="box2 public-line">
			<form method="post" action="<%=request.getContextPath()%>/member/modify" id="modify" class="box2-0">
				<div class="box2-1 "><h1 class="public-font ">회원정보수정!</h1></div>
				
				<input type="text" name="id" placeholder="아이디를 입력하시오" class="box2-2 public-box form-control box2-focus" value="${user.id}" readonly>
				<input type="password"class="form-control public-box" placeholder="기존비밀번호" name="oldPw">
				<input type="text" name="pw" id="pw" placeholder="변경할 비밀번호를 입력하시오" class="box2-3 public-box form-control box2-focus">
				<input type="text" name="pw2" placeholder="비밀번호 확인" class="box2-4 public-box form-control box2-focus">
				<select id="gender" name="gender" class="sel public-box box2-5 form-control box2-focus" aria-label="성별"  >
                <option value="" selected="" >${user.gender}</option>
                <option value="M">남자</option>
                <option value="F">여자</option>
                </select>
				<input type="text" name="name" placeholder="이름" class="box2-6 public-box public-boxLine form-control box2-focus" value="${user.name}">
				<input type="text" name="phone" placeholder="전화번호" class="box2-7 public-box public-boxLine form-control box2-focus" value="${user.phone}">
				<input type="text" name="email" placeholder="Email(선택)" class="box2-8 public-box public-boxLine form-control box2-focus" value="${user.email}">
				
				<div class="box2-9">
				<a href="<%=request.getContextPath()%>/board/list"><div class="box2-10 public-box2">취소</div></a>
				<button class="box2-11 public-box2" id="join">수정</button>
				</div>
			</form>
		</div>
		
	</body>
</html>