<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="/box/header.jsp"%>

<title>b o x</title>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>
	$(document).ready(function() {
		$("#del").submit(function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력 하세요?");
				$("#password").focus();
				return false;
			}
		});
	});
</script>


</head>
<body>
	<div>
		<table class="table table-striped" style="margin: auto; width: 60%;">

			<form action="/projectbox/boardDeleteAction.box" method="post">
				<input type="hidden" name="id" value="${param.id}"> <input
					type=hidden name=page value="${param.page}">

				<tr>
					<td><font size=2>글 비밀번호 : </font></td>
					<td><input name="password" id="password" type="password">
					</td>
				</tr>
				<tr align=center valign="middle">
					<td colspan=2>
						<!-- 삭제 --> <input type="image" src="/projectbox/img/remove.jpg"
						width="70px" id="del"> <!-- 취소 --> <input type="image"
						src="/projectbox/img/cancel.jpg" width="70px"
						onClick="history.go(-1)"> <!-- <image src="/projectbox/img/cancel.jpg" width="70px" onClick="history.go(-1)"/> -->

					</td>
				</tr>

			</form>


<div>
<table class="table table-striped" style="margin: auto; width: 60%;">

<form action="/projectbox/boardDeleteAction.box" method="post">
<input type="hidden" name="id" value="${param.id}">
<input type=hidden name=page value="${param.page}">

<tr>
	<td>
		<font size=2>글 비밀번호 : </font>
	</td>
	<td>
		<input name="password" id="password" type="password">
	</td>
</tr>
<br>
<tr align=center valign="middle">
	<td colspan=2>
		<!-- 삭제 -->
		<input type="image" src="/projectbox/img/remove.jpg" width="70px" id="del">
		
		<!-- 취소 -->
		<input type="image" src="/projectbox/img/cancel.jpg" width="70px" onClick="history.go(-1)">
		<!-- <image src="/projectbox/img/cancel.jpg" width="70px" onClick="history.go(-1)"/> -->	
		
	</td>
</tr>

</form>

</table>
</div>




<!-- Footer -->
        <footer style="text-align:center">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; designed by box 2016 </p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

		</table>

	</div>

	<%@ include file="/box/footer.jsp"%>
</body>
</html>