<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>입양 후기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">따뜻한 입양후기를 모두에게 들려주세요. </h1>
          </div>
        </div>
      </div>
    </section>

     <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>입양 후기</h2>
          </div>
        </div>
      <p>총게시글 <span style="color:#00cc00">${count}</span>건</p>
        <div class="row d-flex">
          <c:set var="num" value="${count-((pageMaker.cri.pageNum-1)*4)}"/>
          <c:forEach var="list" items="${reviewList}">
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch" style="width:100%;">
            <div class="image_size_controll">
              <a href="reviewview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}" class="block-20 rounded"
              style="background:url(${pageContext.request.contextPath}/upload/${list.imgurl}); background-size:cover; background-position:center;">
              </a>
            </div>
              <div class="text p-4">
              	<div class="meta mb-2">
                  <div><span style="border: 1px solid #dbd5d5; padding: 6px; border-radius: 10px;">NO.${num}</span>
						<span class="cat">
							<fmt:parseDate var="regdate" value="${list.regdate}" pattern="yyyy-MM-dd"/>  <!--스트링을 날짜형식으로 바꿔서 var에 저장  -->
							<!-- 패턴방식으로 value값을 var란 변수에 저장하시오 -->
							<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/> <!--날짜출력  -->
						</span>
					</div>	
                  <div><a href="reviewview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${list.writer}</a></div>
                  <div><a href="reviewview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}" class="meta-chat"><span class="fa fa-comment"></span> 3</a></div>
                </div>
                <h3 class="heading"><a href="reviewview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}">${list.title}</a></h3>
              </div>
            </div>
          </div>
            <c:set var="num" value="${num-1 }"/>
            </c:forEach>
         
         
        </div>
       
        

      </div>
    </section>
    <section>
    	         <div class="button-center" style="clear:both;">
	<input type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" onclick="javascript:gogo();"value="글쓰기" style="float: right; margin-right: 234px;">
	 <script>
	 	function gogo() {
	 		window.location.href="reviewwrite.do";
	 	}
	 </script>
	  <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27 pagination-bottom paging">
            <ul style="margin: 4px 10px 170px 333px;">
              	<c:if test="${pageMaker.prev}">
              		<li><a href="${pageMaker.startPage-1}"><i class="fa fa-angle-double-left"></i></a></li>
              	</c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                	<li class="${pageMaker.cri.pageNum == num?'active':''}"><a href="${num}">${num}</a></li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                	<li><a href="${pageMaker.endPage+1}"><i class="fa fa-angle-double-right"></i></a></li>
                </c:if>
             </ul>
               
            </div>
          </div>
        </div>
        </div> 
    </section>
	<form id="actionForm" action="review.do" method="get">
         <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
         <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
  		<input type="hidden" name="sel" value="${pageMaker.cri.type}">
  		<input type="hidden" name="word" value="${pageMaker.cri.keyword}">
      </form>
<%@ include file = "../footer.jsp" %>