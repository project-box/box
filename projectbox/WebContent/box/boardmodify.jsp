<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <!-- 유효성 검사 -->
    <script src="/projectbox/js/boardwrite.js"></script>    
    
    
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



<!-- 글쓰기 폼 -->
<div class="row" align="center">
            <div class="col-lg-12" >
                <h1 class="page-header">게시판 글수정
                    <small>
                    	<a href="#" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>            
            
            <%
            	String dev = "dev";
            %>
            
           <form method="post" action="/projectbox/boardModifyAction.box">
           		<input type="hidden" name="userid" value="<%=dev%>">
           		<input type="hidden" name="id" value="${boarddata.id}">
           		<input type="hidden" name="page" value="${page}">
            <table class="table table-striped" style="margin: auto; width: 40%;">
                  <tr><th>이름: <input type=text id="name" name="name" value="${boarddata.name}"></th></tr>		      			       
			      <tr><th>제목: <input type=text id="title" name="title" value="${boarddata.title}"></th></tr>			        
			      <tr><th>내용 :<textarea rows="10" cols="50" id="content" name="content">${boarddata.content}</textarea></th></tr> 				
			      <tr><th>비밀번호: <input type=password id="password" name="password"></th></tr>
			 </table>         
          	
          	<br><br>
          	
        </div>
        
        
			<P align="center">
				<input type="image" src="/projectbox/img/change.jpg" id="regist" width="70px">
				<!-- <input type="image" src="/projectbox/img/remove.jpg" id="cancel"> -->	
			</P>

		 </form>





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