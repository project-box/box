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
    
    
    <script>
		$(document).ready(function(){
			$("#del").submit(function(){				
				if($("#password").val()==""){
					alert("비밀번호를 입력 하세요?");
					$("#password").focus();
					return false;
				}						
			});			
		});	
	</script>    
         
    
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
                <a class="navbar-brand" href="#">BOX</a>
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
	





<div>
<table border=1 class="table table-striped" style="margin: auto; width: 60%;">

<form action="/projectbox/boardDeleteAction.box" method="post">
<input type="hidden" name="id" value="${param.id}">
<input type=hidden name=page value="${param.page}">

<tr>
	<td>
		<font size=2>글 비밀번호 : </font>
	</td>
	<td>
		<input name="password" id="password" type="password">
	</td>
</tr>
<tr align=center valign="middle">
	<td colspan=2>
		<!-- 삭제 -->
		<input type="image" src="/projectbox/img/remove.jpg" width="70px" id="del">
		
		<!-- 취소 -->
		<input type="image" src="/projectbox/img/cancel.jpg" width="70px" onClick="history.go(-1)">
		<!-- <image src="/projectbox/img/cancel.jpg" width="70px" onClick="history.go(-1)"/> -->	
		
	</td>
</tr>

</form>

</table>
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