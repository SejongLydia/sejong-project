<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>로그인 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">오늘도 당신의 방문을 환영합니다.</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">로그인</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
						
							<div class="row no-gutters">
								<div class="col-md-4 offset-1">
									<div class="contact-wrap w-100 p-md-5 p-1">
										
										<form id="login" name="login" class="contactForm">
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="id">아이디</label>
														<input type="text" class="form-control" name="id" id="userid" placeholder="아이디">
													</div>
													<div class="form-group">
														<label class="label" for="pw">비밀번호</label>
														<input type="password" class="form-control" name="pw" id="userpw" placeholder="비밀번호">
													</div>
														
													<div class="form-group">
														<input type="button" value="로그인" class="btn btn-primary" onClick="location.href='javascript:fn_login();'">
														<div class="submitting"></div>
													</div>
												
												
													<div class="form-group find-color">
														<a href="">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
														<a href="">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
														<a href="jointac.do">회원가입</a>
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