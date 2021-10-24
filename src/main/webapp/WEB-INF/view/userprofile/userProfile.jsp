<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .icon_de {
            float: left;
        }

        .header {
            padding: 80px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }

        .nnavbar {
            overflow: hidden;
            background-color: #333;
            position: sticky;
            position: -webkit-sticky;
            top: 0;
        }

        /* Style the navigation bar links */
        .nnavbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        /* Right-aligned link */
        .nnavbar a.right {
            float: right;
        }

        /* Change color on hover */
        .nnavbar a:hover {
            background-color: #ddd;
            color: black;
        }

    </style>
</head>

<body>

<c:import url="../header.jsp"/>
<hr>
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-sm-10"><h1><a text="${user.login}"></a></h1></div>
    </div>
    <div class="row">
        <div class="col-sm-3">

            <div>
                <form method="POST" enctype="multipart/form-data" action="/upload">
                    <table>
                        <img src="${(photo != null && photo.url != null) ? photo.url : '/images/ava.jpg'}" width="200" height="222"/>
                        <tr>
                            <td><input type="file" name="file"/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" class="btn btn-outline-secondary" value="upload"/>upload</td>
                        </tr>

                    </table>
                </form>
            </div>


        </div><!--/col-3-->
        <div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home" text="my_date"></a></li>

                <div class="inputButton">
                    <form action="/customers/edit/${user.id}/" method="get">
                        <button type="submit" class="btn btn-outline-secondary"><p text="edit_date">edit_date</p></button>
                    </form>
                </div>

                <div class="inputButton">
                    <form action="/profile" method="get">
                        <button type="submit" class="btn btn-outline-secondary"><p text="back">back</p></button>
                    </form>
                </div>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="home">
                    <hr>
                    <form class="form" action="##" method="post" id="registrationForm">
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label><h4 text="weight">weight</h4> <h4><a text="${user.weight}">${user.weight}</a></h4></label>
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <label><h4 text="height">height</h4> <h4><a text="${user.height}">${user.height}</a></h4></label>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label><h4 text="age">age</h4> <h4><a text="user.age">${user.age}</a></h4></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6">
                                <h4 text="activity">activity</h4>
                                <h4>
                                    <c:if test="${user.activity != null}">
                                        ${user.activity.code}
                                    </c:if>
                                    <c:if test="${user.activity == null}">
                                        ---
                                    </c:if>
                                </h4>
                            </div>
                        </div>
                        <div class="form-group">

                            <div class="col-xs-6">
                                <h4 text="sex">sex</h4>
                                <h4>
                                    <c:if test="${user.sex != null}">
                                        ${user.sex.code}
                                    </c:if>
                                    <c:if test="${user.sex == null}">
                                        ---
                                    </c:if>
                                </h4>
                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-xs-6">
                                <label>
                                    <h4 text="bov">bov</h4>
                                    <h4 if="${user.sex != null}"><a text="user.basicMetabolism">${user.basicMetabolism}</a>
                                        <c:if test="${user.sex != null}">
                                            ${user.basicMetabolism}
                                        </c:if>
                                    </h4>
                                </label>
                            </div>

                            <%--                            <!--                            <div class="col-xs-6">-->
                                                        <!--                                <label > <h4 th:text="#{bov}" ></h4> <h4><p th:if="${user.sex==null}">0</p></h4> </label>-->
                                                        <!--                                <label > <h4 th:text="#{bov}" ></h4> <h4><a th:text="${user.basicMetabolism}"></a></h4> </label>-->
                                                        <!--                            </div>-->--%>

                            <div class="col-xs-6">
                                <label><h4 text="daily_calories_for_low_weight">daily_calories_for_low_weight</h4> <h4><a text="${user.weightLossCalories}">${user.weightLossCalories}</a></h4></label>
                            </div>

                            <div class="col-xs-6">
                                <label><h4 text="daily_calories_for_up_weight">daily_calories_for_up_weight</h4> <h4><a text="${user.weightMaintainCalories}">${user.weightMaintainCalories}</a></h4></label>
                            </div>

                            <div class="col-xs-6">
                                <label><h4 text="daily_calories_for_weight">daily_calories_for_weight</h4> <h4><a text="user.weightGainCalories">${user.weightGainCalories}</a></h4></label>
                            </div>

                            <c:forEach var="role" items="${user.roles}">
                                ${role.name}
                            </c:forEach>
                        </div>
                    </form>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>