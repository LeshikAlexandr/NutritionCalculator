<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html>
<head>

    <title>Post</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        body {
            margin-top: 20px;
        }

        .entry-content .entry-title a {
            color: #333;
        }

        .entry-content .entry-title a:hover {
            color: #4782d3;
        }

        .entry-content .entry-meta span {
            font-size: 12px;
        }

        .entry-thumb img {
            border-top-left-radius: 6px;
            border-top-right-radius: 6px;
        }

        .entry-thumb .thumb-hover {
            position: absolute;
            width: 100px;
            height: 100px;
            background: rgba(71, 130, 211, 0.85);
            display: block;
            top: 50%;
            left: 50%;
            color: #fff;
            font-size: 40px;
            line-height: 100px;
            border-radius: 50%;
            margin-top: -50px;
            margin-left: -50px;
            text-align: center;
            transform: scale(0);
            -webkit-transform: scale(0);
            opacity: 0;
            transition: all .3s ease-in-out;
            -webkit-transition: all .3s ease-in-out;
        }

        .entry-thumb:hover .thumb-hover {
            opacity: 1;
            transform: scale(1);
            -webkit-transform: scale(1);
        }

        .article-post .post-thumb {
            display: block;
            position: relative;
            overflow: hidden;
        }

        .article-post .post-thumb .post-overlay {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            transition: all .3s;
            -webkit-transition: all .3s;
            opacity: 0;
        }

        .article-post .post-thumb .post-overlay span {
            width: 100%;
            display: block;
            vertical-align: middle;
            text-align: center;
            transform: translateY(70%);
            -webkit-transform: translateY(70%);
            transition: all .3s;
            -webkit-transition: all .3s;
            height: 100%;
            color: #fff;
        }

        .article-post .post-thumb:hover .post-overlay {
            opacity: 1;
        }

        .article-post .post-thumb:hover .post-overlay span {
            transform: translateY(50%);
            -webkit-transform: translateY(50%);
        }

        .post-content .post-title {
            font-weight: 500;
        }

        .post-meta {
            padding-top: 15px;
            margin-bottom: 20px;
        }

        .post-meta li:not(:last-child) {
            margin-right: 10px;
        }

        .post-meta li a {
            color: #999;
            font-size: 13px;
        }

        .post-meta li a:hover {
            color: #4782d3;
        }

        .post-meta li i {
            margin-right: 5px;
        }

        .post-meta li:after {
            margin-top: -5px;
            content: "/";
            margin-left: 10px;
        }

        .post-meta li:last-child:after {
            display: none;
        }

        .post-masonry .masonry-title {
            font-weight: 500;
        }

        .share-buttons li {
            vertical-align: middle;
        }

        .share-buttons li a {
            margin-right: 0px;
        }

        .post-content .fa {
            color: #ddd;
        }

        .post-content a h2 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 0px;
        }

        .article-post .owl-carousel {
            margin-bottom: 20px !important;
        }

        .post-masonry h4 {
            text-transform: capitalize;
            font-size: 1rem;
            font-weight: 700;
        }

        .mb40 {
            margin-bottom: 40px !important;
        }

        .mb30 {
            margin-bottom: 30px !important;
        }

        .media-body h5 a {
            color: #555;
        }

        .categories li a:before {
            content: "\f0da";
            font-family: 'FontAwesome';
            margin-right: 5px;
        }

        .categories li {
            vertical-align: middle;
        }

        .categories li > ul {
            padding-left: 15px;
        }

        .categories li > ul > li > a {
            font-weight: 300;
        }

        .categories li a {
            color: #999;
            position: relative;
            display: block;
            padding: 5px 10px;
            border-bottom: 1px solid #eee;
        }

        .categories li a:before {
            content: "\f0da";
            font-family: 'FontAwesome';
            margin-right: 5px;
        }

        .categories li a:hover {
            color: #444;
            background-color: #f5f5f5;
        }

        .categories > li.active > a {
            font-weight: 600;
            color: #444;
        }

        .media-body h5 {
            font-size: 15px;
            letter-spacing: 0px;
            line-height: 20px;
            font-weight: 400;
        }

        .media-body h5 a {
            color: #555;
        }

        .media-body h5 a:hover {
            color: #4782d3;
        }

        body {
            margin-top: 20px;
        }

        .content-item {
            padding: 30px 0;
            background-color: #FFFFFF;
        }

        .content-item.grey {
            background-color: #F0F0F0;
            padding: 50px 0;
            height: 100%;
        }

        .content-item h2 {
            font-weight: 700;
            font-size: 35px;
            line-height: 45px;
            text-transform: uppercase;
            margin: 20px 0;
        }

        .content-item h3 {
            font-weight: 400;
            font-size: 20px;
            color: #555555;
            margin: 10px 0 15px;
            padding: 0;
        }

        .content-headline h2 {
            background-color: #FFFFFF;
            display: inline-block;
            margin: -20px auto 0;
            padding: 0 20px;
        }

        .grey .content-headline h2 {
            background-color: #F0F0F0;
        }

        .content-headline h3 {
            font-size: 14px;
            color: #AAAAAA;
            display: block;
        }


        #comments {
            box-shadow: 0 -1px 6px 1px rgba(0, 0, 0, 0.1);
            background-color: #FFFFFF;
        }

        #comments form {
            margin-bottom: 30px;
        }

        #comments .btn {
            margin-top: 7px;
        }

        #comments form fieldset {
            clear: both;
        }

        #comments form textarea {
            height: 100px;
        }

        #comments .media {
            border-top: 1px dashed #DDDDDD;
            padding: 20px 0;
            margin: 0;
        }

        #comments .media > .pull-left {
            margin-right: 20px;
        }

        #comments .media img {
            max-width: 100px;
        }

        #comments .media h4 {
            margin: 0 0 10px;
        }

        #comments .media h4 span {
            font-size: 14px;
            float: right;
            color: #999999;
        }

        #comments .media p {
            margin-bottom: 15px;
            text-align: justify;
        }

        #comments .media-detail {
            margin: 0;
        }

        #comments .media-detail li {
            color: #AAAAAA;
            font-size: 12px;
            padding-right: 10px;
            font-weight: 600;
        }

        #comments .media-detail a:hover {
            text-decoration: underline;
        }

        #comments .media-detail li:last-child {
            padding-right: 0;
        }

        #comments .media-detail li i {
            color: #666666;
            font-size: 15px;
            margin-right: 10px;
        }

        .image-upload > input {
            display: none;
        }
    </style>
