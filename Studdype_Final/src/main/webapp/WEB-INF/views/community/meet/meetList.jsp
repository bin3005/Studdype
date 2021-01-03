<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meet List Page</title>

	<link rel="stylesheet" href="./resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="./resources/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="./resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="./resources/assets/css/modal-video.min.css">
	<link rel="stylesheet" href="./resources/assets/css/animate.css">
	<link rel="stylesheet" href="./resources/assets/css/normalize.css">
	<link rel="stylesheet" href="./resources/css/style.css">
    <link rel="stylesheet" href="./resources/assets/css/responsive.css">
    <link rel="stylesheet" href="./resources/css/community/header&footer.css">
    <link rel="stylesheet" href="./resources/css/community/leftnavi.css">
    <link rel="stylesheet" href="./resources/css/community/mainsection.css">
    <link rel="stylesheet" href="./resources/css/community/meet.css">
	<script src="./resources/assets/js/jquery.3.2.1.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
		    var owl = $('.owl-carousel');
		    
		    owl.owlCarousel({
		        items:1,                 // 한번에 보여줄 아이템 수
		        loop:true,               // 반복여부
		        //margin:35,               // 오른쪽 간격
		        autoplay:true,           // 자동재생 여부
		        autoplayTimeout:1800,    // 재생간격
		        autoplayHoverPause:false  //마우스오버시 멈출지 여부
		    });    
		    
		    $('.customNextBtn').click(function() {
		        owl.trigger('next.owl.carousel');
		    })
		    
		    $('.customPrevBtn').click(function() {
		        owl.trigger('prev.owl.carousel', [300]);
		    })
		});
	</script>
	
</head>
<body>

	<jsp:include page="../../commond/communityHeader.jsp"></jsp:include>
	<jsp:include page="../../commond/communityLeftNavi.jsp"></jsp:include>
	
     <!--main conternt 섹션-->
     <div class="main-section">
        
		<!-- 모임관리 페이지 슬라이더 영역 -->
		<div class="owl-carousel hero-slider-area" id="mainBanner" style=" box-shadow: 5px 5px 5px;">
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage1.png">
			</div>
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage2.png">
			</div>
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage3.png">
			</div>
			<div class="hero-slider-info">
				<img src="./resources/assets/img/banner_meetingPage4.png">
			</div>
		</div>
		<!-- 슬라이더 끝 -->        
		
        <c:choose>
		
			<c:when test="${empty list}">
				<tr>
					<td colspan="2">---- 모임이 존재하지 않습니다. ---- </td>
				</tr>
			</c:when>
						
			<c:otherwise>
				<c:forEach var ="meetDto" items="${ list }">
					<table id="tableList">
			        	<tr>
			        		<td style="width: 50%">
						        <div>
							        <table id="meetList" onclick="location.href='meetdetail.do'">
										<tr>
											<td id="date"><fmt:formatDate value="${meetDto.meet_regdate}" pattern="yy.MM.dd"/></td>
											<td id="location"><img src="./resources/assets/img/profile_placeholder.png">스타벅스 대치사거리</td>
										</tr>
										<tr>
											<td id="title" colspan="2">${ meetDto.meet_title }</td>
										</tr>
										<tr>
											<td id="writer">${ meetDto.meet_writer }</td>
											<td id="recruitment">모집기간 <fmt:formatDate value="${ meetDto.vote_startdate }" pattern="yy.MM.dd"/> ~ <fmt:formatDate value="${ meetDto.vote_enddate }" pattern="yy.MM.dd"/></td>
										</tr>
									</table>
								</div> 
							</td>
							<td style="width: 50%;">
								<div>
							        <table id="voteList" onclick="location.href='meetdetail.do'">
										<tr>
											<td id="attend_y" class="attend">참석</td>
											<td class="graph"></td>
											<td class="percentage">82%</td>
										</tr>
										<tr>
											<td id="attend_n" class="attend">불참석</td>
											<td class="graph"></td>
											<td class="percentage">18%</td>
										</tr>
										<tr>
											<td colspan="3" id="member_count">참여인원: 13명</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						
					</table>
				</c:forEach>
			</c:otherwise>
	
		</c:choose>
		<div>
			<button class="submitBtn" id="listBtn_insertform" onclick="location.href='meetinsertform.do'">모임 등록</button>
		</div>
        
        <!-- 모임리스트와 투표리스트 테이블을 각각 구현 -->
        <!-- table 중첩 되어있음 현재 경로는 테스트용으로 잡아놓은 것임 -->
        <!-- 
        <table id="tableList">
        	<tr>
        		<td>
			        <div>
				        <table id="meetList" onclick="location.href='meetdetail.do'">
							<col width="400px"><col width="200px">
							<tr>
								<td id="date">21.01.01</td>
								<td id="location"><img src="./resources/assets/img/profile_placeholder.png">스타벅스 대치사거리</td>
							</tr>
							<tr>
								<td id="title" colspan="2">홍길동의 스터디 첫 정모</td>
							</tr>
							<tr>
								<td id="writer">홍길동</td>
								<td id="recruitment">모집기간 2020.12.25~2020.12.31</td>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div>
				        <table id="voteList" onclick="location.href='meetdetail.do'">
							<col width="100px"><col width="300px"><col width="200px">
							<tr>
								<td id="attend_y">참석</td>
								<td></td>
								<td>82%</td>
							</tr>
							<tr>
								<td id="attend_n">불참석</td>
								<td></td>
								<td>18%</td>
							</tr>
							<tr>
								<td colspan="3" id="member_count">참여인원: 13명</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
				        <table id="meetList" onclick="location.href='meetdetail.do'">
							<col width="400px"><col width="200px">
							<tr>
								<td id="date">21.01.01</td>
								<td id="location"><img src="./resources/assets/img/profile_placeholder.png">스타벅스 대치사거리</td>
							</tr>
							<tr>
								<td id="title" colspan="2">홍길동의 스터디 첫 정모</td>
							</tr>
							<tr>
								<td id="writer">홍길동</td>
								<td id="recruitment">모집기간 2020.12.25~2020.12.31</td>
							</tr>
						</table>
					</div>
				</td>
				<td>
					<div>
				        <table id="voteList" onclick="location.href='meetdetail.do'">
							<col width="100px"><col width="300px"><col width="200px">
							<tr>
								<td id="attend_y">참석</td>
								<td></td>
								<td>82%</td>
							</tr>
							<tr>
								<td id="attend_n">불참석</td>
								<td></td>
								<td>18%</td>
							</tr>
							<tr>
								<td colspan="3" id="member_count">참여인원: 13명</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
		<div>
			<button class="submitBtn" id="listBtn_insertform" onclick="location.href='meetinsertform.do'">모임 등록</button>
		</div>
		-->
    </div>
   
    
    <jsp:include page="../../commond/communityFooter.jsp"></jsp:include>
    <script src="./resources/assets/js/popper.min.js"></script>
    <script src="./resources/assets/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/owl.carousel.min.js"></script>
    <script src="./resources/assets/js/modal-video.js"></script>
    <script src="./resources/assets/js/loadmore.js"></script>
    <script src="./resources/assets/js/prefixfree.min.js"></script>
    <script src="./resources/assets/js/main.js"></script>
</body>
</html>