<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>파양입소신청 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">함께 할 수 없다면..<br>유기하지말고 저희에게 아이를 보내주세요.</h1>
          </div>
        </div>
      </div>
    </section>

   <div class="subvisual">
		<div class="inner">
			<h2>입소 신청</h2>
		</div>
	
	
	 <div class="container">
	 
		 <table class="table table-hover">
		 	
		 	<thead>
		 		<tr>
		 			<th>번호</th>
		 			<th>제목</th>
		 			<th>글쓴이</th>
		 			<th>조회수</th>
		 			<th>날짜</th>
		 			<th>첨부</th>
		 		</tr>
		 	</thead>
		 	
		 	<c:forEach var="list" items="${enterList }">
		 	<tbody>
		 		<tr>
		 			<td>${list.bno}</td>
		 			<td>${list.title}</td>
		 			<td>${list.name}</td>
		 			<td>${list.viewcount}</td>
		 			<td>
		 				<fmt:parseDate var="regdate" value="${list.regdate}" pattern="yyyy-MM-dd"/>  <!--스트링을 날짜형식으로 바꿔서 var에 저장  -->
						<!-- 패턴방식으로 value값을 var란 변수에 저장하시오 -->
						<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/> <!--날짜출력  -->
		 			</td>
		 			<td><i class="fa fa-paperclip" aria-hidden="true"></i></td>
		 		</tr>
		 	</tbody>
		 	</c:forEach>
		 </table> 
		 <div class="button-center">
		 <input type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" onclick="javascript:gogo();" value="신청하기" style="float: right;">
		 <script>
		 	function gogo(){
		 		window.location.href="enterwrite.do";
		 	}
		 </script>
		 
		  <div class="row mt-5">
	          <div class="col text-center">
	            <div class="block-27 pagination-bottom">
	              <ul>
	                <li><a href="#">&lt;</a></li>
	                <li class="active"><span>1</span></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">4</a></li>
	                <li><a href="#">5</a></li>
	                <li><a href="#">&gt;</a></li>
	              </ul>
	            </div>
	          </div>
	        </div>
	        </div> 
	 	</div>
	</div>

<%@ include file = "../footer.jsp" %>

