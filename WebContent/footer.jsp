<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">SJ 동물보호소</h2>
						<p>#사지마세요<br>#입양하세요<br>#가족이 되어주세요</p>
						<ul class="ftco-footer-social p-0">
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><span class="fa fa-twitter"></span></a></li>
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="fa fa-facebook"></span></a></li>
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="fa fa-instagram"></span></a></li>
            </ul>
					</div>
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">새소식</h2>
						<c:forEach var="nlist" items="${footernews}">
									<div class="block-21 mb-4 d-flex">
						 	
			              <a class="img mr-4 rounded" style="background-image: url(${pageContext.request.contextPath}/upload/${nlist.imgurl});"></a>
			              <div class="text">
			                <h3 class="heading"><a href="#">${fn:substring(nlist.title,0,10)} ...</a></h3>
			                <div class="meta">
			                  <div><a href="#"><span class="icon-calendar"></span>${nlist.regdate}</a></div>
			                  <div><a href="#"><span class="icon-person"></span>${nlist.name}</a></div>
			                  
			                </div>
			              </div>
			            </div>
                      </c:forEach>
            
					</div>
					<div class="col-md-6 col-lg-3 pl-lg-5 mb-4 mb-md-0">
						<h2 class="footer-heading">바로가기</h2>
						<ul class="list-unstyled">
              <li><a href="#" class="py-2 d-block">Home</a></li>
              <li><a href="#" class="py-2 d-block">소개</a></li>
              <li><a href="#" class="py-2 d-block">강아지입양</a></li>
              <li><a href="#" class="py-2 d-block">고양이입양</a></li>
              <li><a href="#" class="py-2 d-block">파양입소신청</a></li>
              <li><a href="#" class="py-2 d-block">입양후기</a></li>
              <li><a href="#" class="py-2 d-block">고객센터</a></li>
            </ul>
					</div>
					<div class="col-md-6 col-lg-3 mb-4 mb-md-0">
						<h2 class="footer-heading">CONTACT</h2>
						<div class="block-23 mb-3">
              <ul>
                <li><span class="icon fa fa-map"></span><span class="text">대전광역시 중구 계룡로 825<br>희영빌딩 7층</span></li>
                <li><a href="#"><span class="icon fa fa-phone"></span><span class="text">+82 10 2125 5863</span></a></li>
                <li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">okadsj@daum.net</span></a></li>
              </ul>
            </div>
					</div>
				</div>
				<div class="row mt-5">
          <div class="col-md-12 text-center">

            <p class="copyright">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved by SJ Group</p>
          </div>
        </div>
			</div>
		</footer>

    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
    <script src="js/summernote.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>


  
  <script>
  $(function() {
		
	  $(".nav-link>ul>li").hover(function(){
			$(".nav-link>ul>li").removeClass("active");
			$(this).addClass("active");				
			$(this).children(".sub-2depth").stop().slideDown(200); 				
	},function(){
		$(".nav-link>ul>li").removeClass("active");		
		$(this).children(".sub-2depth").slideUp(300);
	})	
	
		var chkList = $("input[name=agree]");
	
		
		$("#chkCtrl").click(function(){
			if($(this).is(":checked")){
				chkList.prop("checked", true);
			}else
				chkList.prop("checked", false);
		})
		
		
		
		$("#btn_ok").on("click", function() {
			
			if($("#agree1").is(":checked") == false) { 
					alert("모든 약관에 동의해 주세요");
					return;
				}else if($("#agree2").is(":checked") == false) {
					alert("모든 약관에 동의해 주세요");
					return;
				}else{
					var url="join.do";
					$(location).attr('href',url);
				}
			
			
		
		})
		
		$("#agree1, #agree2").on("click", function() {
			if($("#agree1").is(":checked") == true && $("#agree2").is(":checked") == true ) { 
				$("#chkCtrl").prop("checked", true);
			}
		})
		
		$("#id").blur(function(){
				
				if(!$("#id").val()){
					$("#idmsg").html("<span style='color:#f00;'>아이디 입력하세요</span>");
					$("#id").focus();
				}else{
					$("#idmsg").html("<span style='color:#f00;'> </span>");
					
					$.ajax({

						  type:'post', //전송하는 방식
						  url:'memberIdCheck.do',//요청할 url //서블릿만들기
						  data:{id:$("#id").val()},//서버로 전송할 데이터 //입력된 값이 id에 저장되어 포스트방식으로 .do로 넘어감
						  success:function(data) { //1 or -1 이 서블릿에서 넘어옴
						      //정상 요청, 응답 시 처리 작업
						      if(data != 1){
						    	  if($("#id").val() != ""){
						    		  $("#idmsg").html("사용 가능한 아이디 입니다");
						    	  }
						    	  }else{
						    		  if($("#id").val() != ""){
						    			  $("#idmsg").html("사용중이거나 탈퇴한 아이디 입니다 ");
						    			  $("#id").val("");
						    			  $("#id").focus();
						    		  }
						    	  }
						  }, error : function(xhr,status,error) {
						      //오류 발생 시 처리
						      alert("통신에러");
						  },
						});
					
				}
		})
		
		
		$("#pw1").blur(function(){
				
				if(!$("#pw1").val()){
					$("#pw1msg").html("<span style='color:#f00;'>비밀번호를 입력하세요</span>");
					$("#pw1").focus();
				}else{
					$("#pw1msg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#pw2").blur(function(){
				
				if($("#pw1").val() != $("#pw2").val() || !$("#pw2").val()){
					$("#pw2msg").html("<span style='color:#f00;'>비밀번호를 재확인 하세요</span>");
					$("#pw2").focus();
				}else{
					$("#pw2msg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#name").blur(function(){
				
				if(!$("#name").val()){
					$("#namemsg").html("<span style='color:#f00;'>이름을 입력하세요</span>");
					$("#name").focus();
				}else{
					$("#namemsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#birth1").blur(function(){
				
				if(!$("#birth1").val() ){
					$("#birthmsg").html("<span style='color:#f00;'>생년월일을 입력하세요</span>");
					$("#birth1").focus();
				}else{
					$("#birthmsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#birth2").blur(function(){
				
				if(!$("#birth2").val() ){
					$("#birthmsg").html("<span style='color:#f00;'>생년월일을 입력하세요</span>");
					$("#birth2").focus();
				}else{
					$("#birthmsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#birth3").blur(function(){
				
				if(!$("#birth3").val() ){
					$("#birthmsg").html("<span style='color:#f00;'>생년월일을 입력하세요</span>");
					$("#birth3").focus();
				}else{
					$("#birthmsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#gender").blur(function(){
				
				if(!$("#gender").val() ){
					$("#gendermsg").html("<span style='color:#f00;'>성별을 선택하세요</span>");
					$("#gender").focus();
				}else{
					$("#gendermsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#email").blur(function(){
				
				if(!$("#email").val() ){
					$("#emailmsg").html("<span style='color:#f00;'>이메일을 입력하세요</span>");
					$("#email").focus();
				}else{
					$("#emailmsg").html("<span style='color:#f00;'> </span>");
				}
		})
		$("#phone").blur(function(){
				
				if(!$("#phone").val() ){
					$("#phonemsg").html("<span style='color:#f00;'>전화번호를 입력하세요</span>");
					$("#phone").focus();
				}else{
					$("#phonemsg").html("<span style='color:#f00;'> </span>");
				}
		})
		
		//email 인증
			
			$("#btn_email").on("click", function(){
				var email = $("#email").val();
				if(email == ""){
					alert("이메일 주소 입력");
					$("#email").focus();
				}else{
					$.ajax({
						type:"post",
						url:"emailsend.do",
						data:{"email":$("#email").val()}, 
						//위 세줄 먼저 실행 후 서블릿 실행 그다음 아래 줄 실행
						dataType:"json", //서버에서 보내주는 데이터 형식 //"emailsend.do",에서 리턴받는 형식을 json으로 받겠습니다
						success:function(data){
							alert(data.msg);
						},error:function(){
							alert("통신에러");
						}
					})
				}
			})
		
			//인증확인 버튼 이벤트 처리
			$("#btn_auth").on("click", function(){
				var certinumber = $("#certinumber").val(); //var certinumber에 저장하시오
				//입력받은 인증번호
				if(certinumber == ""){
					alert("인증번호 입력하세요");
					$("#certinumber").focus();
				}else{
					$.ajax({
						type:"post",
						data:{"certinumber":certinumber},
						//mypage.do로 넘겨주는 데이터 값
						url:"mypage.do",
						dataType:"json", //서버에서 넘어오는 데이터 형식 JSON {name:"value"}
						success:function(data){
							alert(data.msg);
							if(data.check == "ok"){
								//location.href="memberupdate.do"; java형식
								$(location).attr("href","memberupdate.do"); //jquery형식
								//memberupdate.do가 href에 저장돼서 location이 실행된다
								//get방식으로 memberupdate.do실행
							}else{
								alert(data.msg);
							}
						},error:function(){
							alert("통신에러");
						}
					})
				}
			})
			
			$("#btn_updateok").click(function(){
				member.submit(); //자바스크립트 명령어
			})
			
			
			$('#summernote').summernote({
				height: 400,
				fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus: true,

				callbacks: {
				onImageUpload: function(files, editor, welEditable) {
				            for (var i = files.length - 1; i >= 0; i--) {
				             sendFile(files[i], this);
				             //삽입한 이미지를 sendFile 메서드로 보내라
				            }
				        }
				}

				});

				

				function sendFile(file, el) {
				var form_data = new FormData();
				       form_data.append('file', file);
				       $.ajax({
				         data: form_data,
				         type: "POST",
				         url: 'profileImage.do', //사진을 서버에 올리는 서블릿
				         cache: false,
				         contentType: false,
				         enctype: 'multipart/form-data',
				         processData: false,
				         success: function(img_name) {
				           $(el).summernote('editor.insertImage', img_name);
				         }
				       });
				    }
				
				
			

		
})
</script>

<script>
	
	function fn_login(){
		if(login.id.value == ""){
			//$("#uderid").val()=="")
			alert("아이디를 입력해 주세요");
			login.id.focus();
			return false;
		}if(login.pw.value == ""){
			alert("패스워드를 입력해 주세요");
			login.pw.focus();
			return false;
		}
		var form = document.login;
		form.method='post';
		form.action='login.do';
		form.submit();
	}
	
</script>
<script>

$(function() {

	var actionForm = $("#actionForm")
	
	$(".paging > ul> li > a").on("click", function(e) {
		e.preventDefault(); 
		actionForm.find("input[name ='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
	
});
</script>


    
  </body>
</html>