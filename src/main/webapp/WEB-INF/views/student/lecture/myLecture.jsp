<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <style type="text/css">
        #book {
            top: 0px;
        }
    </style>
    <title>Home</title>
    <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
    <script type="text/javascript">
        const date = new Date();
        let year = date.getFullYear();
        let month = date.getMonth();
        let semester;
        const color = [primary, info, danger, warning, secondary, dark];

        switch (month) {
            case '3':
            case '4':
            case '5':
            case '6':
                semester = 1;
                break;
            case '9':
            case '10':
            case '11':
            case '12':
                semester = 2;
                break;
        }

        let lectureListYear = year + "년도 " + semester + "학기 강의목록";

        $(function () {
            $("#lectureListYear").text(lectureListYear);
        })
    </script>
</head>
<body>

<div class="col" >
        <div class="card-header">
            <h3>
                <strong id="lectureListYear"> 수강중인 강의</strong>
            </h3>
        </div>
        <div class="card-body">
            <div class="col-sm-12" align="center">

                <c:forEach var="row" items="${lectureList}" varStatus="stat">
                    <div class="small-box bg-info"
                         style="width: 250px; display: inline-block;">
                        <div class="inner">
                            <h4>${row.subNm}</h4>
                            <p>22년도&nbsp;2학기</p>
                        </div>
                        <div class="icon" id="book">
                            <i class="ion-ios-book"></i>
                        </div>
                        <a href="/lectureBoard/lecPlan?lecaCd=${row.lecaCd}" class="small-box-footer">강의실 가기
                            <i class="fas fa-arrow-circle-right"></i></a>
                    </div>
                </c:forEach>

            </div>
        </div>
</div>
</body>
</html>
