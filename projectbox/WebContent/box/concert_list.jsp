<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</head>
<body>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.box">BOX</a>
                
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#portfolio">
                        	<i class="fa fa-search" aria-hidden="true" style="font-size: 20px;"></i>
						</a>
                    </li>
                    <li>
                    	<a href="#navigation-main">
                       		<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <div class="container">
    
    <table class="table table-striped">
			    <thead>
			      <tr>
			      	<th></th>
			        <th>제목</th>
			        <th>아티스트</th>
			        <th>기간</th>
			        <th></th>
			        <th>장소</th>				
			      </tr>
			    
			     </thead>
			    <tbody>
				    <c:forEach var="b" items="${Newconcertlist}">
				    	<tr>
				    		<td><a href="/projectbox/ConcertDetail.box?id=${b.id}">
				    		<img src="<c:url value='/img/${b.posterfilepath}'/>" alt="" width=40px height=40px>
				    		</a></td>
			            	<td><a href="/projectbox/ConcertDetail.box?id=${b.id}"><c:out value="${b.title}"/></a></td>
			            	<td><c:out value="${b.artist}"/></td>
							<td>
								<c:set var="start" value="${b.startdate}" />
								<fmt:formatDate value="${start}" type="date" />							
							</td>
							<td>
								<c:set var="end" value="${b.enddate}" />
								<fmt:formatDate value="${end}" type="date" />
							</td>
							<td><c:out value="${b.place}"/></td>
						</tr>
					</c:forEach>
			    </tbody>
			  </table>
    
    <br><br><br><br><br><br><br>
     
        
    <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12" style="font-size:10px">
                    <p>Copyright &copy; 2016 box Inc. 모든 권리 보유. </p><br>
                    <p>사업자등록번호 : 510-11-24601 | 통신판매업신고번호 : 제 2011-서울강남-00810호 | 대표이사 : 마크장 | 주소 : 서울특별시 강남구 영동대로 517 아셈타워 39층 | 대표전화 : 02-6512-8000 | 팩스 : 02-6128-8000</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
        
    </div>
	
</body>
</html>