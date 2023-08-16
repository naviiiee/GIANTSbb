<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 예매확인 --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/NSH/ticket.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.portone.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ticket.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<div class="page-main">
	<div class="main-title">
		<img src="${pageContext.request.contextPath}/images/title_icon.gif" class="title-img">
		<h2>예매확인</h2>
		<hr size="0.05" width="100%" noshade>
	</div>
	<form action="order.do" id="ticket_order" method="post">
		<div class="check-info">
			<%-- 왼쪽 절반 --%>
			<div class="select-left" style="background:#f1f1f1;">
				<div class="left-no1">
					<h2>수령방법</h2>
					<div class="back-white">
						<div id="border_text">현장수령</div>
					</div>
				</div>
				<div class="left-no2">
					<h2>주문자 정보</h2>
					<div class="back-white">
						<table class="order-info">
							<tr>
								<th>이름</th>
								<td>${seatVO.detailVO.mem_name}</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${seatVO.detailVO.mem_phone}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${seatVO.detailVO.mem_email}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="left-no3">
					<h2>예매자 확인</h2>
					<input type="checkbox" name="check_info" id="check_info1"> KBO리그 SAFE 캠페인에 동의합니다.<br>
					<input type="checkbox" name="check_info" id="check_info2"> 프로 스포츠 암표 매매 행위에 따른 제재사항에 동의합니다.
				</div>
			</div>
			<%-- 오른쪽 절반 --%>
			<div class="select-right">
				<div class="select-gameInfo">
					<hr width="100%" class="color-red" noshade>
					<div class="game-information">
						<h2>경기정보</h2>
						<div class="game-logo">
							<img src="${pageContext.request.contextPath}/images/giants.png"> VS <img src="${pageContext.request.contextPath}/images/${gameVO.game_team}.png">
						</div>	
						롯데 VS ${gameVO.game_team}<br>
						사직야구장<br>
						${gameVO.game_date} ${gameVO.game_time}<br>
					</div>
					<div class="ticketInfo">
						<h2>좌석정보</h2>
						<div id="seatInfo">
							<input type="hidden" name="title" id="grade_title" value="${gradeVO.title}">
							<c:forEach var="seat" items="${seatVO.seat}">
							<span class="seat-info">${seat} </span><br>
							</c:forEach>
						</div>
					</div>
					<div class="price-information">
						<table>
							<tr class="price-total">
								<td>결제금액</td>
								<td>
									<c:if test="${gameVO.game_state == 0}">${gradeVO.price_week}</c:if>
									<c:if test="${gameVO.game_state == 1}">${gradeVO.price_weekend}</c:if>
								</td>
							</tr>
						</table>
					</div>
					<hr width="100%" class="color-red" noshade>
					<div class="group-btn">
						<input type="button" value="이전" class="default-btn big" onclick="location.href='ticketMain.do?game_num=${gameVO.game_num}'">
						<input type="submit" value="결제" class="accept-btn big">
					</div>	
				</div>
			</div>
		</div>
	</form>
</div>