$(document).ready(function(){
    		
    		// 글작성 버튼 클릭 
    		$("#regist").click(function(){    				
    			
    			if($("#name").val() == ""){
    				alert("이름을 입력하세요");
    				$("#name").val("").focus();
    				return false;
    			} 
    			if($("#title").val() == ""){
    				alert("제목을 입력하세요");
    				$("#title").val("").focus();
    				return false;
    			}
    			if($("#content").val() == ""){
    				alert("내용을 입력하세요");
    				$("#content").val("").focus();
    				return false;
    			}    			
    			
    		}); // click() end
    		
    		
    		// 취소 버튼 클릭
    		$("#cancel").click(function(){
    			$("#name").val("").focus();
    			$("#title").val("");
    			$("#content").val("");
    			return false;
    		});
    		
    	});  // ready() end 