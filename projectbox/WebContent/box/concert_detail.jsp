<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

	<%@ include file= "/box/header.jsp" %>

	<title>b o x</title>

<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- 구글맵 부트스트랩 -->
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD0Id8D7bkKotALpSG6e_q4LhgjP8cwpg8"
  type="text/javascript"></script>
  
<!-- <script>
var lat = '${concertdata.locationx}'
var lon = '${concertdata.locationy}'
function initialize() {
  var mapProp = {
	center:new google.maps.LatLng(lat, lon),	  
//  center:new google.maps.LatLng(37.497975, 127.027506),
    zoom:18,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);  
}
//google.maps.event.addDomListener(window, 'load', initialize);
//}
</script> -->

<script>
var lat = '${concertdata.locationx}'
var lon = '${concertdata.locationy}'
var myCenter=new google.maps.LatLng(lat, lon);
var marker;
//var divid = document.getElementById("map1");

function initialize()
{
var mapProp = {
  center:myCenter,
  zoom:18,
  mapTypeId:google.maps.MapTypeId.ROADMAP
  };

var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

var marker=new google.maps.Marker({
  position:myCenter,
  animation:google.maps.Animation.BOUNCE
  });

marker.setMap(map);
}

google.maps.event.addDomListener(window, 'load', initialize);
//google.maps.event.addDomListener(divid, 'click', initialize());
</script>
	
	
<!-- 유효성검사 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function getRequest() {
    if(location.search.length > 1) {
        var get = new Object();
        var ret = location.search.substr(1).split('&');
        for(var i = 0; i < ret.length; i++) {
            var r = ret[i].split('=');
            get[r[0]] = r[1];
        }
        return get;
    }else{
        return false;
    }
}





$(document).ready(function() {
	  var get = getRequest();
	  var param = get['param'];
	  
  
	  if(param == '123'){
		  $("#second").attr('class','active');
		  $("#menu2").attr('class', 'tab-pane fade in active');
	  } else {
		  $("#first").attr('class','active');
		  $("#menu1").attr('class', 'tab-pane fade in active');
	  }
	  

	$("form").submit(function(){
		if($("#content").val()==""){
			alert("내용을 입력 하세요");
			$("#content").focus();
			return false;
			}
		}); 	
	
	
	$("#map1").click(function(){	
//		alert('호출');
		
		initialize();
		
//		google.maps.event.addDomListener(window, 'load', initialize);
		
	});
	
});
 </script>

<style type="text/css">
.image {
	float: left;
	margin: 20px; */
}

.info {
	float: center;
	margin: 20px;
}

.btn-default {
      background: #000;
      color: #fff;
   }
   
 .btn-default:hover {
      background: #fff;
      color: #000;
      border: 1px solid black;
     
   } 
   
 .btn-gray {
 	  background: #808080;
 	  color: #fff;
 }
 
 .btn-gray:hover {
      background: #fff;
      color: #000;
      border: 1px solid black;
     
   }
   
  .btn-insert {
     height: 67px;
     background: #000;
      color: #fff;
  		
  }
 

</style>


