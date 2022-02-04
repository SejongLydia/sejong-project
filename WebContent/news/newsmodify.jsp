<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home > <i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2">소개  > <i class="ion-ios-arrow-forward"></i></span><span class="mr-2">새소식 > <i class="ion-ios-arrow-forward"></i></span> <span>글쓰기 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">새소식 작성 페이지</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">새소식 수정하기</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
										<form name="news" method="post" enctype="multipart/form-data" action="newsmodify.do"  onsubmit="return check()" id="contactForm"  class="contactForm">
										<input type="hidden" name="bno" value="${dto.bno}">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="name">작성자</label>
														<input type="text" class="form-control" name="name" id="name" value="${dto.name}" readonly>
													</div>
												</div>
																								
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="title">제목</label>
														<input type="text" class="form-control" name="title" id="subject" value="${dto.title}">
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="content">내용</label>
														<textarea name="content" class="form-control" id="summernote" cols="30" rows="10">${dto.content}</textarea>
													</div>
												</div>
																								
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="imgurl">첨부파일</label>
														<input type="file" name="imgurl" accept="image/jpeg, image/png, image/jpg" class="form-control" id="isFile" style="color:gray;">
														<span>현재 파일: <img src="${pageContext.request.contextPath}/upload/${dto.imgurl}" style="display:inline-block;width:10%; padding:30px 0;"></span>
														
														
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="확인" class="btn btn-primary">&nbsp;&nbsp;
														<input type="reset" value="다시쓰기" class="btn btn-primary">&nbsp;&nbsp;
														<input type="button" value="목록" class="btn btn-primary" onClick="location.href='news.do';">
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
		
<script>
		function check() {
			
			if(news.title.value=="") {
				alert("제목을 입력해 주세요");
				news.title.focus();
				return false;
			}
			if(news.contents.value=="") {
				alert("내용을 입력해 주세요");
				news.content.focus();
				return false;
			}
			var imgFile = $('#isFile').val(); //isfile을 var에저장하시오
			var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/; 
			var maxSize = 20 * 1024 * 1024;
			var fileSize;

			if($('#isFile').val() == "") { //첨부파일이 없으면 얼트하시오
				alert("첨부파일은 필수항목 입니다");
			    $("#isFile").focus();
			    return false;
			}

			if(imgFile != "" && imgFile != null) { //이미지파일인지 검사
				fileSize = document.getElementById("isFile").files[0].size; //자바스트립트 //용량을 가져오는 식
				
			    
			    if(!imgFile.match(fileForm)) { //첨부된 파일이 파일폼 형식에 매치하느냐? jpg|jpeg|png|gif|bmp|pdf중에서 일치하는게 있음?
			    	alert("이미지 파일만 업로드가 가능합니다"); 
			        return false;
			    } else if(fileSize >= maxSize) { 
			    	alert("파일 사이즈는 20MB까지 가능합니다");
			        return false; //리턴하고 되돌아가라
			    }
			}
			
			return true;
		}
				
		
		
		
</script>

<%@ include file = "../footer.jsp" %>