<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>회원가입 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">회원가입을 환영합니다.</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">회원 가입</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<form name="joinForm" id="joinForm" method="POST" action="join.do" class="contactForm">
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="id">아이디</label>
														<input type="text" class="form-control" name="id" id="id" placeholder="아이디">
														<span id="idmsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="pw1">비밀번호</label>
														<input type="password" class="form-control" name="pw1" id="pw1" placeholder="비밀번호">
														<span id="pw1msg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="pw2">비밀번호 재확인</label>
														<input type="password" name="pw2" id="pw2" class="form-control" placeholder="비밀번호 재확인">
														<span id="pw2msg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="name">이름</label>
														<input type="text" class="form-control" name="name" id="name" placeholder="이름"><br>
														<span id="namemsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													
														<label class="label" for="birth">생년월일</label>
														<div class="form-group">
														<input type="text" class="form-control yymmdd" name="birth1" id="birth1" placeholder="년">
														<input type="text" class="form-control yymmdd" name="birth2" id="birth2" placeholder="월">
														<input type="text" class="form-control yymmdd" name="birth3" id="birth3" placeholder="일">
														<br><span id="birthmsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="gender" style="padding-right: 20px;">성별</label>
														<input type="radio" class="form-control myradio" name="gender" value="M" id="gender" style="padding-right: 20px;" checked>남자&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" class="form-control myradio" name="gender" value="F" id="gender">여자
														<span id="gendermsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="email">이메일</label>
														<input type="text" class="form-control" name="email" id="email" placeholder="예)abcd1234@gmail.com">
														<span id="emailmsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="phone">휴대전화</label>
														<input type="text" class="form-control" name="phone" id="phone" placeholder="예)01012345678">
														<span id="phonemsg"></span>
													</div>
												</div>
												
												<div class="col-md-7 join-button">
										<input type="submit" value="가입하기" class="btn btn-primary">
								<div class="submitting"></div>
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