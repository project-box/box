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
    
    <script src="../js/boardwrite.js"></script>
    
    <!-- 로그인후 글작성 체크 -->
    <script>
    jQuery(document).ready(function(){
    	$("#write").click(function(){
 //   		alert("굿");
    		/* if(){
    			
    		}else{
    			
    		} */   
    		
    		location.href="boardWrite.box";
    		
    	});	
    });   
    
    </script>
        
    
</head>
<body>

<!-- 자유 게시판 (전체 목록) --> 	
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" style="margin: auto;width: 20%;">자유 게시판
                    <small>
                    	<a href="boardList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>            
            
            
            <table class="table table-striped" style="margin: auto; width: 80%;">
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
			    
			    	<c:set var="num" value="${listcount-(page-1)*10}"/>
			    
				    <c:forEach var="b" items="${generalboardlist}">
				    	<tr>
			            	<td><%-- <c:out value="${b.id}"/> --%>
			            		<c:out value="${num}"/>				
								<c:set var="num" value="${num-1}"/>			            	
			            	</td>        	 	
			            	<td><a href="/projectbox/boardCont.box?id=${b.id}&page=${page}">
								<c:out value="${b.title}"/></a>
							</td>
							<td><c:out value="${b.name}"/></td>
							<td>
							
<c:set var="now" value="${b.registerdate}" />
<fmt:formatDate value="${now}" type="date" /> <br>							
							
							
							</td>
							<td><c:out value="${b.readcount}"/></td>
						</tr>
					</c:forEach>
			    </tbody>
			  </table> <br><br>
			  
		<!-- 페이지 처리 부분 -->	  
		<div style="margin:auto; width:15%;">
  		<table>
           <tr align=center height=20>
			<td colspan=7 style=font-family:Tahoma;font-size:10pt;>			
			
				<img src="/projectbox/img/previous-2.jpg" width="20px" height="20px">&nbsp;
			
			<c:if test="${page <= 1 }">				
				<img src="/projectbox/img/previous-1.jpg" width="20px" height="20px">
			</c:if>
			<c:if test="${page > 1 }">			
				 <a href="./boardList.box?page=${page-1}">				 
				 	<img src="/projectbox/img/previous-1.jpg" width="20px" height="20px">				 
				 </a>
			</c:if>			
					
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">				
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="./boardList.box?page=${a}"> [${a}]	</a>&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:forEach>	
						
			<c:if test="${page >= maxpage }">
				<img src="/projectbox/img/next-1.jpg" width="20px" height="20px">&nbsp;
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="./BoardList.bo?page=${page+1}">
					<img src="/projectbox/img/next-1.jpg" width="20px" height="20px">&nbsp;
				</a>
			</c:if>			
			
				<img src="/projectbox/img/next-2.jpg" width="20px" height="20px">&nbsp;
			
			
			</td>
		</tr>
    </table> </div>   <br>   
          
        </div>

<div style="margin:auto; width:13%; float:right">
	<img src="/projectbox/img/write-1.jpg" id="write" width="70px">
</div>

<%@ include file= "/box/footer.jsp" %>    

</body>
</html>