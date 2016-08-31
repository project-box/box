<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<%@ include file= "/box/header.jsp" %>

<style type="text/css">
	.image {float:left;}
	.info {float:left;}
	
</style>
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
	
</head>
<body>
    
    <div class="container">
    
<!-- 최신곡 -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">곡 정보
                 <small>
                    	<a href="NewMusicList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
		<hr size="10">
		
		<div class="image">
			<img class="img-responsive img-center"  width="350" height="400" src="
							<c:url value='/img/${Newmusicdata.albumcoverfilepath}'/>" alt="" >
		</div>

        <div class="info">
			<b><div align="center"><Font Size="30" color="#777777">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${Newmusicdata.title}</Font></div></b><br><br> 
			
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				아티스트 :</b> ${Newmusicdata.artist}</Font></div><br> <br>
			
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				발매일 : </b>
			
					<%-- <c:set var="now" value="${Newmusicdata.publishdate}" /> --%>
		  		    <fmt:formatDate value="${Newmusicdata.publishdate}"  pattern="yyyy-MM-dd" />
		    		
					</Font></div><br> <br>
			<div align="center"><Font Size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				장르  :  </b>${Newmusicdata.genre}</Font></div><br><br><br>
		</div>

	 	<div class="row">
	 	<table width=100%>
 	       <tr>
 	       <td width=50% ><div class="col-lg-12">
                <h1 class="page-header">가사
                 <small>
                    	<i class="fa fa-bars" aria-hidden="true"></i>
					</small>
                </h1></td>
           <td widht=50% ><div class="col-lg-12">
                <h1 class="page-header">앨범 수록곡
                 <small>
						  <i class="fa fa-bars" aria-hidden="true"></i>
					</small>
                </h1></td>
          </tr>
          	<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${Newmusicdata.lyrics}</div></td>
          	<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">${Newmusicdata.album}</div></td>
          <tr>
           </div>
           </table>
        </div>
              
	<%@ include file= "/box/footer.jsp" %>        

</body>
</html>