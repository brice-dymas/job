<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<nav class="navbar navbar-inverse" style="height:52px">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>
        <c:set var="url" value="${pageContext.request.requestURI}" />

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li 
                    <c:if test="${fn:containsIgnoreCase(url, 'secteur')}">
                        class="active"
                    </c:if>
                    >
                    <a href="<spring:url value="/secteur/" />">
                        <span class="fa fa-institution"></span> 
                        <spring:message code="secteur.liste" />
                    </a>
                </li>
                <li
                    <c:if test="${fn:containsIgnoreCase(url, 'jobSeeker')}">
                        class="active"
                    </c:if>
                    >
                    <a href="<spring:url value="/jobSeeker/" />">
                        <span class="fa fa-user"></span> 
                        <spring:message code="jobSeeker.liste" />
                    </a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right" >
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <span class="glyphicon glyphicon-user"></span>
                        User<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">
                                Profile
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Tabeaux de bord
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                Déconnexion
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="row">
    <div class="col-lg-12">
        <c:set var="url" value="${pageContext.request.requestURI}" />
        <c:set var="urlPart" value="${fn:split(url, '/')}" />

        <div>
            <ol class="breadcrumb">
                <li>
                    <a href="<c:url value="${pageContext.request.contextPath}" />">
                        Accueil
                    </a>
                </li>
                <c:forEach var="i" begin="${fn:length(urlPart)-2}" end='${fn:length(urlPart)-1}'>
                    <li>
                        <c:choose>
                            <c:when test="${fn:containsIgnoreCase(urlPart[i], 'jsp')}">
                                <span>
                                    <spring:message code="${fn:toLowerCase(fn:substringBefore(urlPart[i], '.'))}" />
                                </span>
                            </c:when>
                            <c:otherwise>
                                <spring:url   value="/${urlPart[i]}/" var="path_element"  htmlEscape="true" />
                                <a href="${path_element}">
                                    <spring:message code="${fn:toLowerCase((urlPart[i]))}" />
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
            </ol>
        </div>
    </div>
</div>