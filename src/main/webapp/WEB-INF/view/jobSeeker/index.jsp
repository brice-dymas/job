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
            <div class="col-md-12">

                <div>
                    <h3><spring:message code="jobSeeker.liste" /></h3>
                    <hr/>
                </div>

                <div class="dropdown pull-right ">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        <spring:message code="search.taille" />
                        : ${size}&nbsp;
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=5">5</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=10">10</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=20">20</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=30">30</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=40">40</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&size=50">50</a></li>
                    </ul>
                </div>
                <table class="table table-condensed table-hover table-bordered">
                    <thead class="bg-primary" >
                        <tr>
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
                            <spring:url value="/jobSeeker/search" htmlEscape="true" var="jobSeeker_search" />
                            <a href="${jobSeeker_new}" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-new-window"></span>
                                <spring:message code="action.nouveau" />
                            </a>
                            <a href="${jobSeeker_search}" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-search"></span>
                                <spring:message code="action.rechercher" />
                            </a>

                            <div class="pull-right">
                                <ul class="pager">

                                    <li><a href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&page=0&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                            </a></li>
                                        <li><a href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&page=${page-1}&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-backward"></span>
                                            </a></li>
                                        <li><input type="text" class="pager_detail text-center" readonly value="${page+1}/${Totalpage}"/></li>
                                    <li><a href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&page=${page+1}&size=${size}" <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-forward"></span>
                                            </a></li>
                                        <li><a href="?&querynom=${jobSeeker.nom}&querysecteur=${jobSeeker.secteurDactivite.libelle}&page=${Totalpage-1}&size=${size}" <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-fast-forward"></span>
                                            </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                </c:if>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>