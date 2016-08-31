<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<%@ include file= "/box/header.jsp" %>

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
     
	<%@ include file= "/box/footer.jsp" %>       
	
</body>
</html>