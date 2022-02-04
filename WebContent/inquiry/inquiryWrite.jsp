<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home > <i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2">고객센터  > <i class="ion-ios-arrow-forward"></i></span> <span>문의하기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">입양 및 입소 신청은 여기서 문의해 주세요.</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">문의하기</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							<div class="row mb-5">
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-map-marker"></span>
				        		</div>
				        		<div class="text">
					            <p><a href="">대전광역시 중구 계룡로 825 7층</a></p>
					          </div>
				          </div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-phone"></span>
				        		</div>
				        		<div class="text">
					            <p><a href="tel://1234567920">+82 10 2125 5863</a></p>
					          </div>
				          </div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-paper-plane"></span>
				        		</div>
				        		<div class="text">
					            <p><a href="mailto:info@yoursite.com">okadsj@daum.net</a></p>
					          </div>
				          </div>
								</div>
								<div class="col-md-3">
									<div class="dbox w-100 text-center">
				        		<div class="icon d-flex align-items-center justify-content-center">
				        			<span class="fa fa-globe"></span>
				        		</div>
				        		<div class="text">
					            <p><a href="#">www.sj-shelter.com</a></p>
					          </div>
				          </div>
								</div>
							</div>
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
										<form method="POST" id="inquiryForm" name="inquiryForm" class="contactForm" action="inquiry.do">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="name">이름</label>
														<input type="text" class="form-control" name="name" id="name" placeholder="이름">
													</div>
												</div>
												<div class="col-md-6"> 
													<div class="form-group">
														<label class="label" for="email">이메일 주소</label>
														<input type="email" class="form-control" name="email" id="email" placeholder="이메일 주소">
													</div>
												</div>
												
												
												<div class="col-md-12 has-success">
													<label class="label" for="category">문의 항목</label>
													<div class="form-inline checkbox">
														
														<div class="col-md-4 inquiry-sj" style="padding-left:0;">
															<input type="radio" id="category" name="category" value="입소신청" style="color:#495057;">입소신청
														</div>
														<div class="col-md-4 inquiry-sj">
															<input type="radio" id="category" name="category" value="입양신청" style="color:#495057;">입양신청
														</div>
														<div class="col-md-4 inquiry-sj">
															<input type="radio" id="category" name="category" value="기타" style="color:#495057;">기타
														</div>
														
 													 </div>
												</div>
												
												
  
    
    
												
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="title">제목</label>
														<input type="text" class="form-control" name="title" id="title" placeholder="제목">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="content">문의 내용</label>
														<textarea name="content" class="form-control" id="content" cols="30" rows="10" placeholder="문의 내용을 작성해 주세요." style=""></textarea>
													</div>
												</div>
												
												
												
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="imgurl">첨부파일</label>
														<input type=file name="imgurl" class="form-control" id="imgurl" style="color:gray;">
													</div>
												</div>
												
												
												
												
												
												
												
												
												
												
												
												
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="확인" class="btn btn-primary">
														<div class="submitting"></div>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="col-md-5 d-flex align-items-stretch">
									<div class="info-wrap w-100 p-5 img" style="background-image: url(images/img.jpg);">
				          </div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</section>

<%@ include file = "../footer.jsp" %>