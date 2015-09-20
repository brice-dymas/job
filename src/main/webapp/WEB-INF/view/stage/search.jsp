<%--
    Document   : index
    Created on : 29 janv. 2015, 19:59:50
    Author     : fabrice
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<tiles:insertDefinition name="layout">
    <tiles:putAttribute name="body">
        <div class="row">
            <div class="col-md-9">

                <div>
                    <h4>
                        <span class="fa fa-user fa-lg"></span>
                        <spring:message code="jobSeeker.liste" />
                    </h4>
                    <hr/>
                </div>

                <div class="dropdown pull-right ">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        <spring:message code="search.taille" />
                        : ${size}&nbsp;
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querystatut=${querystatut}&querynumero=${querynumero}&size=2">2</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=5">5</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=10">10</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=20">20</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=30">30</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=40">40</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&size=50">50</a></li>
                    </ul>
                </div>
                <table class="table table-condensed table-hover table-bordered">
                    <thead class="bg-primary" >
                        <tr>
                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.numero" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.nom" />
                                </span>
                            </th>

                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.prenom" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.telephone" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="action.titre" />
                                </span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${jobSeekers.size() eq 0}">
                            <tr>
                                <td class="text-center text-warning" colspan="4">
                                    <spring:message code="empty.data" />
                                </td>
                            </tr>
                        </tbody>

                    </table>

                    <div class="row">
                        <div class="col-lg-12">
                            <hr/>
                            <spring:url value="/jobSeeker/new" htmlEscape="true" var="jobSeeker_new" />
                            <a href="${jobSeeker_new}" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-new-window"></span>
                                <spring:message code="action.nouveau" />
                            </a>
                            &nbsp;&nbsp;
                            <spring:url value="/jobSeeker/${jobSeeker.id}/show" htmlEscape="true" var="jobSeeker_show" />
                            <a href="${jobSeeker_show}" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-open"></span>
                                <spring:message code="action.detail" />
                            </a>

                            <div class="pull-right">
                                <ul class="pager">

                                    <li><a href="?query=${query}&page=0&size=${size}" class ="btn btn-sm disabled">
                                            <span class="glyphicon glyphicon-fast-backward"></span>
                                        </a></li>
                                    <li><a href="?query=${query}&page=${page-1}&size=${size}"class ="btn btn-sm disabled">
                                            <span class="glyphicon glyphicon-backward"></span>
                                        </a></li>
                                    <li><input type="text" class="pager_detail text-center" readonly value="0/0"/></li>
                                    <li><a href="?query=${query}&page=${page+1}&size=${size}" class ="btn btn-sm disabled">
                                            <span class="glyphicon glyphicon-forward"></span>
                                        </a></li>
                                    <li><a href="?query=${query}&page=${Totalpage-1}&size=${size}" class ="btn btn-sm disabled">
                                            <span class="glyphicon glyphicon-fast-forward"></span>
                                        </a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${jobSeekers.size() ne 0}">
                    <c:forEach items="${jobSeekers}" var="jobSeeker">
                        <tr>
                            <td>
                                ${jobSeeker.numero}
                            </td>
                            <td>
                                ${jobSeeker.nom}
                            </td>
                            <td>
                                ${jobSeeker.prenom}
                            </td>
                            <td>
                                ${jobSeeker.telephone}
                            </td>
                            <td class="text-center">
                                <spring:url value="/jobSeeker/${jobSeeker.id}/edit" htmlEscape="true" var="jobSeeker_edit" />
                                <a href="${jobSeeker_edit}" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    <spring:message code="action.modifier" />
                                </a>
                                &nbsp;&nbsp;
                                <spring:url value="/jobSeeker/${jobSeeker.id}/show" htmlEscape="true" var="jobSeeker_show" />
                                <a href="${jobSeeker_show}" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-open"></span>
                                    <spring:message code="action.detail" />
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    </table>

                    <div class="row">
                        <div class="col-lg-12">
                            <hr/>
                            <spring:url value="/jobSeeker/new" htmlEscape="true" var="jobSeeker_new" />
                            <a href="${jobSeeker_new}" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-new-window"></span>
                                <spring:message code="action.nouveau" />
                            </a>
                            &nbsp;&nbsp;

                            <div class="pull-right">
                                <ul class="pager">

                                    <li><a href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&page=0&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                            </a></li>
                                        <li><a href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&page=${page-1}&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-backward"></span>
                                            </a></li>
                                        <li><input type="text" class="pager_detail text-center" readonly value="${page+1}/${Totalpage}"/></li>
                                    <li><a href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&page=${page+1}&size=${size}" <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-forward"></span>
                                            </a></li>
                                        <li><a href="?queryprenom=${queryprenom}&querynom=${querynom}&querysecteur=${querysecteur}&querystatut=${querystatut}&querynumero=${querynumero}&page=${Totalpage-1}&size=${size}" <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-fast-forward"></span>
                                            </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                </c:if>
            </div>
            <div class="col-md-3">
                <div>
                    <h4>
                        <span class="fa fa-search fa-lg"></span>
                        <spring:message code="action.rechercher" />
                    </h4>
                    <hr/>
                </div>
                <spring:url value="/jobSeeker/search" var="jobSeeker_home"
                            htmlEscape="true" />

                <form:form method="get" commandName="jobSeeker" action="${jobSeeker_home}">
                    <div class="form-group">
                        <label>
                            <spring:message code="jobSeeker.secteur" />
                        </label>
                        <select name="querysecteur" class="form-control input-sm">
                            <option value="">---</option>
                            <c:forEach var="secteur" items="${secteurs}">

                                <option value="${secteur.key}"
                                        <c:if test="${secteur.key eq querysecteur}">
                                            selected
                                        </c:if>
                                        >
                                    ${secteur.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="jobSeeker.statut" />
                        </label>
                        <select name="querystatut" class="form-control input-sm">
                            <option value="">---</option>
                            <c:forEach var="statutChercheur" items="${LesStatuts}">
                                <option value="${statutChercheur.value}">
                                    ${statutChercheur.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="jobSeeker.nom" />
                        </label>
                        <input type="text" value="${querynom}" class="form-control input-sm" name="querynom"/>
                        <label>
                            <spring:message code="jobSeeker.prenom" />
                        </label>
                        <input type="text" value="${queryprenom}" class="form-control input-sm" name="queryprenom"/>
                        <label>
                            <spring:message code="jobSeeker.numero" />
                        </label>
                        <input type="text" value="${querynumero}" class="form-control input-sm" name="querynumero"/>
                        <input type="hidden" value="${size}" name="size"/>
                    </div>
                    <hr/>
                    <button class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-search"></span> <spring:message code="search"/></button>
                        <spring:url value="/jobSeeker/" htmlEscape="true" var="jobSeeker_home" />
                    <a href="${jobSeeker_home}" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-refresh"></span>
                        <spring:message code="search.delete" />
                    </a>

                </form:form>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>