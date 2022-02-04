<%@ page language="java" contentType="text/html; charset=UTF-8"							
    pageEncoding="UTF-8"%>							
							
							
							
 <%@ include file="../header.jsp" %>							
   <div>							
   <h1 class="inh1">NOTICE</h1>							
   <h1 class="inh1 mainh">The cook NEWS</h1>							
   </div>							
   							
   </div>							
     <!--   상단 끝 -->							
   							
    <!--  중간 시작 -->							
    <div class="container-fluid conpading">							
		<div class="container">					
			<div class="row">				
				<div class="col-md-9">			
							
				<div>			
							
							
				<a title="목록으로" href="main.do?pageNum=${cri.pageNum }&amount=${cri.amount}" style="color:#000; font-size:25px;"><i class="fa fa-list" aria-hidden="true"></i></a>&nbsp;&nbsp;			
				<c:if test="${userid eq 'admin' }">			
				<a title="수정하기" href="mainmodify.do?bno=${view.bno }&pageNum=${cri.pageNum } & amount=${cri.amount} " style="color:#000; font-size:25px;"><i class="fa fa-wrench" aria-hidden="true"></i></a>&nbsp;&nbsp;			
				<a title="삭제하기" href="maindelete.do?bno=${view.bno }" onClick="return confirm('삭제하시겠어요?')"style="color:#000; font-size:25px;"><i class="fa fa-times" aria-hidden="true"></i></a>			
				</c:if>			
				<div class="noticeviewcontent" style="margin-top:20px;">			
							
				<h2>${view.title }</h2>			
				<p style="text-align:left;"><span>작성자:THECOOK&nbsp;<i class="fa fa-comments" aria-hidden="true"></i><span class="cmtcnt">${cmtcnt }</span>&nbsp;<i class="fa fa-heart" >${view.likecount }</i>&nbsp;<i class="fa fa-eye"></i>${view.viewcount}</span></p>			
				<span>			
							
						<img style="width:300px; height:250px;"alt="" src="${pageContext.request.contextPath }/upload/${view.imgurl}">	
							
				</span>			
				<div style="display:inline-block;width:300px;">			
				<p style="word-wrap:break-word; width:550px;">${view.content }</p>			
				</div>			
				</div>			
							
				</div>			
							
							
							
   <div class="cmt-container" style="margin-top:0px; border-top:none; display: inline-block;">							
      <div class="cmtCount" style="color:#000;">Comments : <span class="cmtcnt">${cmtcnt }</span></div>							
      <div class="cmt-box">							
         <textarea style="width:650px;"class="cmt-area" rows="4" cols="" placeholder="댓글입력"></textarea>							
      </div>							
      <div class="cmt-buttons">							
         <button style="left:-200px"  type="button" id="bntCmt" class="info cmt-insert" onclick="cmtWrite();">댓글등록 </button>							
      </div>							
      <div class="cmtList-box">							
         <ul id="addcmt">							
         							
         <c:forEach var="list" items="${cmtlist}">							
            <li class="reply">							
               							
               <span class="cmtWriter">${list.writer}</span>							
               <span class="cmtDate">${list.cmtdate}</span>							
               							
               <c:if test = "${list.cmtupdate == '1' }">							
               <span style="margin-left:5px;"class="cmtDate">수정됨</span>							
               </c:if>							
             							
               <span id ="${list.num }" class="cmtContent">${list.content}</span>							
               <div class="${list.num }">							
               <button style="float:right;" class="cmtbutton" onclick="deletecmt(${list.num})">삭제</button>							
               <button style="float:right;" class="cmtbutton" onclick="updatecmt(${list.num})">수정</button>							
            	</div>						
            </li>							
         </c:forEach>							
         </ul>							
   </div>							
