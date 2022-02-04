<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp"%>

 <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>강아지입양 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">당신을 기다리고있는 아이들을 소개합니다.</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>보호 중인 강아지</h2>
          </div>
        </div>
        	 <p>총게시글 <span style="color:#00cc00">${count}</span>건</p>
    		<div class="row">
    			<c:set var="num" value="${count-((pageMaker.cri.pageNum-1)*10)}"/>
    			<c:forEach var="list" items="${dogList}">
    			<div class="col-md-4 ftco-animate">
	          <div class="block-7">
	          	<div class="img dogimg">
	          		<a href="dogview.do?bno=${list.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}"><img src="${pageContext.request.contextPath}/upload/${list.imgurl}" style="width:100%;"></a>
	          	</div>
	            <div class="text-center p-4">
	            	<span class="excerpt d-block" style="font-size:25px;">${list.name}</span>
		            <ul class="pricing-text mb-5">
		              <li><span class="fa fa-check mr-2"></span>${list.kind}</li>
		              <li><span class="fa fa-check mr-2"></span>${list.age}살</li>
		              <li><span class="fa fa-check mr-2"></span>${list.gender}</li>
		              <li><span class="fa fa-check mr-2"></span>${list.enterdate}입소</li>
		            </ul>

	            	<a href="dogrequest.do?bno=${list.bno }" class="btn btn-primary d-block px-2 py-3">입양 문의</a>
	            </div>
	          </div>
	        </div>
    			</c:forEach>
		    	<c:set var="num" value="${num-1 }"/>
	      </div>
          <input type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off" onclick="javascript:gogo();"value="글쓰기" style="float: right;">
    	</div>
		
          
	 <script>
	 	function gogo() {
	 		window.location.href="dogwrite.do";
	 	}
	 </script>
          
           <div class="row mt-5">
          <div class="col text-center">
            <div class="block-27">
              <ul>
                <li><a href="#">&lt;</a></li>
                <li class="active"><span>1</span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&gt;</a></li>
              </ul>
            </div>
          </div>
        </div>
          
          

    </section>

<%@ include file="../footer.jsp"%>