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
                    <h3><spring:message code="placement.liste" /></h3>
                    <hr/>
                </div>

                <div class="dropdown pull-right ">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                        <spring:message code="search.taille" />
                        : ${size}&nbsp;
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=5">5</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=10">10</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=20">20</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=30">30</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=40">40</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&size=50">50</a></li>
                    </ul>
                </div>
                <table class="table table-condensed table-hover table-bordered">
                    <thead class="bg-primary" >
                        <tr>
                            <th>
                                <span class="btn">
                                    <spring:message code="placement.jobSeeker" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="placement.entreprise" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="placement.statut" />
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
                        <c:if test="${placements.size() eq 0}">
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
                <c:if test="${placements.size() ne 0}">
                    <c:forEach items="${placements}" var="placement">
                        <tr>
                            <td>
                                ${placement.jobSeeker.nom}
                            </td>
                            <td>
                                ${placement.entreprise.nom}
                            </td>
                            <td>
                                ${placement.statut}
                            </td>
                            <td class="text-center">
                                <spring:url value="/placement/${placement.id}/edit" htmlEscape="true" var="placement_edit" />
                                <a href="${placement_edit}" class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    <spring:message code="action.modifier" />
                                </a>
                                &nbsp;&nbsp;
                                <spring:url value="/placement/${placement.id}/show" htmlEscape="true" var="placement_show" />
                                <a href="${placement_show}" class="btn btn-primary btn-sm">
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
                            <div class="pull-right">
                                <ul class="pager">

                                    <li><a href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=0&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                            </a></li>
                                        <li><a href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${page-1}&size=${size}"  <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-backward"></span>
                                            </a></li>
                                        <li><input type="text" class="pager_detail text-center" readonly value="${page+1}/${Totalpage}"/></li>
                                    <li><a href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${page+1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                <span class="glyphicon glyphicon-forward"></span>
                                            </a></li>
                                        <li><a href="?&queryentreprise=${queryentreprise}&querynom=${querynom}&querystatut=${querystatut}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${Totalpage-1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
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
                    <h3>
                        <spring:message code="action.rechercher" />
                    </h3>
                    <hr/>
                </div>
                <spring:url value="/placement/search" var="placement_search"
                            htmlEscape="true" />
                <form:form method="get" commandName="appelOffre" action="${placement_search}">

                    <div class="form-group">
                        <label>
                            <spring:message code="jobSeeker.nom" />
                        </label>
                        <input type="text" value="${querynom}" class="form-control input-sm" name="querynom"/>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="entreprise.nom" />
                        </label>

                        <select name="queryentreprise" class="form-control input-sm">
                            <option value="">---</option>
                            <c:forEach var="entreprise" items="${entreprises}">
                                <option value="${entreprise.key}"
                                        <c:if test="${entreprise.key eq queryentreprise}">
                                            selected
                                        </c:if>
                                        >
                                    ${entreprise.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="placement.statut" />
                        </label>
                        <select name="querystatut" class="form-control input-sm">
                            <option value="" >---</option>
                            <c:forEach var="leStatut" items="${mesStatuts}">
                                <option value="${leStatut.value}" >
                                    ${leStatut.value}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="placement.dateDebut" />
                        </label>
                        <input id="dateDebut" type="text" value="${querydatedebut}" class="form-control input-sm" name="querydatedebut"/>
                    </div>
                    <div class="form-group">
                        <label>
                            <spring:message code="placement.dateFin" />
                        </label>
                        <input id="dateFin" type="text" value="${querydatefin}" class="form-control input-sm" name="querydatefin"/>
                    </div>
                    <hr/>
                    <button class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-search">
                            <spring:message code="action.rechercher"/>
                        </span>
                    </button>
                    <spring:url value="/placement/" htmlEscape="true" var="placement_home" />
                    <a href="${placement_home}" class="btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-refresh"></span>
                        <spring:message code="search.delete" />
                    </a>
                </form:form>
            </div>
        </div>

        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript">
            $(function () {
                $("#dateDebut, #dateFin").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "yy/mm/dd",
                    showButtonPanel: false
                }).datepicker("option", "showAnim", "clip");
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>