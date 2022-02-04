<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="main.do">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>마이페이지 이메일인증 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">이메일 인증 해주세요</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">이메일 인증</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
						
							<div class="row no-gutters">
								<div class="col-md-6 offset-1">
									<div class="contact-wrap w-100 p-md-5 p-1">
										
										<form id="login" name="login" class="contactForm">
											<div class="row">
												<div class="col-md-12">
												<div class="row">
													<div class="col-md-7">
														<input type="text" name="mail" id="email" placeholder="이메일 입력" class="form-control">
													</div>
													<div class="col-md-5">
														<input type="button" value="이메일 인증" id="btn_email" class="btn btn-primary" style="width:100%">
													</div>
													</div>
													
												<div class="row">
												<div class="col-md-7">
														<input type="text" class="form-control" name="certinumber" id="certinumber" placeholder="인증번호 입력">
												</div>
												<div class="col-md-5">	
														<input type="button" value="인증 확인" class="btn btn-primary" id="btn_auth" style="width:100%">
												</div>
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

<%@ include file="../footer.jsp"%>