</head>

<body>

<c:import url="../header.jsp"/>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container pb50">
    <div class="row">
        <div class="col-md-12 mb40">
            <article>
                <div style="text-align: center; margin: 20px">
                    <c:if test="${post.photo != null}">
                        <img src="${post.photo.url}" alt="" class="img-fluid mb30">
                    </c:if>

                    <c:if test="${post.photo == null}">
                        <img src="https://via.placeholder.com/300x300/FFA07A/000000" class="img-responsive"
                             alt="" width="350" height="350">
                    </c:if>

                </div>
                <div class="post-content">
                    <h3>${post.title}</h3>
                    <form method="post" action="/posts/delete/${post.id}">
                        <button class="btn btn-primary m-1"><spring:message code="delete_post"/></button>
                    </form>
                    <ul class="post-meta list-inline">
                        <li class="list-inline-item">
                            <i class="fa fa-user-circle-o"></i> ${post.customer.login}
                        </li>
                        <li class="list-inline-item">
                            <i class="fa fa-calendar-o"></i> ${post.createdDate}
                        </li>
                    </ul>

                    <p class="lead">${post.text}</p>
                    <hr class="mb40">
                    <h4 class="mb40 text-uppercase font500">Comments</h4>
                    <section class="content-item" id="comments">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-8">
                                    <c:forEach var="comment" items="${post.comments}">
                                    <!-- COMMENT 1 - START -->
                                    <div class="media">
                                        <c:if test="${comment.photo != null}">
                                            <a class="pull-left" href="#"><img class="media-object"
                                                                               src="${comment.photo.url}"
                                                                               width="50" height="50"></a>
                                        </c:if>
                                        <div class="media-body">
                                            <h4 class="media-heading">${comment.customer.login}</h4>
                                            <p>${comment.text}</p>
                                            <ul class="list-unstyled list-inline media-detail pull-left">
                                                <li><i class="fa fa-calendar"></i>${comment.createdDate}</li>
                                            </ul>
                                        </div>
                                        <c:if test="${comment.customer.id == customer.id}">
                                            <form:form action="/posts/comment/delete/${comment.id}" method="post">
                                                <button type="submit" class="btn btn-outline-success"><spring:message
                                                        code="delete_comment"/></button>
                                            </form:form>
                                        </c:if>
                                        <sec:authorize access="hasRole('ADMIN')">
                                            <form:form action="/posts/comment/delete/${comment.id}" method="post">
                                                <button type="submit" class="btn btn-outline-success"><spring:message
                                                        code="delete_comment"/></button>
                                            </form:form>
                                        </sec:authorize>
                                        </c:forEach>
                                    </div>
                                    <form action="/posts/newComment/${post.id}" enctype="multipart/form-data"
                                          modelAttribute="comment"
                                          method="post">
                                        <fieldset>
                                            <div class="row">
                                                <div class="form-group col-xs-12 col-sm-9 col-lg-10">
                                                    <textarea class="form-control" id="message"
                                                              placeholder="<spring:message code="your_comment"/>"
                                                              required=""
                                                              name="text"></textarea>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="image-upload input-group">
                                            <label for="file-input">
                                                <img src="/images/default/clip.png"
                                                     height="50px" width="50px"/>
                                            </label>
                                            <button type="submit" class="btn btn-normal pull-right"><spring:message
                                                    code="comment"/></button>
                                            <input id="file-input" type="file" name="file"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </article>
        </div>
    </div>
</div>
</body>
</html>