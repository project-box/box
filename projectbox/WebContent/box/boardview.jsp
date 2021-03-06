<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file= "/box/header.jsp" %>

	<title>b o x</title>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>    
       
</head>
    
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
     
     
    <div style="margin:auto; width:20%;">
    	<!-- 목록 -->
    	<img src="/projectbox/img/list.jpg" width="70px"
    		onClick="location.href='/projectbox/boardList.box'">
    
    	<!-- 로그인 안한상태 수정 -->
    	<c:if test="${sessionScope.loginId == null}">
    		<img src="/projectbox/img/change.jpg" width="70px"
				onClick="alert('로그인 해야만 수정할 수 있습니다.')">
		</c:if>
    	
    	<!-- 로그인 안한상태 수정 -->
    	<c:if test="${sessionScope.loginId != null}">
    		<img src="/projectbox/img/change.jpg" width="70px"
			onClick="location.href='/projectbox/boardModify.box?id=${boarddata.id}&page=${page}'">
    	</c:if>    	    	
		
		
		<!-- 로그인 안한상태 삭제 -->	
		<c:if test="${sessionScope.loginId == null}">
			<img src="/projectbox/img/remove.jpg" width="70px" 
				onClick="alert('로그인 해야만 삭제할 수 있습니다.')">
		</c:if>
		
		<!-- 로그인 안한상태 수정 -->
    	<c:if test="${sessionScope.loginId != null}">
    		<img src="/projectbox/img/remove.jpg" width="70px" 
			onClick="location.href='/projectbox/boardDelete.box?id=${boarddata.id}&page=${page}'">
    	</c:if>	
			   
	</div> 
        

    
   
   
   
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

<%@ include file= "/box/footer.jsp" %>       

	
</body>
</html> 
