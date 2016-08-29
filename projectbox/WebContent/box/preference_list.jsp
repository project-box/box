<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- raty -->
<link rel="stylesheet" href="raty/jquery.raty.css">
<script src="raty/jquery.raty.js"></script>

<script>
	$(document).ready(function() {
		$('.star').raty({
			half : true,
			starOff : 'raty/images/star-off.png',
			starOn  : 'raty/images/star-on.png',
			starHalf : 'raty/images/star-half.png',
			hints : ['별로', '그럭저럭', '보통', '좋음', '최고']
		});
		
		$( ".star" ).each(function( index ) {
			  console.log( index + ": " + $( this ).text() );
		});
	});
	
</script>

</head>
<body>
	
	<c:forEach var="b" items="${musiclist}">
		<div class="col-md-3 portfolio-item">
			
			<img class="img-responsive img-center"
			src="
                  <c:url value='/img/${b.albumcoverfilepath}'/>"
			alt="">
			<center>
				<div class='star'></div>
			</center>
			<div class="well well-sm">
				<c:out value="${b.title}" />
				<br>
			</div>
		</div>
	</c:forEach>
	
</body>
</html>