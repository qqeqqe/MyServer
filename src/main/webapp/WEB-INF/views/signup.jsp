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
	
	//-1 : 중복 체크를 해야하는 경우, 0 : 회원가입이 가능한 경우, 1: 이미회원이라 회원가입 불가능
	var isMember = -1;
	
	$(document).ready(function(){
		
		$('input[name=id]').change(function(){
			isMember = -1;
		})
		
		$('#signup').submit(function(){
			if(!checkLength('#signup input[name=id]',8,13)){
				alert('아이디는 8~13자리입니다.');
				return false;
			}
			if(isMember == -1){
				alert('아이디 중복검사를 확인하세요');
				return false;
			}else if(isMember == 1){
				alert('회원 가입이 완료 되었습니다.')
				return true;
			}
			
			if(!checkLength('#signup input[name=pw]',8,13)){
				alert('비밀번호는 8~13자리입니다.')
				return false;
			}
			
			var regex = /^\w*(\d[A-z]|[A-z]\d)\w*$/;
			var id = $('input[name=id]').val();
			if(!regex.test(id)){
				alert('아이디는 영문자와 숫자를 반드시 1개이상 포함해야 합니다.');
				return false;
			}
			
			if(!isCheck){
				alert('아이디 중복검사를 하세요');
				return false;
			}
			if(!checkSame('#signup input[name=pw]','#signup input[name=pw2]')){
				alert('비밀번호와 일치하지 않습니다.')
				return false;
			}
			if($('#signup input[type=email]').val().length == 0){
				alert('이메일을 입력해주세요.')
				return false;
			}
			alert('회원가입에 성공했습니다.');
			return true;
		})
		
	
		$('#dup').click(function(){
		
			var id = $('input[name=id]').val();
			//id 유효성 검사
			
		 	$.ajax({
		        async:true,
		        type:'POST',
		        data:id,
		        url:"<%=request.getContextPath()%>/dup",
		        dataType:"json",
		        contentType:"application/json; charset=UTF-8",
		        success : function(data){
		        	if(data.isMember){
		        		alert('가입된 회원이거나 가입이 불가능한 ID 입니다.')
		        		isMember = false;
		        	}else{
		        		alert('회원 가입 가능')
		        		isMember = true;
		            }
		        }
		    });
		})
		$('input[name=id]').change(function(){
			isCheck = false;
		})
		
		$("form").validate({
	        rules: {
	            id: {
	                required : true,
	                minlength : 8,
	                maxlength : 20
	            },
	            pw: {
	                required : true,
	                minlength : 8,
	                maxlength : 20,
	                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
	            },
	            pw2: {
	                required : true,
	                equalTo : pw
	            },
	            name: {
	            	required : true,
	                minlength : 1,
	                maxlength : 5,
	            },	            
	            phone: {
	            	required : true,
	                minlength : 10,
	                maxlength : 11,
	            },
	            email: {
	                required : true,
	                email : true
	            }
	        },
	        
	        //규칙체크 실패시 출력될 메시지
	        messages : {
	            id: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                maxlength : "최대 {0}글자이하이어야 합니다"
	            },
	            pw: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                maxlength : "최대 {0}글자이하이어야 합니다",
	                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
	            },
	            pw2: {
	                required : "필수로입력하세요",
	                equalTo : "비밀번호가 일치하지 않습니다."
	            },
	            name: {
	                required : "필수로입력하세요",
	                minlength : "최소 {0}글자이상이어야 합니다",
	                maxlength : "최대 {0}글자이하이어야 합니다",
	            },
	            phone: {
		            required : "필수로입력하세요",
		            minlength : "최소 {0}글자이어야 합니다",
		            maxlength : "최대 {0}글자이어야 합니다",
	            },
	            email: {
	                required : "필수로입력하세요",
	                email : "메일규칙에 어긋납니다"
	            }
	        }
	    });
		
	})
		
	$.validator.addMethod(
    "regex",
    function(value, element, regexp) {
        var re = new RegExp(regexp);
        return this.optional(element) || re.test(value);
    },
    "Please check your input."
	);
	
	</script>
</head>
<body>

<div class="box0"></div>
		<a href="http://localhost:8080/my/"><div class="box1 public-line"></div></a>

		<div class="box2 public-line">
			<form method="post" action="" id="signup" class="box2-0">
				<div class="box2-1 "><h1 class="public-font ">회원가입</h1></div>
				
				<input type="text" name="id" placeholder="아이디를 입력하시오" class="box2-2 public-box form-control box2-focus">
				<div class="row"><label class="error" id="error" for="id"></label></div>
				<button type="button" class="box2-id" id="dup">ID CHCKE!!</button>
				
				<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하시오" class="box2-3 public-box form-control box2-focus">
				<div class="row"><label class="error" id="error" for="pw"></label></div>
				
				<input type="password" name="pw2" placeholder="비밀번호 확인" class="box2-4 public-box form-control box2-focus">
				<div class="row"><label class="error" id="error" for="pw2"></label></div>
				
				<select id="gender" name="gender" class="sel public-box box2-5 form-control box2-focus" aria-label="성별">
                <option value="" selected="">성별</option>
                <option value="M">남자</option>
                <option value="F">여자</option>
                </select>
				
				<input type="text" name="name" placeholder="이름" class="box2-6 public-box public-boxLine form-control box2-focus">
				<div class="row"><label class="error" id="error" for="name"></label></div>
				
				<input type="text" name="phone" placeholder="전화번호" class="box2-7 public-box public-boxLine form-control box2-focus">
				<div class="row"><label class="error" id="error" for="phone"></label></div>
				
				<input type="text" name="email" placeholder="Email(선택)" class="box2-8 public-box public-boxLine form-control box2-focus">
				<div class="row"><label class="error" id="error" for="email"></label></div>
								
				<div class="box2-9">
				<a href="<%=request.getContextPath()%>/"><div class="box2-10 public-box2">취소</div></a>
				<button class="box2-11 public-box2" id="join">가입</button>
				</div>
			</form>
		</div>
		
	</body>
</html>