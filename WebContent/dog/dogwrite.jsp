<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../header.jsp" %>

<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home > <i class="ion-ios-arrow-forward"></i></a></span><span class="mr-2">강아지입양<i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">강아지 입양</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">강아지 입양</h2>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-md-12">
						<div class="wrapper">
							
							<div class="row no-gutters">
								<div class="col-md-7">
									<div class="contact-wrap w-100 p-md-5 p-4">
										
										<form name="dog" method="post" enctype="multipart/form-data" action="dogwrite.do"  onsubmit="return check()" id="dogwriteForm"  class="dogwriteForm">
											<div class="row">
												<div class="col-md-6">
													<div class="form-group">
														<label class="label" for="name">강아지 이름</label>
														<input type="text" class="form-control" name="name" id="name" placeholder="강아지 이름">
													</div>
												</div>
																								
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="kind">견종</label>
														<input type="text" class="form-control" name="kind" id="kind" placeholder="견종">
													</div>
												</div>
												<div class="col-md-7">
													<div class="form-group">
														<label class="label" for="age" style="display:block;">나이</label>
														<input type="text" class="form-control" name="age" id="age" placeholder="나이 (숫자만 입력하세요)" style="display:inline-block; width:70%;"><span>살</span>
													</div>
												</div>
												
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="gender" style="padding-right: 20px;">성별</label>
														<input type="radio" class="form-control myradio" name="gender" value="M" id="gender" style="padding-right: 20px;" checked>남자
														<input type="radio" class="form-control myradio" name="gender" value="F" id="gender">여자
														<span id="gendermsg"></span>
													</div>
												</div>
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="enterdate">입소날짜</label>
														<input type="date" class="form-control" name="enterdate" id="enterdate" placeholder="입소날짜">
													</div>
												</div>
												
																								
												<div class="col-md-12">
													<div class="form-group">
														<label class="label" for="imgurl">첨부파일</label>
														<input type="file" name="imgurl" accept="image/jpeg, image/png, image/jpg" class="form-control" id="isFile" style="color:gray;">
													</div>
												</div>
												
												
												
												
												
												
												
												
												
												
												
												
												
												<div class="col-md-12">
													<div class="form-group">
														<input type="submit" value="확인" class="btn btn-primary">&nbsp;&nbsp;
														<input type="reset" value="다시쓰기" class="btn btn-primary">&nbsp;&nbsp;
														<input type="button" value="목록" class="btn btn-primary" onClick="location.href='dog.do';">
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
			
			if(dog.name.value=="") {
				alert("이름을 입력해 주세요");
				dog.name.focus();
				return false;
			}
			if(news.contents.value=="") {
				alert("내용을 입력해 주세요");
				news.content.focus();
				return false;
			}
			return true;
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
		        return;
		    } else if(fileSize >= maxSize) { 
		    	alert("파일 사이즈는 20MB까지 가능합니다");
		        return false; //리턴하고 되돌아가라
		    }
		}
		return true; //투르가 리턴이되면 다시 폼태그로 가서 액션을 실행함
		
		}
		
</script>

<%@ include file = "../footer.jsp" %>