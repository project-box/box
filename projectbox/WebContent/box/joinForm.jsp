<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>b o x</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/4-col-portfolio.css" rel="stylesheet">

<!-- font awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 유효성검사 -->	
<script src="/projectbox/js/memberCheck.js"></script>	

</head>

<body>

	<!-- Navigation -->
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
			<a class="navbar-brand" href="main.box">BOX</a>

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
								<li><a href="memberJoin.box">회원가입</a></li>
								<li><a href="login.box">로그인</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<c:if test="${sessionScope.loginId != null}">
								<li><a href="logoutAction.box">로그아웃</a></li>
								<li><a href="mypage.box">마이페이지</a></li>
							</c:if>
							<%-- <li>${loginId}</li> --%>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>





	<form id="joinform" name="joinform" action="/projectbox/MemberJoinAction.box" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5>회원가입
								페이지</font></b></td>
				</tr>
				<tr>
					<td>아 이 디 </td>
					<td><input type="text" id="MEMBER_ID" name="MEMBER_ID" maxlength=15 /> 
					<input type=button	value="중복검사" id="idcheck" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="MEMBER_PW1" name="MEMBER_PW1" maxlength=15/></td>
				</tr>
				<tr>
					<td>비밀번호 확인 :</td>
					<td><input type="password" id="MEMBER_PW2" name="MEMBER_PW2" maxlength=15/> </td>
				</tr>
				<tr>
					<td>이    름</td>
					<td><input type="text" id="MEMBER_NAME" name="MEMBER_NAME" /></td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td><input type=text id="MEMBER_Email1" name="MEMBER_Email1" />@ 
					    <input type=text id=MEMBER_Email2 name=MEMBER_Email2 /> 
						<select name=sel id=sel>
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
					</select></td>
				</tr>
				<tr>
					<td>성     별 </td>
					<td><input type="radio" name="MEMBER_GENDER" id="male"
						value="남" checked />남자 <input type="radio" name="MEMBER_GENDER"
						id="female" value="여" />여자</td>
				<tr>
					<td>전화번호</td>
					<td><select id="MEMBER_PHONE1" name="MEMBER_PHONE1" ">
							<option value="">번호선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="018">018</option>
					</select>- 
					<input type="text" id="MEMBER_PHONE2" name="MEMBER_PHONE2" maxlength=4 size=4  />- 
					<input type="text" id="MEMBER_PHONE3" name="MEMBER_PHONE3" maxlength=4 size=4 /></td>
				</tr>
					<td>나    이</td>
					<td><input type="text" id="MEMBER_AGE" name="MEMBER_AGE" maxlength=2 size=5 /></td>
				<tr>
					<td colspan="2" align=center>
						<input type="submit" value="회원가입">&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</center>
	</form>

	
	
	
	
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
	