<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<script src="//code.jquery.com/jquery-3.3.1.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
	<title>로그인창</title>
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
		width: 450px; height: 660px;
		transform: translate(-50%);
		left: 50%; top: 10%;
		background-color: rgba(0,0,0,.75);
		padding: 60px 68px 40px;
		border-radius: 30px;
		}

		form>.box2-4{
		margin-top: 50px;
		background: red;
		text-align: center;
		font-size: 30px;
		cursor: pointer;
		padding-right: 25px;
		}

		
		#box2-4a{
		position: absolute;
		/* border: 1px solid white; */
		margin: 20px 0 0 70px; 
		color: greenyellow;
		display: none;
		}
		
		#box2-4a:hover{
		text-decoration: underline;
		}
		
		.box2-5{
			margin-top: 190px;
			color: darkgray;
		}
		/* 2 끝*//* 공용 시작*/
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
		width: 317px; height: 50px;
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
		
		/* 공용 끝*/
		
		</style>
		<script type="text/javascript">

		
		$(document).ready(function(){
			$('#login').click(function(){
				
				var id = $('input[name=id]').val();
				var pw = $('input[name=pw]').val();
				console.log(id,",",pw)
				
			 	$.ajax({
			        async:false,
			        //동작 방식을 비동식으로 해야 바로 로그인이 안된다.
			        
			        type:'POST',
			        data:{'id':id, 'pw':pw}, 
			        //1개 이상 할때 방법
			        
			        url:"<%=request.getContextPath()%>/myDup",
			        dataType:"json",
			        
			        /* contentType:"application/json; charset=UTF-8", */
			        //2개 이상할때 삭제한다.
			        
			        success : function(data){
			      	 console.log(data)
			         	if(!data.isMember){
			         	//홈컨트롤러에서 isMember에담아 일을 시켰다		
					 	alert('ID 와 Password 가 일치하지 않습니다.')
					 		document.getElementById("box2-4a").style.display = "block";
					 	}
			      	 	
			         else{
			        	alert('로그인에 성공하였습니다.')
			        	$('#signin').submit();
			        	//from 태그안에 button의 type는 기본적으로 submit이 
			        	//되어있기때문에 아래 type을 button으로 바꿈
			        	//그래서 이곳에서 최종적으로 submit 명령어를 이용해 서버에 명령해야함
			        	}
			          }
			   	  });
				
			})
		})
		
		</script>
		</head>
		<body>
		<div class="box0"></div>
		<a href="http://localhost:8080/my/"><div class="box1 public-line"></div></a>

		<div class="box2 public-line">
			<div class="box2-1 "><h1 class="public-font ">로그인</h1></div>
			<form method="post" action="" id="signin">
			  <input type="text" name="id" id="" placeholder="아이디를 입력하시오" class="box2-2 form-control public-box box2-focus">
			  <input type="password" name="pw" id="" placeholder="패스워드를 입력하시오" class="box2-3 form-control public-box box2-focus">
				<button class="box2-4 public-box" id="login" type="button">Login</button>
				<a href="<%=request.getContextPath()%>/mail/mailForm"><div id="box2-4a">비번을 잊어버리셨나요? 비번찾기</div></a>
				<div class="box2-5 ">HORROR-Q 회원이 아니신가요? <br>
				<a href="<%=request.getContextPath()%>/signup" style="color: white; font-weight: 900">지금 가입하세요</a><br>
				더 많은 혜택을 받으실수 있습니다.						  	
				</div>
			</form>
		</div>
		</body>
		</html>