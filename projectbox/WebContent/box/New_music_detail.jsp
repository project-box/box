<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	.image {float:left;}
	.info {float:left;}
	
</style>
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
                <h1 class="page-header">곡 정보
                 <small>
                    	<a href="NewMusicList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
		<hr size="10">
		
		<div class="image">
			<img class="img-responsive img-center"  width="350" height="400" src="
							<c:url value='/img/${Newmusicdata.albumcoverfilepath}'/>" alt="" >
		</div>

        <div class="info">
			<b><div align="center"><Font Size="30" color="#777777">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${Newmusicdata.title}</Font></div></b><br><br> 
			
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				아티스트 :</b> ${Newmusicdata.artist}</Font></div><br> <br>
			
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				발매일 : </b>
			
					<%-- <c:set var="now" value="${Newmusicdata.publishdate}" /> --%>
		  		    <fmt:formatDate value="${Newmusicdata.publishdate}"  pattern="yyyy-MM-dd" />
		    		
					</Font></div><br> <br>
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				장르  :  </b>${Newmusicdata.genre}</Font></div><br><br><br>
		</div>

	 	<div class="row">
	 	<table width=100%>
 	       <tr>
 	       <td width=50% ><div class="col-lg-12">
                <h1 class="page-header">가사
                 <small>
                    	<i class="fa fa-bars" aria-hidden="true"></i>
					</small>
                </h1></td>
           <td widht=50% ><div class="col-lg-12">
                <h1 class="page-header">앨범 수록곡
                 <small>
						  <i class="fa fa-bars" aria-hidden="true"></i>
					</small>
                </h1></td>
          </tr>
          	<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${Newmusicdata.lyrics}</div></td>
          	<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${Newmusicdata.album}</div></td>
          <tr>
           </div>
           </table>
        </div>
              
    <!-- Footer -->
       <footer>
            <div class="row" id="row2" align="center">
                <div class="col-lg-12">
                    <p>Copyright &copy; designed by box 2016 </p>
                </div>
            </div>
            <!-- /.row -->
       </footer>
        
    </div>
</body>
</html>