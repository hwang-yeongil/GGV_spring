<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>GGV :: 관리자-예매등록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link href="/css/myPageMain.css" rel="stylesheet">
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script src="/js/index.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <style>

    </style>
    <script>
      	var isScr = "${isScr}";
        $(function () {
        	if(isScr == 1){
        		alert("중복된 상영 정보가 존재합니다. \n다시 입력해주세요.");
        		isScr = "";
        	}
        	
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            })
            
            $(".regBtn").click(function(e){
            	if(confirm("예매 정보를 입력 하시겠습니까?")){
            		alert("등록이 완료되었습니다.");
            		$("#regForm").submit();
            	} else {
            		return false;
            	}
            })
        })
    </script>
</head>

<body>
    <!-- header 부분 시작 -->
   	<header>
        <nav class="navbar navbar-expand-sm bg-white navbar-light fixed-top border border-top-0 border-left-0 border-right-0">
            <div class="container d-flex justify-content-between">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand d-flex align-items-center" href="/user/logout"><img src="/images/h1_cgv.png" alt=""></a>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="/user/logout">LOGOUT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- header 부분 종료 -->

    <main class="d-flex mt-5 mx-auto" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-light border-right pt-5" id="sidebar-wrapper">
            <div class="sidebar-heading"><a href="/admin/sales" class="list-group-item-action">관리자 페이지</a></div>
            <div class="list-group list-group-flush">
                <a href="/admin/sales" class="list-group-item list-group-item-action bg-light">매출 관리</a>
                <a href="/admin/users" class="list-group-item list-group-item-action bg-light">회원 관리</a>
                <a href="/admin/resv" class="list-group-item list-group-item-action bg-light">예매 관리</a>
                <a href="/admin/regist" class="list-group-item list-group-item-action bg-light">예매 등록</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">

            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <button class="btn btn-danger" id="menu-toggle">Toggle Menu</button>
            </nav>

            <div class="d-flex align-items-center justify-content-center mt-5">
                <h1>관리자 페이지</h1>
            </div>
            <hr>

            <div class="container">
                <div class="my-resv">
                    <div class="h4 mt-2">예매 등록</div>
                    <div>
                        <span>예매를 등록합니다.</span>
                    </div>
                </div>
                <hr>
                <form role="form" action="/admin/regist" method="post" id="regForm">
					<!-- 평점 구간 -->
					<div class="mb-4">
						<label for="sel1"><strong>영화</strong></label> 
						<select class="custom-select form-control" id="sel1" name="m_title">
							<option value="1" selected>82년생 김지영</option>
							<option value="2">나쁜 녀석들</option>
							<option value="3">장사리 : 잊혀진 영웅들</option>
							<option value="4">가장 보통의 연애</option>
							<option value="5">퍼펙트맨</option>
							<option value="6">제미니맨</option>
							<option value="7">말레피센트2</option>
							<option value="8">메기</option>
							<option value="9">조커</option>
							<option value="10">람보 : 라스트 워</option>
							<option value="11">벌새</option>
							<option value="12">잃어버린 세계를 찾아서</option>
							<option value="13">얼굴없는 보스</option>
							<option value="14">감쪽같은 그녀</option>
							<option value="15">두 교황</option>
							<option value="16">캣츠</option>
							<option value="17">쥬만지 : 넥스트 레벨</option>
							<option value="18">하나님과의 인터뷰</option>
							<option value="19">닥터 두리틀</option>
							<option value="20">스타워즈 : 라이즈 오브 스카이워커</option>
							<option value="21">킹스맨 : 퍼스트 에이전트</option>
							<option value="22">버즈 오브 프레이</option>
						</select>
					</div>
					<div class="mb-4">
						<label for="sel2"><strong>지역</strong></label> 
						<select class="custom-select form-control" id="sel2" name="theater_pk">
							<option value="1" selected>서울 강남</option>
							<option value="2">서울 건대</option>
							<option value="3">서울 종로</option>
							<option value="4">경기 김포</option>
							<option value="5">경기 동탄</option>
							<option value="6">강원 강릉</option>
							<option value="7">강원 원주</option>
							<option value="21">서울 화곡</option>
							<option value="23">서울 등촌</option>
							<option value="24">서울 구로</option>
							<option value="25">서울 영등포</option>
							<option value="26">서울 홍대</option>
							<option value="27">서울 여의도</option>
							<option value="28">경기 부천</option>
							<option value="29">경기 의정부</option>
						</select>
					</div>
					<div class="mb-4">
						<label for="sel3"><strong>영화관</strong></label> 
						<select class="custom-select form-control" id="sel3" name="aud_name">
							<option value="1관" selected>1관</option>
							<option value="2관">2관</option>
							<option value="3관">3관</option>
							<option value="4관">4관</option>
							<option value="5관">5관</option>
							<option value="6관">6관</option>
						</select>
					</div>
					<div class="mb-4">
						<label for="sel4"><strong>날짜</strong></label>
						<input id="sel4" width="276" name="date"/>
					    <script>
					        $('#sel4').datepicker({
					            uiLibrary: 'bootstrap4'
					        });
					    </script>
				    </div>
				    <div class="mb-4">
						<label for="sel5"><strong>시간</strong></label> 
						<select class="custom-select form-control" id="sel5" name="time">
							<option value="09:00" selected>09:00</option>
							<option value="10:00">10:00</option>
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
							<option value="13:00">13:00</option>
							<option value="14:00">14:00</option>
							<option value="15:00">15:00</option>
							<option value="16:00">16:00</option>
							<option value="17:00">17:00</option>
							<option value="18:00">18:00</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
							<option value="22:00">22:00</option>
							<option value="23:00">23:00</option>
						</select>
					</div>
					<button class="btn btn-primary btn-block regBtn" type="button">작성</button>
				</form>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
    </main>

    <!-- footer 부분 시작 -->
    <jsp:include page="../includes/footer.jsp" />
    <!-- footer 부분 종료 -->
</body>

</html>