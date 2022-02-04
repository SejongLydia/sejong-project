<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>회원정보 수정 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">회원정보 수정페이지 입니다</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">회원정보 수정</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										<form name="member" id="member" method="POST" action="memberupdate.do" class="contactForm">
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="id">아이디</label>
														<input type="text" class="form-control" name="id" id="id" value="${upmember.id}" readonly>
														<span id="idmsg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="pw1">비밀번호</label>
														<input type="password" class="form-control" name="pw1" id="pw1">
														<span id="pw1msg"></span>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="pw2">비밀번호 재확인</label>
														<input type="password" name="pw2" id="pw2" class="form-control">
														<span id="pw2msg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="name">이름</label>
														<input type="text" class="form-control" name="name" id="name" value="${upmember.name}"><br>
														<span id="namemsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													
														<label class="label" for="birth">생년월일</label>
														<div class="form-group">
														<input type="text" class="form-control yymmdd" name="birth1" id="birth1" value="${upmember.birth.substring(0,4)}">
														<input type="text" class="form-control yymmdd" name="birth2" id="birth2" value="${upmember.birth.substring(5,7)}">
														<input type="text" class="form-control yymmdd" name="birth3" id="birth3" value="${upmember.birth.substring(8,10)}">
														<br><span id="birthmsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="gender" style="padding-right: 20px;">성별</label>
														<c:choose>
														<c:when test="${upmember.gender eq 'M'}">
														
														<input type="radio" class="form-control myradio" name="gender" value="M" id="gender" style="padding-right: 20px;" checked>남자&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" class="form-control myradio" name="gender" value="F" id="gender">여자
														</c:when>
														<c:when test="${upmember.gender eq 'F'}">
														<input type="radio" class="form-control myradio" name="gender" value="M" id="gender" style="padding-right: 20px;">남자&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" class="form-control myradio" name="gender" value="F" id="gender" checked>여자
														</c:when>
														</c:choose>
														<span id="gendermsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="email">이메일</label>
														<input type="text" class="form-control" name="email" id="email" value="${upmember.email}">
														<span id="emailmsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="phone">휴대전화</label>
														<input type="text" class="form-control" name="phone" id="phone" value="${upmember.phone}">
														<span id="phonemsg"></span>
													</div>
												</div>
												
												<div class="col-md-7 join-button">
										<a href="javascript:void(0);" class="btn btn-primary" id="btn_updateok" onclick="update()">수정완료</a>
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