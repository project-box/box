<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<c:if test="${result == 1 }">
		<c:out value="사용중인 ID입니다."/>
	</c:if>
	<c:if test="${result == -1 }">
		<c:out value="사용 가능한 ID입니다."/>
	</c:if>
	
	
	<br><br><br>
	<a href="javascript:self.close()">닫기</a>	

</body>
</html>