</div>							
							
							
							
				</div>			
					<div class="col-md-3 appstiky leftbar">		
					<h2 class="maright">MENU</h2>		
						<ul class="liulstyle" style="padding-left: 0;">	
							
						<li>	
							<a href="main.do" class="textcolb">MENU</a>
						</li>	
						<li>	
							<a href="dessert.do" class="textcolb">BEST MENU</a>
						</li>	
							
						</ul>	
				</div>			
			</div>				
		</div>					
	</div>						
							
							
		   <!--  중간 끝 -->					
		   					
		   					
    							
    <!-- footer start -->							
    							
    							
    							
    <script>							
    function cmtWrite() {							
       var bno ="${view.bno}";							
       var cmtContent = $(".cmt-area").val();							
       var writer = "${userid}";							
							
       if(cmtContent == "") {							
          alert("댓글 내용 입력");							
          return false;							
       }							
       if(writer == "") {							
          alert("댓글을 작성 하려면 로그인 해주세요");							
          							
          return false;							
       }							
       var cdData = {							
             bno:bno,							
             writer:writer,							
             content:cmtContent							
       }							
       $.ajax({							
          type:"post",							
          url:"Maincmt.do",							
          data:cdData,							
          success:function(result) {							
             if(result == 1) {							
                $(".cmt-area").val("");//쟈ㅓ장하라							
               							
               getCmtList(); //함수를 호출하라							
             }else{							
                alert("댓글 저장 실패");							
                return false;							
             }							
          }							
       })							
    }							
    							
    function  getCmtList() { //호출하라							
          var output ="";							
          var logId = "${sessionScope.userid}";							
          var bno= "${view.bno}";							
          var cdData = {							
                bno:bno							
          }							
          $.ajax({							
             type:"get",							
             url:"Maincmt.do",							
             data:cdData,							
             success:function(result) {							
            	 cmtcnt()						
                for(var i in result){							
                   							
                output += '<ul id="addcmt">';							
                  output += '<li class="reply">';							
      							
                  output += '<span class="cmtWriter">'+result[i].writer+'</span>';							
                  output += '<span class="cmtDate">'+result[i].cmtdate+'</span>';							
                  if(result[i].cmtupdate == '1'){							
                  output += '<span style="margin-left:5px;"class="cmtDate">수정됨</span>';							
                  }							
                  output += '<span id ='+result[i].num+' class="cmtContent">'+result[i].content+'</span>';							
                  if(result[i].writer == logId) {							
				  output += '<div class='+result[i].num+'>';			
                  output += '<button style="float:right;" class="cmtbutton" onclick="deletecmt('+result[i].num+')">삭제</button>';							
                  output += '<button style="float:right;" class="cmtbutton" onclick="updatecmt('+result[i].num+')">수정</button>';							
                  output += '</div>';							
                  }							
                  output += '</span>';							
                  output += '</li>';							
                  output += '</ul>';							
             							
                }							
                $(".cmtList-box").html(output);							
                }							
          })							
    } // 리스트 호출							
    							
    function deletecmt(num){							
    							
    	$.ajax({						
    		type:"post",					
    		url:"MCDelete.do",					
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
    }							
    							
    function updatecmt(num){//댓글 수정내용 불러오기							
    							
    	var output ="";						
    	var logId = "${sessionScope.userid}";						
    	var content = $("#"+num+"").text();						
    	var putout = "";						
    							
    	$.ajax({						
    		type:"get",					
    		url:"MCDelete.do",					
    		data:{					
    			num:num				
    		},					
							
    		success:function(result){					
    			if(result!=null){				
    							
    				output +='<textarea style="width:550px; height:50px;" id='+num+' rows="" cols="">'+content+'</textarea>';			
    							
    				$("#"+num+"").html(output);			
    				putout += '<button style="float:right;" class="cmtbutton" onclick="deletecmt('+num+')">삭제</button>';			
                    putout += '<button style="float:right;" class="cmtbutton" onclick="modifycmt('+num+')">수정완료</button>';							
    				$("."+num+"").html(putout);			
    			}else{				
    				alert("댓글 불러오기 실패");			
    			}				
    							
    		}					
    							
    	})						
    }							
    							
    function modifycmt(num){ // 댓글 수정							
    	var content = $("#"+num+" textarea").val();						
    							
    	$.ajax({						
    		type:"post",					
    		url:"MCU.do",					
    		data:{					
    			num:num,				
    			content:content				
    		},					
    		success:function(result){					
    			if(result == 1){				
    				getCmtList()			
    							
    			}else{				
    				alert("댓글 수정 실패");			
    			}				
    		}					
    	})						
    							
    							
    							
    }							
    function cmtcnt(){							
    	var bno ="${view.bno}";						
    							
    	$.ajax({						
    		type:"get",					
    		url:"MCU.do",					
    		data:{					
    			bno:bno				
    		},					
    		success:function(result){					
    			if(result >-1){				
    				$(".cmtcnt").html(result);			
    			}else{				
    				alert("댓글 수 불러오기 실패");			
    			}				
    							
    		}					
    	})						
    }							
    							
    							
    							
    							
    </script>							
    							
   <%@ include file="../footer.jsp" %>							
