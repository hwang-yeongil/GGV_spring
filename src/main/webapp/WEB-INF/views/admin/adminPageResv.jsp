<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>GGV :: 관리자-예약현황</title>
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
    <style>

    </style>
    <script>
        $(function () {
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
            
            $('.resv-table').DataTable({
                "language": {
                    "lengthMenu": "page당 예매 내역 개수 _MENU_",
                    "zeroRecords": "검색 결과가 없습니다.",
                    "info": "",
                    "infoEmpty": "검색 결과가 없습니다.",
                    "infoFiltered": "(_MAX_ 개의 데이터에서 필터링됨)",
                    "paginate" : {
                        "previous" : "이전페이지",
                        "next" : "다음페이지",
                        "first": "이전페이지",
                        "last" : "마지막페이지"
                    },
                    "search": "검색",
                    "searchPlaceholder" : "검색어를 입력하세요."
                },
                "order" : [2, 'desc']
            });
            $('.dataTables_length').addClass('bs-select');
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
                    <div class="h4 mt-2">예매 관리</div>
                    <div>
                        <span>영화별, 아이디별, 예매날짜별, 금액별로 예매를 관리할 수 있습니다.</span>
                    </div>
                </div>
                <hr>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover resv-table">
                        <thead class="thead-light">
                            <tr>
                                <th>영화명</th>
                                <th>아이디</th>
                                <th>예매날짜</th>
                                <th>금액</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${resvList}" var="resvList">
                            <tr>
                                <td>${resvList.m_title }</td>
                                <c:if test="${resvList.userid eq null}">
                                	<td>${resvList.kakaouserid}</td>
                                </c:if>
                                <c:if test="${resvList.kakaouserid eq null}">
                                	<td>${resvList.userid}</td>
                                </c:if>
                                <td>${resvList.reserve_date}</td>
                                <td class="text-right"><fmt:formatNumber type="number" maxFractionDigits="3" value="${resvList.sales}"/>원</td>
                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /#page-content-wrapper -->
        </div>
    </main>

    <!-- footer 부분 시작 -->
    <jsp:include page="../includes/footer.jsp" />
    <!-- footer 부분 종료 -->
</body>

</html>