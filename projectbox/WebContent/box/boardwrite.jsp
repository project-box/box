<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<%@ include file= "/box/header.jsp" %>

	<title>b o x</title>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    
    <!-- 유효성 검사 -->
    <script src="/projectbox/js/boardwrite.js"></script>    
    
    
</head>
<body>

<!-- 글쓰기 폼 -->
<div class="row" align="center">
            <div class="col-lg-12" >
                <h1 class="page-header">게시판 글작성
                    <small>
                    	<a href="#" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>            
            
            <%
            	String userid = (String)session.getAttribute("loginId");
            %>
            
           <form method="post" action="/projectbox/boardWritePro.box">
           		<input type="hidden" name="userid" value="<%=userid%>">
            <table class="table table-striped" style="margin: auto; width: 40%;">			  
			      <tr><th>이름: <input type=text id="name" name="name"></th></tr>			       
			      <tr><th>제목: <input type=text id="title" name="title"></th></tr>			        
			      <tr><th>내용 :<textarea rows="10" cols="50" id="content" name="content"></textarea>	</th></tr>		      
			 	  <tr><th>비밀번호: <input type=text id="password" name="password"></th></tr>
			 </table>         
          	
          	<br><br>
          	
        </div>
        
        
			<P align="center">
				<input type="image" src="/projectbox/img/register.jpg" id="regist" width="70px">
				<input type="image" src="/projectbox/img/cancel.jpg" id="cancel" width="70px">	
			</P>

		 </form>

<%@ include file= "/box/footer.jsp" %>       





<!-- Footer -->
        <!-- <footer style="text-align:center">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; designed by box 2016 </p>
                </div>
            </div>
            /.row
        </footer>
	</div> -->
    <!-- /.container -->
	

</body>
</html>