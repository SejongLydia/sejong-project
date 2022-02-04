<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../header.jsp" %>

  <section class="hero-wrap hero-wrap-2" style="background-image: url('images/copy6.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home > <i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2">소개  > <i class="ion-ios-arrow-forward"></i></span><span>새소식 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">SJ동물보호소의 새소식을 전해드립니다.</h1>
          </div>
        </div>
      </div>
    </section>
    
   <section class="ftco-section">
   	
      <div class="container">
      <p>총게시글 <span style="color:#00cc00">${count}</span>건</p>
        <div class="row">
          <div class="col-lg-8 ftco-animate">
          	<c:set var="num" value="${count-((pageMaker.cri.pageNum-1)*4)}"/>
          	<c:forEach var="list" items="${newsList}">
						<div class="cases-wrap d-md-flex align-items-center" style="padding-bottom: 100px;">
							<div class="img col-md-6">
								<img style="width: 100%; height: 300px; overflow: hidden;" src="${pageContext.request.contextPath }/upload/${list.imgurl}">
							</div>
							<div class="text pl-md-5 col-md-6" style="width: 100%;">
								<div><span>NO.${num}</span>
									<span class="cat">
									 	<fmt:parseDate var="regdate" value="${list.regdate}" pattern="yyyy-MM-dd"/>  <!--스트링을 날짜형식으로 바꿔서 var에 저장  -->
										<!-- 패턴방식으로 value값을 var란 변수에 저장하시오 -->
										<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/> <!--날짜출력  -->
									</span>
								</div>	
								<h2><a href="newsview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}" style="color:#000; font-size:20px;">${list.title}</a></h2>
								<div style="width:100%;">
		            				<p>${fn:substring(list.content,0,140)}...</p>
		        			    </div>
							</div>
						</div>
						
			<c:set var="num" value="${num-1 }"/>
			</c:forEach>
						

							

						

						

						    <div class="button-center">
	<input type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" onclick="javascript:gogo();"value="글쓰기" style="float: right;">
	 <script>
	 	function gogo() {
	 		window.location.href="newswrite.do";
	 	}
	 </script>
	  <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27 pagination-bottom paging">
            <ul>
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
                <form id="actionForm" action="news.do" method="get">
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				  	<input type="hidden" name="sel" value="${pageMaker.cri.type}">
				  	<input type="hidden" name="word" value="${pageMaker.cri.keyword}">
                </form>
            </div>
          </div>
        </div>
        </div> 

          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
            <div class="sidebar-box">
              <form name="myform" method="get" action="news.do" class="search-form" id="search" >
              <div class="form-group">
              	<select name="sel" class="select search-sj">
              		<option value="title">제목</option>
              		<option value="content">내용</option>
              	</select>
                <input type="text" name="word" class="form-control" placeholder="검색 키워드를 입력하세요" style="height: 55px !important;">
                 <button style="border:none; background:#fff; font-size:20px; margin-top:8px; top: 37%;" class="fa fa-search"></button>
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Categories</h3>
	                <ul>
		                <li><a href="dog.do">강아지입양 <span class="ion-ios-arrow-forward"></span></a></li>
		                <li><a href="cat.do">고양이입양 <span class="ion-ios-arrow-forward"></span></a></li>
		                <li><a href="enter.do">파양입소신청 <span class="ion-ios-arrow-forward"></span></a></li>
		                <li><a href="inquirylist.do">문의게시판 <span class="ion-ios-arrow-forward"></span></a></li>
	                </ul>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>입양 후기</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Jan. 30, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Jan. 30, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> Jan. 30, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">home</a>
                <a href="#" class="tag-cloud-link">builder</a>
                <a href="#" class="tag-cloud-link">build</a>
                <a href="#" class="tag-cloud-link">create</a>
                <a href="#" class="tag-cloud-link">make</a>
                <a href="#" class="tag-cloud-link">construction</a>
                <a href="#" class="tag-cloud-link">house</a>
                <a href="#" class="tag-cloud-link">architect</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
          </div>

        </div>
      </div>
      
      
      
    </section> <!-- .section -->
    
    
   		<form id="actionForm" action="news.do" method="get">
		  	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		  	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		  	<input type="hidden" name="sel" value="${pageMaker.cri.type}">
		  	<input type="hidden" name="word" value="${pageMaker.cri.keyword}">
		  </form>





<%@ include file = "../footer.jsp" %>