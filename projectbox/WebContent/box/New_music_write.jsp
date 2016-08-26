<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>b o x</title>

 	<!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
<script>
	$(function() {
		$("#publishdate").datepicker();
	});
</script>

<script>
	$(document).ready(function() {
		$("form").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력 하세요");
				$("#title").focus();
				return false;
			}
			if ($("#artist").val() == "") {
				alert("아티스트를 입력 하세요");
				$("#artist").focus();
				return false;
			}
			if ($("similarity").val() == "") {
				alert("유사성를 입력 하세요");
				$("#artist").focus();
				return false;
			}
			if ($("#publishdate").val() == "") {
				alert("발매일을 입력 하세요");
				$("#publishdate").focus();
				return false;
			}
			if ($("#genre").val() == "") {
				alert("내용을 입력 하세요");
				$("#genre").focus();
				return false;
			}
			if ($("#lyrics").val() == "") {
				alert("가사를 입력 하세요");
				$("#lyrics").focus();
				return false;
			}
			if ($("#album").val() == "") {
				alert("앨범수록곡을 입력 하세요");
				$("#album").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">곡 등록하기
                    <small>
                    	<a href="recommendMusicList.box" aria-label="Skip to main navigation">
						  <i class="fa fa-bars" aria-hidden="true"></i>
						</a>
					</small>
                </h1>
            </div>
<form action="/projectbox/BoxNewmusicAddAction.box" method="post"
	     	enctype="multipart/form-data" name="Newmusicform">
		<table >
			<!-- <tr align="center" valign="middle">
				<td colspan="5">곡 등록하기</td>
			</tr> -->
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">제목</div>
				</td>
				<td><input name="title" id="title" type="text" size="10"
					maxlength="10" value="" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">아티스트</div>
				</td>
				<td><input name="artist" id="artist" type="text" size="10"
					maxlength="10" value="" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">유사성</div>
				</td>
				<td><input name="similarity" id="similarity" type="test"
					size="10" maxlength="10" value="" />
			<tr>
				<td style="font-family: 돋음; font-size: 12" height="16">
					<div align="center">발매일</div>
				</td>
				<td><input name="publishdate" id="publishdate" type="text"
					size="10" maxlength="10" value="" /></td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">장르</div>
				</td>
				<td><select name="genre" id="genre">
						<option value="">---
						<option value="발라드">발라드
						<option value="락">락
						<option value="R&B">R&B
						<option value="힙합/랩">힙합/랩
						<option value="팝">팝
				</select><br>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">가사</div>
				</td>
				<td><textarea name="lyrics" id="lyrics" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">앨범수록곡</div>
				</td>
				<td><textarea name="album" id="album" cols="67" rows="15"></textarea>
				</td>
			</tr>
			<tr>
				<td style="font-family: 돋음; font-size: 12">
					<div align="center">앨범사진</div>
				</td>
				<td><input name="Albumcoverfilepath" type="file" /></td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="5"><input type=submit value="등록"> <input
					type=reset value="취소"></td>
			</tr>
		</table>
	</form>

</body>
</html>