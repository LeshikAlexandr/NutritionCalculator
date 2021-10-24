<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html>
<head>

    <%--    <title>Блог | Blog Template for Bootstrap (BS 4.0)</title>--%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body {
            margin-top: 20px;
            color: #1a202c;
            text-align: left;
            background-color: #e2e8f0;
        }

        .main-body {
            padding: 15px;
        }

        .card {
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0, 0, 0, .125);
            border-radius: .25rem;
        }

        .card-body {
            flex: 1 1 auto;
            min-height: 1px;
            padding: 1rem;
        }

        .gutters-sm {
            margin-right: -8px;
            margin-left: -8px;
        }

        .gutters-sm > .col, .gutters-sm > [class*=col-] {
            padding-right: 8px;
            padding-left: 8px;
        }

        .mb-3, .my-3 {
            margin-bottom: 1rem !important;
        }
    </style>
</head>

<body>

<c:import url="../header.jsp"/>

<div class="container">
    <div class="main-body">

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="${(photo != null && photo.url != null) ? photo.url : "/images/default/avatar7.png"}"
                                  height="450" width="300">
                            <div class="mt-3">
                                <h4>${user.login}</h4>
                                <button class="btn btn-primary m-1">Follow</button>
                                <button class="btn btn-outline-primary m-1">Posts</button>
                                <form method="get" action="/upload">
                                    <button class="btn btn-outline-primary m-1">Upload photo</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="weight"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.weight != 0}">
                                    ${user.weight}
                                </c:if>
                                <c:if test="${user.weight == 0}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="height"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.height != 0}">
                                    ${user.height}
                                </c:if>
                                <c:if test="${user.height == 0}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="age"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.age != 0}">
                                    ${user.age}
                                </c:if>
                                <c:if test="${user.age == 0}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="activity"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.activity != null}">
                                    ${user.activity.code}
                                </c:if>
                                <c:if test="${user.activity == null}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="sex"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.sex != null}">
                                    ${user.sex.code}
                                </c:if>
                                <c:if test="${user.sex == null}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="bov"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <c:if test="${user.sex != null}">
                                    ${user.basicMetabolism}
                                </c:if>
                                <c:if test="${user.sex == null}">
                                    -
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="daily_calories_for_low_weight"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.weightLossCalories}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="daily_calories_for_up_weight"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.weightMaintainCalories}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><spring:message code="daily_calories_for_weight"/></h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                ${user.weightGainCalories}
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-12">
                                <a class="btn btn-info " target="__blank"
                                   href="https://www.bootdey.com/snippets/view/profile-edit-data-and-skills">Edit</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>