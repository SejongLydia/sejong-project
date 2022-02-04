<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2">고객센터<i class="ion-ios-arrow-forward"></i></span> <span>문의 게시판 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">당신의 문의를 늘 환영합니다.</h1>
          </div>
        </div>
      </div>
    </section>

   <div class="subvisual">
		<div class="inner">
			<h2>문의 게시판</h2>
		</div>
	
	
	 <div class="container">
	 
	 <div class="search_wrap">
		<div class="record_group">
			<p>총게시글<span> ${count}</span>건</p>
		</div>
		<div class="search_group">
			<form name="myform" method="get" action="notice.do"> 
				<select name="sel" class="select">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="word" class="search_word">
				<button class="btn_search" type="submit"><i class="fa fa-search"></i><span class="sr-only">검색버튼</span></button>
			</form>
		</div>
	  </div> <!-- search end -->
	 <div class="bord_list" style="padding-top: 100px;">
	 <table class="table table-hover">
	 	<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
	 	<thead>
	 		<tr>
	 			<th>번호</th>
	 			<th>제목</th>
	 			<th>답변상태</th>
	 			<th>작성자</th>
	 			<th>작성일</th>
	 			<th>조회수</th>
	 			<th>문의항목</th>
	 		</tr>
	 	</thead>
	 	
	 	<tbody>
	 	<c:set var="num" value="${count}"/>
	 	<c:forEach var="list" items="${inquiryList}">
	 		<tr>
	 			<td>${num}</td>
	 			<td><a href="inquiryview.do?bno=${list.bno}">${list.title}</a></td>
	 			<td><span class="complete">답변완료</span></td>
	 			<td>${list.name}</td>
	 			<td>
	 				<fmt:parseDate var="regdate" value="${list.regdate}" pattern="yyyy-MM-dd"/>
	 				<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/>
	 			</td>
	 			<td>${list.viewcount}</td>
	 			<td>${list.category}</td>
	 		</tr>
	 	<c:set var="num" value="${num-1}"/>
	 	</c:forEach>
	 	</tbody>
	 	
	 </table> 
	 <div class="button-center">
	<input type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" onclick="javascript:gogo();"value="문의하기" style="float: right;">
	 <script>
	 	function gogo() {
	 		window.location.href="inquiry.do";
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
	</div>

<%@ include file = "../footer.jsp" %>