</head>
<body>

	<div class="container">
		<h3>${concertdata.title}</h3>
		<hr size="10">
		
		
		<div class="image">
			<img src="./img/${concertdata.posterfilepath}" width="157" height="191" alt="title" />
		</div>
		
		
		<div class="info">
			<b>장소</b>&nbsp;&nbsp;&nbsp;&nbsp;${concertdata.place}<br> <br> 
			<%-- <b>기간</b>&nbsp;&nbsp;&nbsp;&nbsp;${concertdata.startdate}~${concertdata.enddate}<br> <br> --%>
			<b>기간</b>&nbsp;&nbsp;&nbsp;&nbsp;
			<fmt:formatDate value="${concertdata.startdate}" pattern="yyyy-MM-dd"/>
			~
			<fmt:formatDate value="${concertdata.enddate}" pattern="yyyy-MM-dd"/><br> <br>
			<b>가격</b> &nbsp;&nbsp;&nbsp;&nbsp;VIP석 : 30,000원 <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;R석 : 10,000원<br><br>
			<a class="btn btn-default" href="/projectbox/ConcertTicket.box">예매하기</a>
			<a class="btn btn-gray" href="/projectbox/main.box">취소</a>
			
		</div>
		
		
		<ul class="nav nav-tabs">
			<li id="first"><a data-toggle="tab" href="#menu1"><b>상세정보</b></a></li>
			<li id="second" ><a data-toggle="tab" href="#menu2"><b>관람후기</b></a></li>
			<li id="map1"><a data-toggle="tab" href="#menu3"><b>공연장위치</b></a></li>
			<li><a data-toggle="tab" href="#menu4"><b>티켓취소/환불</b></a></li>
		</ul>


		<div class="tab-content">		
			<div id="menu1" class="tab-pane fade">	<!-- 상세정보 -->									
					<br><b>공연시간</b><br>
					<p>${concertdata.showtime}</p><br>
					<b>할인정보</b><br>
					<p>휴가철 막바지 세일 - 20% 할인</p><br>
					<b>공연관련정보</b><br> <br>
					<table class="table table-bordered">
						<tr align=center>
							<td width=50>주최/기획</td>
							<td width=200>(주)커뮤니케이션</td>
							<td width=50>고객문의</td>
							<td width=200>111-1111</td>
						</tr>
						<tr align=center>
							<td>주연</td>
							<td>${concertdata.artist}</td>
							<td>공연장소</td>
							<td>${concertdata.place}</td>
						</tr>
						<tr align=center>
							<td>예매수수료</td>
							<td>1,000원</td>
							<td>배송료</td>
							<td>2,500원</td>
						</tr>
					</table>
				</div>
			
			<!-- 후기 입력 폼 -->			
			<div id="menu2" class="tab-pane fade">		
			
		<br> <b>관람후기 보기</b><br> <br>
<form action="/projectbox/ConBoardAddAction.box" method="post" name="conboardform">
<input type="hidden" name="concertid" value="${concertdata.id}"/>
<input type="hidden" name="userid" value="${sessionScope.loginId}" />
<table align="center" valign="middle" border="0" width="550">
   <tr >
    <td >
     <textarea name="content" id="content"
     rows="3" cols="65" placeholder="후기를 입력 해주세요"></textarea>
     </td>
     <td>
        <input type="submit" value="후기입력" class="btn btn-insert"/>
    </td>
   </tr>
  </table>
</form>



<!-- 후기 리스트 출력-->
<br><table class="table table-bordered" align=center 
            width=600 border="1" cellpadding="0" cellspacing="0">
<!-- 레코드가 있으면 -->
<c:if test="${!empty conboardlist}">
<tr align="center" valign="middle">  
		<td style="font-size:8pt; color: red;" width="8%">
			<div align="center"><b>번호</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="10%">
			<div align="center"><b>아이디</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="50%">
			<div align="center"><b>관람후기</b></div>
		</td>
		<td style="font-size:8pt; color: red;" width="32%">
			<div align="center"><b>날짜</b></div>
		</td>		
</tr>
		
		<!-- 화면 출력 번호 -->		
	    <c:set var="num" value="${listcount-(page-1)*10}"/> 	
	    <c:forEach var="c" items="${conboardlist}">	
	    
	    <!-- 번호 출력 부분 -->
 <tr align="center" valign="middle">
		<td>		
		<c:out value="${num}"/>				
		<c:set var="num" value="${num-1}"/>					
		</td>					
		<td>${c.userid}		</td>
		<td style="width:200px; overflow:hidden; word-break:break-all; text-overflow:ellipsis;">
		${c.content}</td>
		<td>${fn:substring(c.registerdate,0,16)}		
		<a href="./ConBoardDeleteAction.box?id=${c.id}&concertid=${c.concertid}">
		
			[삭제]</a>&nbsp;&nbsp;
       </td>		  
