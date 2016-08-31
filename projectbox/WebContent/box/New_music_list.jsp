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
  
	<!-- 최신곡 -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">최신곡
                    <small>
                    	<a href="NewMusicList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
    <table>
   <%
			//if(listcount > 0){
		%>
		<!-- 레코드가 있으면 -->
		
		<c:if test="${listcount > 0 }">
			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 10pt;" width="8%" height="26">
					<div align="center">번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10tp;" width="8%" height="26"> 
					<div align="center">    </div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="40%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="14%">
					<div align="center">아티스트</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="17%">
					<div align="center">발매일</div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="21%">
					<div align="center">장르</div>
				</td>
			</tr>

			<%
				//int number = listcount-(nowpage-1)*10;
					//		for(int i=0;i<Newmusiclist.size();i++){
					//			BoardBean bl=(BoardBean)Newmusiclist.get(i);
			%>

			<!-- 화면 출력 번호 -->
			<c:set var="num" value="${listcount-(page-1)*10}" />

			<c:forEach var="b" items="${Newmusiclist}">

				<tr align="center" valign="middle" bordercolor="#333333"
					onmouseover="this.style.backgroundColor='F8F8F8'"
					onmouseout="this.style.backgroundColor=''">
					<td height="23" style="font-family: Tahoma; font-size: 10pt;">
						
						
			<!-- 번호 출력 부분 --> 
				<c:out value="${num}" /> 
				<c:set var="num" value="${num-1}" />
				</td>
				
					<td style="font-family: Tahoma; font-size: 10pt;">
						<div align="left">
							<a href="./NewmusicDetailAction.box?num=${b.id}&page=${page}">
							<img class="img-responsive img-center" src="
							<c:url value='/img/${b.albumcoverfilepath}'/>" alt="" >
							</a>
						</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.title}</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.artist}</div>
					</td>
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center"><fmt:formatDate value="${b.publishdate}" pattern="yyyy-MM-dd"/>
					</div>
					</td>	
					<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${b.genre}</div>
					</td>
				</tr>
 			</c:forEach>
			<%
				//}// for end
			%>
				<tr align=center height=20>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
			<c:if test="${page <= 1 }">[이전]&nbsp;
			</c:if> 
			
			<c:if test="${page > 1 }">
				<a href="./NewMusicList.box?page=${page-1}">[이전]</a>&nbsp;
			</c:if> 
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page }">[${a}]
					</c:if>
						
					<c:if test="${a != page }">
							<a href="./NewMusicList.box?page=${a}">[${a}]</a>&nbsp;
					</c:if>
			</c:forEach>
					
			<c:if test="${page >= maxpage }">[다음] 
			</c:if> 
			
			<c:if test="${page < maxpage }">
				<a href="./NewMusicList.box?page=${page+1}">[다음]</a>
			</c:if>
			</td>
		</tr>

	</c:if>
		<%
		//}else{
		%>
		<!-- 레코드가 없으면 -->
		 <c:if test="${listcount == 0 }">
			<tr align="center" valign="middle">
				<td colspan="4">음악</td>
				<td align="right"><font size=2>등록된 글이 없습니다.</font></td>
			</tr>
		</c:if> 
		<%
			//	}
		%>
		<c:if test="${users.id == dev}">
		<tr align="right">
			<td colspan="6"><a href="./NewmusicWrite.box">[글쓰기]</a></td>
		</tr>
		</c:if>
	</table>
	
    <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p align="center">Copyright & copy; designed by box 2016 </p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
     </div>
</body>
</html>