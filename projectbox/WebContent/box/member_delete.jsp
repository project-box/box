<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>b o x</title>

<%@ include file= "/box/header.jsp" %>



<!-- Bootstrap Core CSS -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->

<!-- Custom CSS -->
<!-- <link href="css/4-col-portfolio.css" rel="stylesheet">
 -->
<!-- font awesome -->
<!-- <link href="css/font-awesome.min.css" rel="stylesheet">
 -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<!-- 
/* 유효성검사 */ -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">


$(document).ready(function() {	

	$("form").submit(function(){
	
		if($("#id").val()==""){
			alert("아이디를 입력 하세요");
			$("#id").focus();
			return false;
			}
		
		else if($("#pass").val()==""){
			alert("패스워드를 입력 하세요");
			$("#pass").focus();
			return false;
			}
		
		else{ 
			window.confirm("정말로 탈퇴하시겠습니까?")		
		 }		
		
		}); 	
});


</script>

<style>

   .table-striped {
    float:center;
	width: 500px;
    margin: 40px;    
       }
   
   .table-bordered {
    width: 700px;
    
   }
   
   .navbar-default{
   background: #999999;
   }
   
   
   
   .name {
    text-decoration: underline;
}

  </style>

</head>
<body>

	<%-- <!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/projectbox/main.box">BOX</a>

			<ul class="nav navbar-nav">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#portfolio"> <i class="fa fa-search"
						aria-hidden="true" style="font-size: 20px;"></i>
				</a></li>
				<li>
					<!-- <a>
                    	<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
                   	</a> -->
					<div class="dropdown boxcenter">
						<button class="btn btn-link dropdown-toggle" type="button"
							data-toggle="dropdown">
							<c:if test="${sessionScope.loginId == null}">
								<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
								<a href="#"><c:out value="${sessionScope.loginName}"/></a>
							</c:if>
						</button>
						<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:if test="${sessionScope.loginId == null}">
								<li><a href="#">회원가입</a></li>
								<li><a href="login.box">로그인</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<li><a href="logoutAction.box">로그아웃</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<li>${loginId}</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>  --%>
	
	    
  <div class="container">  
  
   
    <table class="table table-bordered">
	<tr>
	<td>
	<h2 class="blind">&nbsp;&nbsp;&nbsp;My Page</h2>
	<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong class="name">${sessionScope.loginName}</strong>님의 멤버십 등급은 
	<font style="color:navy;"><b>VIP</b></font>입니다.</p>
	</td>
	</tr>	
</table><br>
     
     <div>
     <nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li><a href="/projectbox/mypage.box"><font color="white"><b>예매정보확인</b></font></a></li>
      <li><a href="/projectbox/MemberUpdate.box"><font color="white"><b>회원정보수정</b></font></a></li>
      <li><a href="/projectbox/MemberDeleteForm.box"><font color="white">회원탈퇴</b></font></a></li>
    </ul>
  </div>
</nav> 
 
  <div class="tap content">
  <table class="table table-striped">
    <thead>
      <tr align="center">
        <th>회원탈퇴</th>        
      </tr>
    </thead>
    <tbody>
      <tr valign="middle" height="200px">
        <td>
        <p style="font-size: 11px;">정확한 정보 확인을 위해 아이디와 패스워드를 입력해주세요.</p><br><br>
     
        <form action="/projectbox/MemberDelete.box" class="form-horizontal" method="post" name="deleteform">
    <div class="form-group">
      <label class="control-label col-sm-2">ID:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" name="inputid" id="id" placeholder="id">
      </div>
    </div>
    
    
    <div class="form-group">
      <label class="control-label col-sm-2">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" name="inputpass" id="pass" placeholder="password">
      </div>
    </div> 
       
       
    <div class="form-group">        
      <div align="center" class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">탈퇴하기</button>        
      </div>
    </div>
    
    
  </form>
   </td></tr>  
    </tbody>
  </table>
  </div>
  
	</div>
	
	
	
	
	<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12" style="font-size: 10px">
				<p>Copyright &copy; 2016 box Inc. 모든 권리 보유.</p>
				<br>
				<p>사업자등록번호 : 510-11-24601 | 통신판매업신고번호 : 제 2011-서울강남-00810호 |
					대표이사 : 마크장 | 주소 : 서울특별시 강남구 영동대로 517 아셈타워 39층 | 대표전화 : 02-6512-8000
					| 팩스 : 02-6128-8000</p>
			</div>
		</div>
		<!-- /.row --> </footer>
	</div>
	<!-- /.container -->

</body>
</html>