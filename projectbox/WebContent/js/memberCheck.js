$(document).ready(function() {
				// 전송버튼 클릭시 유효성 검사
				$("form").submit(function() {

							if ($("#MEMBER_ID").val() == "") {
								alert("ID를 입력하세요");
								$("#MEMBER_ID").focus();
								return false;
							}
							if ($("#MEMBER_PW1").val() == "") {
								alert("비밀번호를 입력하세요");
								$("#MEMBER_PW1").focus();
								return false;
							}
							if ($("#MEMBER_PW2").val() == "") {
								alert("비밀번호를 확인하세요");
								$("#MEMBER_PW2").focus();
								return false;
							}
							if ($("#MEMBER_PW2").val() != $("#MEMBER_PW1").val()) {
								alert("비밀번호가 일치하지 않습니다.");
								$("#MEMBER_PW2").val("").focus();
								return false;
							} 							
							if ($("#MEMBER_NAME").val() == "") {
								alert("이름을 입력하세요");
								$("#MEMBER_NAME").focus();
								return false;
							}
							if ($("#MEMBER_Email1").val() == "") {
								alert("EMAIL주소를 입력하세요");
								$("#MEMBER_Email1").focus();
								return false;
							}
							if ($("#MEMBER_Email2").val() == "") {
								alert("Domain을 입력하세요");
								$("#MEMBER_Email2").focus();
								return false;
							}
							if ($("#male").is(":checked") == false &&
								$("#female").is(":checked") == false) {
								alert("성별을 입력하세요");
								return false;
							}
							if($("#MEMBER_PHONE1").val() == ""){
								alert("휴대폰 앞자리 번호를 선택하세요");
								return false;
							}
							if ($("#MEMBER_PHONE2").val() == "") {
								alert("휴대폰 가운데 번호를 입력하세요");
								$("#MEMBER_PHONE2").focus();
								return false;
							}
							if (isNaN($("#MEMBER_PHONE2").val())) {
								alert("숫자만 입력하세요");
								$("#MEMBER_PHONE2").val("").focus();
								return false;
							}							
							if ($("#MEMBER_PHONE3").val() == "") {
								alert("휴대폰 끝자리 번호를 입력하세요");
								$("#MEMBER_PHONE3").focus();
								return false;
							}
							if (isNaN($("#MEMBER_PHONE3").val())) {
								alert("숫자만 입력하세요");
								$("#MEMBER_PHONE3").val("").focus();
								return false;
							}	
							if ($("#MEMBER_AGE").val() == "") {
								alert("나이를 입력하세요");
								$("#MEMBER_AGE").focus();
								return false;
							}
							if (isNaN($("#MEMBER_AGE").val())) {
								alert("숫자만 입력하세요");
								$("#MEMBER_AGE").val("").focus();
								return false;
							}	

						}); //submit() end
			

	// ID중복확인
	$("#idcheck").click(function(){
		if ($("#MEMBER_ID").val() == "") {
			alert("원하는 ID를 생성하세요");
			$("#MEMBER_ID").focus();
		} else {
			var ref = "/projectbox/idCheck.box?id=" + $("#MEMBER_ID").val();
			window.open(ref, "myid", "width=300,height=200");
		}
	});
		

	/* EMail 주소를 선택하는 경우 이벤트 처리*/					
	$("#sel").change(function(){
		if($("#sel").val() == ""){
			$("#MEMBER_Email2").attr("disabled",false);
			$("#MEMBER_Email2").val("").focus();			
		}else{
			$("#MEMBER_Email2").val($("#sel").val());
			$("#MEMBER_Email2").attr("disabled","disabled");
		}
	});
	
});