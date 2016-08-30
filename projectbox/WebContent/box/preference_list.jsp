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
	});
	
	function post(path, params, method) {
	    method = method || "post"; // Set method to post by default if not specified.

	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);

	    for(var key in params) {
	        if(params.hasOwnProperty(key)) {
	            var hiddenField = document.createElement("input");
	            hiddenField.setAttribute("type", "hidden");
	            hiddenField.setAttribute("name", key);
	            hiddenField.setAttribute("value", params[key]);

	            form.appendChild(hiddenField);
	         }
	    }

	    document.body.appendChild(form);
	    form.submit();
	}
	
	function getStars(){
		/* $( ".star" ).each(function( index ) {
			var score = $(this).raty('score');
			console.log( index + ": " + score );
		}); */
		
		
		items = {};        
        
		$('.musicrating').each(function(index){
			var music = $(this).children().first();
			
			// music id
			console.log(music.attr('class'));
			var musicid = 'id.' + music.attr('class');
			
			// music rating
			console.log(music.children('.star').raty('score'));
			var musicRating = music.children('.star').raty('score');
			
			if(typeof musicRating != 'undefined'){
				items[musicid] = 'val.' + musicRating;	
			}
		});
		
		console.log(items);
		
		post('/projectbox/PreferenceAddAction.box', items);
	}
	
</script>

</head>
<body>
	
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div>
			<input type="button" onclick="window.location='./main.box';" value="취소">
			<input type="button" onClick="getStars()" value="확인">
		</div>
	</div>
	<!-- /.container --> </nav>
	
	<c:forEach var="b" items="${musiclist}">
		<div class="col-md-3 portfolio-item">
			
			<img class="img-responsive img-center"
			src="
                  <c:url value='/img/${b.albumcoverfilepath}'/>"
			alt="">
			<div class="musicrating">
				<center class="${b.id}">
					<div class='star'></div>
				</center>
			</div>
			<div class="well well-sm">
				<c:out value="${b.title}" />
				<br>
			</div>
		</div>
	</c:forEach>
	
</body>
</html>