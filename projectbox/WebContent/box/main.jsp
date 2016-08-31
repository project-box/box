<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<link href="css/main.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
			<a class="navbar-brand" href="main.box">b o x</a>

			<ul class="nav navbar-nav">
				<li><a href="NewMusicList.box">음악</a></li>
				<li><a href="ConcertList.box">공연</a></li>
				<li><a href="#">커뮤니티</a></li>
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

	<div class="container">

		<!-- 선호도 -->
		<div>
			<c:if test="${sessionScope.loginId != null}">
				<!--  -->
			</c:if>
			
			<c:set var="count" value="${fn:length(preferencelist)}"/>
			
			<c:choose>
				<c:when test="${sessionScope.loginId == null}">
			        <!--  -->
			    </c:when>
				<c:when test="${count le 0}">
			        <a href="PreferenceListAction.box">(임시메시지)엇! 아직 선호도가 조사되지 않았습니다.</a>
			    </c:when>
			    <c:when test="${count le 5}">
			        <a href="PreferenceListAction.box">(임시메시지)엇! 아직 선호도가 조사가 부족합니다.</a>
			    </c:when>
			</c:choose>
			
		</div>

		<!-- 최신곡 -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					최신곡 <small> <a href="NewMusicList.box" aria-label="Skip to main navigation" title="최신곡 전체 목록">
					<i class="fa fa-bars" aria-hidden="true"></i>
					</a>
					</small>
				</h1>
			</div>

			<c:forEach var="b" items="${musiclist}">
				<div class="col-md-3 portfolio-item">
					<a href="NewmusicDetailAction.box?num=${b.id}&page=${page}">
						<img class="img-responsive img-center"
						src="
	                    <c:url value='/img/${b.albumcoverfilepath}'/>"
						alt="">
					</a>
					<div class="well well-sm">
						<c:out value="${b.title}" />
						<br>
					</div>
				</div>
			</c:forEach>
		</div>

		<br>
		
		<c:choose>
				<c:when test="${sessionScope.loginId == null}">
			        
			        <div>
			        	<div style=" float: left; ">
			        		<img src="icon/music.png" class="con-img" alt="">
						</div>
						<div class="abc">
							<code>
					        box의 추천 컨텐츠 서비스는 로그인 후 사용 가능합니다.</code>
						</div>
		        	</div>
			        
					<div style="clear:left;">
						<a href="login.box">로그인</a><br>
			        	<a href="memberJoin.box">회원가입 하시겠습니까?</a><br>
		        	</div>
			        
			    </c:when>
			    <c:when test="${count le 5}">
			        
					<div>
			        	<div style=" float: left; ">
			        		<img src="icon/music.png" class="con-img" alt="">
						</div>
						<div class="abc">
							<code>
					        엇! 아직 선호도 조사가 부족합니다.
							취향에 따른 최소 5개 이상의 음악을 선택하시면
							이에 따른 컨텐츠를 추천해 드립니다.</code>
						</div>
		        	</div>
		        	<div style="clear:left;">
		        		<a href="PreferenceListAction.box">선호도 조사를 하시겠습니까? >></a>
		        	</div>
			        	
			    </c:when>
			    <c:otherwise>
		           <!-- 추천곡 -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								추천곡 <small> <a href="recommendMusicList.box" aria-label="Skip to main navigation" title="추천곡 전체 목록">
								<i class="fa fa-bars" aria-hidden="true"></i>
								</a>
								</small>
							</h1>
						</div>
						
						<c:forEach var="b" items="${recommendedmusiclist}">
							<div class="col-md-3 portfolio-item">
								<a href="#"> <img class="img-responsive img-center"
									src="<c:url value='/img/${b.albumcoverfilepath}'/>" alt="">
								</a>
								<div class="well well-sm">
									<c:out value="${b.title}" />
									<br>
								</div>
							</div>
						</c:forEach>
						
					</div>
			
					<!-- 추천공연 -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								추천공연 <small> <a href="ConcertList.box" aria-label="Skip to main navigation" title="추천공연 전체 목록"> 
								<i class="fa fa-bars" aria-hidden="true"></i>
								</a>
								</small>
							</h1>
						</div>
						
						<c:forEach var="b" items="${recommendedconcertlist}">
							<div class="col-md-3 portfolio-item">
								<a href="/projectbox/ConcertDetail.box?id=${b.id}&page=1"> <!-- <img class="img-responsive" src="http://placehold.it/750x450" alt="" > -->
									<img class="img-responsive img-center"
									src="<c:url value='/img/${b.posterfilepath}'/>" alt="">
								</a>
								<div class="well well-sm">
									<c:out value="${b.title}" />
									<br>
								</div>
							</div>
						</c:forEach>
						
					</div>
		       </c:otherwise>
			</c:choose>
        
        
        <!-- 게시판 -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">자유 게시판
                    <small>
                    	<a href="boardList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
            
            <table class="table table-striped">
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>이름</th>
			        <th>등록일</th>
			        <th>조회수</th>			      
			      </tr>
			    </thead>
			    <tbody>
				    <c:forEach var="b" items="${generalboardlist}">
				    	<tr>
			            	<td><c:out value="${b.id}"/></td>
			            	<td><a href="#">
								<c:out value="${b.title}"/></a>
							</td>
							<td><c:out value="${b.name}"/></td>
							<td><%-- <c:out value="${b.registerdate}"/> --%>
								<c:set var="now" value="${b.registerdate}" />
								<fmt:formatDate value="${now}" type="date" />							
							</td>
							<td><c:out value="${b.readcount}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<%-- <c:forEach var="b" items="${generalboardlist}">
            	<c:out value="${b.id}"/>
            	<a href="#">
					<c:out value="${b.title}"/>
				</a>
				<c:out value="${b.name}"/>
				<c:out value="${b.registerdate}"/>
				<br>
				
			</c:forEach> --%>

			<br>
			<br>

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