</tr>	
	  </c:forEach>	
	  	
	
	<%-- <!-- 후기 페이지번호 출력 -->
	<!-- 이전버튼 -->
<tr align=center height=20>
		<td colspan=4>
		<c:if test="${page <= 1 }">	[이전]&nbsp;	</c:if>
		<c:if test="${page > 1 }">			
				 <a href="./ConcertDetail.box?page=${page-1}&param=123&id=${concertdata.id}">[이전]</a>&nbsp;
		</c:if>
    <!-- 현재페이지 -->
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="./ConcertDetail.box?page=${a}&param=123&id=${concertdata.id}">[${a}]</a>&nbsp;
					</c:if>
			</c:forEach> 
	<!-- 다음버튼 -->	
	      <c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="./ConcertDetail.box?page=${page+1}&param=123&id=${concertdata.id}">[다음]</a>
			</c:if>
	</td>
	</tr> --%>
	</c:if>
	
	
<!-- 레코드가 없으면 -->
	<c:if test="${empty conboardlist}">
			<tr align="center" valign="middle">
		<td colspan="4" height="200">
			<font size=2>등록된 후기가 없습니다.</font>
		</td>
	</tr></c:if>

</table>
			</div>
			
			
			
		<!-- 공연장 위치 -->
			<div id="menu3" class="tab-pane fade">
					<br> <b>공연장 위치</b><br> <br>
					<div id="googleMap" style="width:500px;height:380px;"></div>										
					<br> <br>
			</div>
			
			
			
			
			
			<div id="menu4" class="tab-pane fade">	<!-- 티켓취소/환불 안내 -->					
					<br> <b>티켓취소 안내</b> <br> <br>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width=320>행사일</th>
								<th width=300>취소수수료(인터넷,콜센터)</th>
								<th width=550>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr align=center>
								<td>예매후 7일 이내/예매당일</td>
								<td>없음</td>
								<td rowspan=5>예매 당일에 취소하는 경우 이외에는<br> 예매수수료가 환불되지 않음<br>
									예매 후 7일 이내라도 취소 시점이 공연일로부터<br> 10일 이내라면 그에 해당하는 취소수수료가 부과됨<br>
									예매 취소 시, 최소 결제금액 정책으로<br> 1,000원 미만 수수료에 대하여 1,000원으로 결제
								</td>
							</tr>
							<tr align=center>
								<td>예매후 8일 ~ 관람일 10일 전</td>
								<td>장당 4,000원<br> * 티켓금액의 10%이내
								</td>
							</tr>
							<tr align=center>
								<td>관람일 9일 전 ~ 7일 전</td>
								<td>티켓금액의 10%</td>
							</tr>
							<tr align=center>
								<td>관람일 6일 전 ~ 3일 전</td>
								<td>티켓금액의 20%</td>
							</tr>
							<tr align=center>
								<td>관람일 2일 전 ~ 1일 전</td>
								<td>티켓금액의 30%</td>
							</tr>
						</tbody>
					</table>

					<b>티켓환불 안내</b><br> <br> 신용카드 : 취소 시 승인이 취소됩니다.<br>
					무통장입금 : 인터넷 또는 콜센터로 접수된 고객님의 환불계좌로 입금해드립니다.<br> <br>
				</div>
			</div>
		</div>
		

		
		<!-- Footer -->
        <!-- <footer style="text-align:center">
            <div class="row">
                <div class="col-lg-12" style="font-size:10px">
                    <p>Copyright &copy; 2016 box Inc. 모든 권리 보유. </p><br>
                    <p>사업자등록번호 : 510-11-24601 | 통신판매업신고번호 : 제 2011-서울강남-00810호 | 대표이사 : 마크장 | 주소 : 서울특별시 강남구 영동대로 517 아셈타워 39층 | 대표전화 : 02-6512-8000 | 팩스 : 02-6128-8000</p>
                </div>
            </div>
            /.row
        </footer> -->
		

	<%@ include file= "/box/footer.jsp" %>       

		
</body>
</html>

