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
    <link href="/projectbox/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/projectbox/css/4-col-portfolio.css" rel="stylesheet">
    
    <!-- font awesome -->
    <link href="/projectbox/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>    
       
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
                <a class="navbar-brand" href="/projectbox/main.box">BOX</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
    
<!-- 상세 페이지 -->
    
    <body>
    
    <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin: auto;width: 20%;">상세페이지 
                    <small>
                    	<a href="#" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
    
    

<table class="table table-striped" style="margin: auto; width: 80%;">	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">		
			${boarddata.title}		
		</td>
	</tr>	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내  용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table  width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">					
					<pre>${boarddata.content}</pre>
					</td>
				</tr>
			</table>
		</td>
	</tr>	
</table>  
    
     </div> 
     
     
    <div style="margin:auto; width:30%;">
    	<!-- 목록 -->
    	<img src="/projectbox/img/list.jpg" width="70px"
    		onClick="location.href='/projectbox/boardList.box'">
    
    	<!-- 수정 -->
		<img src="/projectbox/img/change.jpg" width="70px"
			onClick="location.href='/projectbox/boardModify.box?id=${boarddata.id}&page=${page}'">
		
		<!-- 삭제 -->		
		<img src="/projectbox/img/remove.jpg" width="70px" 
			onClick="location.href='/projectbox/boardDelete.box?id=${boarddata.id}&page=${page}'">	   
	</div> 
        
    
   
   
   
   <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; designed by box 2016 </p>
                </div>
            </div>
            <!-- /.row -->
        </footer>
	</div>
    <!-- /.container -->
	
</body>
</html> 
