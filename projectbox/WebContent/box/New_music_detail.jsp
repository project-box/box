<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a class="navbar-brand" href="main.box">BOX</a>
                
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
            
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#portfolio">
                        	<i class="fa fa-search" aria-hidden="true" style="font-size: 20px;"></i>
						</a>
                    </li>
                    <li>
                    	<a href="#navigation-main">
                       		<i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <div class="container">
    
<!-- 최신곡 -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">곡 정보
                    <small>
                    	<a href="NewMusicDetail.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
            
          <table>
          	<tr>
          	 <td rowspan="4"><img class="img-responsive img-center" src="
							<c:url value='/img/${b.albumcoverfilepath}'/>" alt="" ></td>
			<td style="font-family:Tahoma;font-size:25pt;">
						<div align="center">${b.title}</div></td>
            </tr>
            <tr>
            	<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">아티스트: ${b.artist}</div></td>
			</tr>
			<tr>
				<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">발매일: ${b.publishdate}</div></td>
			</tr>
			<tr>
				<td style="font-family:Tahoma;font-size:10pt;">
						<div align="center">장르: ${b.genre}</div></td>
			</tr>
          </table>
          
   
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
</body>
</html>