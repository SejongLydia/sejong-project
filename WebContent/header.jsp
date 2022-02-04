<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>SJ 동물보호소</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="images/favicon7.ico" rel="shortcut icon">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/summernote.min.css">
  </head>
  <body>

    <div class="wrap" style="background: #eed179;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 d-flex align-items-center">
						<p class="mb-0 phone pl-md-2">
							<a href="tel:010-2125-5863" class="mr-2"><span class="fa fa-phone mr-1"></span> +82 10 2125 5863</a> 
							<a href="mailto:okadsj@daum.net"><span class="fa fa-paper-plane mr-1"></span> okadsj@daum.net</a>
						</p>
					</div>
					<div class="col-md-4 d-flex justify-content-md-end">
						<div class="social-media">
			    		<p class="mb-0 d-flex">
			    			<a href="https://www.facebook.com/%EB%AA%BD%ED%83%80%EC%9A%B4-%EB%AC%B4%EB%A3%8C%EA%B0%95%EC%95%84%EC%A7%80%EB%B6%84%EC%96%91-%EA%B0%95%EC%95%84%EC%A7%80%EB%AC%B4%EB%A3%8C%EC%9E%85%EC%96%91-%EA%B0%95%EC%95%84%EC%A7%80%EB%AC%B4%EB%A3%8C%EB%B6%84%EC%96%91-%EC%9C%A0%EA%B8%B0%EA%B2%AC%EB%B6%84%EC%96%91-102890501468572" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
			    			<a href="https://twitter.com/jbh1022" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
			    			<a href="https://www.instagram.com/explore/tags/%EC%9C%A0%EA%B8%B0%EA%B2%AC%EB%B6%84%EC%96%91/" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
			    		</p>
		        </div>
					</div>
					<div class="col-md-4 d-flex justify-content-md-end">
						<div class="member-login">
			    		<p class="mb-0 d-flex member-login-color">
			    		<c:choose>
			    			<c:when test="${empty userid}">
			    			<a href="login.do" style="margin-right:20px;">로그인</a>
			    			<a href="jointac.do">회원가입</a>
			    			</c:when>
			    			<c:when test="${not empty userid}">
			    			<a href="logout.do" style="margin-right:20px;">로그아웃</a>
			    			<a href="mypage.do">마이페이지</a>
			    			</c:when>
			    		</c:choose>
			    		</p>
		                </div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light justify-content-center" id="ftco-navbar" style="margin-bottom:0px; padding-bottom:30px;">
	    <div class="container" style="height:100px; align-items: end;" >
	    	<a class="navbar-brand" href="main.do" style="height:77px; padding-top:30px;"><span><img src="images/685005.png" style="width: 50px;"></span>SJ 동물보호소</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars">Menu</span> 
	      </button>
	       <div class="collapse navbar-collapse" id="navbarmain">
				<ul class="navbar-nav ml-auto">
				  <li class="nav-item active">
					<a class="nav-link" href="main.do"  style="color:#93814c;">Home</a>
				  </li>
				   	<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소개 <i class="icofont-thin-down"></i></a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item dropdown-sj" href="about.do">소개</a></li>
							<li><a class="dropdown-item dropdown-sj" href="news.do">새소식</a></li>
						</ul>
				  	</li>
				    <li class="nav-item"><a class="nav-link" href="affiliate.do">파트너 제휴</a></li>
				    <li class="nav-item"><a class="nav-link" href="dog.do">강아지입양</a></li>
				    <li class="nav-item"><a class="nav-link" href="cat.do">고양이입양</a></li>
				    <li class="nav-item"><a class="nav-link" href="enter.do">파양입소신청</a></li>
				    <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">입양완료 <i class="icofont-thin-down"></i></a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item dropdown-sj" href="done.do">입양완료</a></li>
							<li><a class="dropdown-item dropdown-sj" href="review.do">입양후기</a></li>
						</ul>
				  	</li>
	
				    <li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">고객센터 <i class="icofont-thin-down"></i></a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02">
							<li><a class="dropdown-item dropdown-sj" href="inquirylist.do">문의게시판</a></li>
							<li><a class="dropdown-item dropdown-sj" href="faq.do">자주하는질문</a></li>
							<li><a class="dropdown-item dropdown-sj" href="tracks.do">한줄방명록</a></li>
						</ul>
				  	</li>
				</ul>
		   </div>
	  	  </div>
		 </nav>
