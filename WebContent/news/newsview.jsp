<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file = "../header.jsp" %>
    
     <section class="hero-wrap hero-wrap-2" style="background-image: url('images/copy5.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home ><i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">소개 ><i class="ion-ios-arrow-forward"></i></a></span> <span>새소식 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">SJ동물보호소 새소식</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
          	<div>
          			<h2 class="mb-3">${view.title}</h2>
          			<p class="info"><span class="user">${view.name}</span> | ${view.regdate} | <i class="fa fa-eye"></i> ${view.viewcount}</p>
		          	
		          	<div>
		              <img src="${pageContext.request.contextPath }/upload/${view.imgurl}" alt="" class="img-fluid">
		            </div>
		            
		            <div class="board_body">
		            	<p>${view.content}</p>
		            </div>
		           
		            
		            
		            <div class="tag-widget post-tag-container mb-5 mt-5">
		              <div class="tagcloud" style="text-align: center;">
		                <a href="news.do" class="tag-cloud-link">목록</a>
		                <a href="newsmodify.do?bno=${view.bno}" class="tag-cloud-link">수정</a>
		                <a href="newsdelete.do?bno=${view.bno}" class="tag-cloud-link" onClick="return confirm('정말로 삭제할까요?')">삭제</a>
		              </div>
		            </div>
             </div>


            <div class="pt-5 mt-5">
              <h3 class="mb-5"><span class="cmtcnt">${cmtcnt} </span>&nbsp;Comments</h3>
              <ul class="comment-list">
                <li class="comment">
                  <div class="comment-body cmtList-box">
                  <c:forEach var="list" items="${clist}">
                  	<div class="comment-sj">
                    <h3>${list.writer}</h3>
                    <c:if test="${list.writer == userid}">
                    <div class="${list.num}">
                   	 	<button style="float:right;" onclick="cmtDelete(${list.num});">삭제</button>
						<button style="float:right;" onclick="cmtUpdate(${list.num});">수정</button>
					</div>
					</c:if>
                    </div>
                    <div class="meta">${list.wdate}</div>
                    <span id="${list.num}" class="cmtContent">${list.content}</span>
                   </c:forEach>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <form action="#" class="p-5 bg-light">
                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="" id="message" cols="30" rows="10" class="form-control cmt-area" placeholder="댓글을 입력하세요." style="line-height:10px;"></textarea>
                  </div>
                  <div class="form-group">
                    <button type="button" id="btnCmt" class="btn py-3 px-4 btn-primary" onclick="cmtWrite();">댓글등록</button>
                  </div>

                </form>
              </div>
            </div>

          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
            <div class="sidebar-box">
              <form action="newsview.do" class="search-form">
                <div class="form-group">
                  <span class="fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="검색 키워드를 입력하세요">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Services</h3>
                <li><a href="#">Pet Sitting <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Daycare <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Grooming <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Spa <span class="fa fa-chevron-right"></span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Recent Blog</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
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
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
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
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">cat</a>
                <a href="#" class="tag-cloud-link">dog</a>
                <a href="#" class="tag-cloud-link">pet</a>
                <a href="#" class="tag-cloud-link">bird</a>
                <a href="#" class="tag-cloud-link">husky</a>
                <a href="#" class="tag-cloud-link">bulldog</a>
                <a href="#" class="tag-cloud-link">food</a>
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
    
    
    <script>
	function cmtWrite(){
		var bno = "${view.bno}"; //리퀘스트 속성에 담겨있는 view //F.K번호요청
		var writer = "${sessionScope.userid}"; //로그인한 사람의 유저아이디
		var cmtContent = $(".cmt-area").val();  //컨텐트 저장~
		
		
	
		//유효성 검사
		if(cmtContent == ""){
			alert("댓글 내용 입력");
			return false;
		}
		if(writer == ""){
			alert("댓글 작성 하려면 로그인 해 주세요");
			location.href="login.do";
			return false;
		}
		var cdData = {//json은 키와 값으로 이루어져있다 키:값
				bno:bno,
				writer:writer,
				content:cmtContent
		}//넘어오는 변수값음 cdDate에 담음
		$.ajax({
			type:"post",
			url:"newscmt.do",
			data:cdData,
			//위 세개를 먼저 처리하고 noticeCmt.do서블릿으로 ㄱㄱ~
			success:function(result){
				if(result == 1){
					$(".cmt-area").val("");
					//cmt-area를 비우고
					getCmtList();
					// cmtCount();
					//getCmtList();메서드를 실행하라 //리스트를 출력하라
					//금방 댓글달은걸 출력하는 메서드
				}else{
					alert("댓글 저장 실패");
					return false;
				}
			}
						
		})//ajax
		}//cmtwrite()
		
		function getCmtList(){
			var output = "";
			var logId = "${sessionScope.userid}";
			var bno = "${view.bno}"
			var cdData = {
					bno:bno
			}
			
			$.ajax({
			type:"get",
			url:"newscmt.do",
			data:cdData, //보내는 데이터
			//위3줄 처리하고
			//json형식으로 받음
			dataType:"json", //받는 데이터 타입
			//위 세개를 먼저 처리하고 noticeCmt.do서블릿으로 ㄱㄱ~
			success:function(result){
				cmtcnt() 
				for(var i in result){
					//json의 객체형태를 하나하나 i에 담으시오
					output += '<div class="comment-sj">';
					output += '<h3>'+result[i].writer+'</h3>';
						if(result[i].writer == logId){
							output += ' <div class="'+result[i].num+'">';
						output += '<button style="float:right;" onclick="cmtDelete('+result[i].num+')">삭제</button>';
						output += '<button style="float:right;" onclick="cmtUpdate('+result[i].num+')">수정</button>';
						output += '</div>';
						}
					output += '</div>';
					output += '<div class="meta">'+result[i].wdate+'</div>';
					output += '<span id="'+result[i].num+'" class="comtContent">'+result[i].content+'</span>';
				   
					
				}
				$(".cmtList-box").html(output);//기존 <ul></ul>문이 삭제되고.cmtList-box위치에 위 반복문이 삽입됨
				}
			})
			
			
	
			
		} //end of getCmtList()
		
		
		function cmtDelete(num){							
			
	    	$.ajax({						
	    		type:"post",					
	    		url:"newscmtdelete.do",					
	    		data:{					
	    			num:num				
	    		},					
	    		success:function(result){					
	    			if(result==1){				
	    							
	    				getCmtList();			
	    			}else{				
	    				alert("댓글삭제 실패");			
	    			}				
	    							
	    		}					
	    							
	    	})						
	    }//end of cmtDelete
		
		function cmtcnt(){
			var bno = "${view.bno}";
			
			$.ajax({
				type:"get",
				url:"newscmtupdate.do",
				data:{
					bno:bno
				},
				
				success:function(result){
					if(result > -1){
						$(".cmtcnt").html(result);
					}else{
						alert("댓글 수 불러오기 실패")
						
					}
				}
			})
		} // end of cmtcnt()
		
		//function cmtUpdate(num){
			
		//	var ccmt = $(".ccmt").text();
			
			
		//	alert(ccmt);
			
		//	$.ajax({
			//	type:"get",
			//	data:{
					
			//	},
			//	url:"",
			//	success:function(){
					
			//	}
			//})
		//}
		
		function cmtUpdate(num){
			var output ="";						
	    	var logId = "${sessionScope.userid}";						
	    	var content = $("#"+num+"").text();						
	    	var putout = "";
			
			$.ajax({
				type:"get",
				url:"newscmtdelete.do",
				data:{
					num:num
				},
				
				success:function(result){
					

					if(result !=null){
						
						output += '<textarea style="width:550px; height:50px;" id='+num+' rows="" cols="">'+content+'</textarea>';
						
						$("#"+num+"").html(output);
					
						putout += '<button style="float:right;" class="cmtbutton" onclick="cmtDelete('+num+')">삭제</button>';			
	                    putout += '<button style="float:right;" class="cmtbutton" onclick="modifycmt('+num+')">수정완료</button>';		
	                    $("."+num+"").html(putout);
					}else{
						alert("댓글 불러오기 실패")
					}
				}
			})
			
		}//end of cmtUpdate
		
		function modifycmt(num){
			var content = $("#"+num+" textarea").val();
			
			$.ajax({
				type:"post",
				url:"newscmtupdate.do",
				data:{
					num:num,
					content:content
				},
				success:function(result){
					if(result == 1){
						getCmtList()
					}else{
						alert("댓글 수정 실패")
					}
				}
			})
		}//end of modifycmt
		
    </script>
    <%@ include file = "../footer.jsp" %>