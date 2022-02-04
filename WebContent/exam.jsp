<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../header.jsp" %>

  <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
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
        <div class="row">
          <div class="col-lg-8 ftco-animate">
          	<c:forEach var="list" items="${newsList }">
						<div class="cases-wrap d-md-flex align-items-center">
							<div class="img">
								<img style="width: 100%; height: 300px; overflow: hidden;" src="${pageContext.request.contextPath }/upload/${list.imgurl}">
							</div>
							<div class="text pl-md-5">
								<span class="cat">
								 	<fmt:parseDate var="regdate" value="${list.regdate}" pattern="yyyy-MM-dd"/>  <!--스트링을 날짜형식으로 바꿔서 var에 저장  -->
									<!-- 패턴방식으로 value값을 var란 변수에 저장하시오 -->
									<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd"/> <!--날짜출력  -->
								</span>
								<h2><a href="newsview.do?bno=${list.bno}">${list.title}</a></h2>
								<p>${list.content}</p>
								<p><a href="#" class="btn btn-primary">Read more</a></p>
							</div>
						</div>
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

          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Categories</h3>
                <li><a href="#">Career &amp; Business <span class="ion-ios-arrow-forward"></span></a></li>
                <li><a href="#">Mental &amp; Physical Care <span class="ion-ios-arrow-forward"></span></a></li>
                <li><a href="#">People &amp; Relationships <span class="ion-ios-arrow-forward"></span></a></li>
                <li><a href="#">Life Coaching <span class="ion-ios-arrow-forward"></span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Recent Blog</h3>
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


<%@ include file = "../footer.jsp" %>