<%--
    Document   : show
    Created on : Dec 10, 2014, 9:48:58 AM
    Author     : sando
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<tiles:insertDefinition name="layout">
    <tiles:putAttribute name="body">
        <c:set var="url" value="${pageContext.request.requestURI}" />
        <div id="gmailTab" class="container-fluid">
            <ul class="nav nav-pills">
                <li
                    <c:if test="${fn:endsWith(url, 'show')}">
                        class="active"
                    </c:if>
                    >
                    <a href="#profil" data-toggle="tab">
                        <i class="fa fa-inbox"></i>
                        Profil du Chercheur
                    </a>
                </li>
                <li
                    <c:if test="${fn:containsIgnoreCase(url, '?query')}">
                        class="active"
                    </c:if>
                    >
                    <a href="#placements" data-toggle="tab">
                        <i class="fa fa-users"></i>
                        Placements du Chercheur
                    </a>
                </li>
            </ul>
            <div class="tab-content clearfix">
                <div class="tab-pane" id="profil">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h4>
                                <span class="fa fa-user fa-lg"></span>
                                <spring:message code="jobSeeker.afficher" /> : ${jobSeeker.numero}
                            </h4>
                            <hr/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2" id="table_show">
                            <table class="table table-condensed">
                                <tbody>
                                    <tr>
                                        <th><spring:message code="jobSeeker.nom" /></th>
                                        <td>${jobSeeker.nom}</td>
                                        <th><spring:message code="jobSeeker.prenom" /></th>
                                        <td>${jobSeeker.prenom}</td>
                                        <th><spring:message code="jobSeeker.cni" /></th>
                                        <td>${jobSeeker.cni}</td>

                                    </tr>
                                    <tr>
                                        <th><spring:message code="jobSeeker.email" /></th>
                                        <td>${jobSeeker.email}</td>
                                        <th><spring:message code="jobSeeker.telephone" /></th>
                                        <td>${jobSeeker.telephone}</td>
                                        <th><spring:message code="jobSeeker.statut" /></th>
                                        <td>${jobSeeker.statut}</td>
                                    </tr>
                                    <tr>
                                        <th>C.V.</th>
                                        <td>
                                            <a href="<c:url value="/resources/documents/${jobSeeker.cv}"/>">
                                                <span class="fa fa-download fa-lg"></span>
                                                ${jobSeeker.cv}
                                            </a>
                                        </td>
                                        <th>Chèque</th>
                                        <td>
                                            <a href="<c:url value="/resources/documents/${jobSeeker.cheque}"/>">
                                                <span class="fa fa-download fa-lg"></span>
                                                ${jobSeeker.cheque}
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <fieldset>
                                <legend><spring:message code="jobSeeker.secteur" /></legend>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr class="bg-primary">
                                            <th>#</th>
                                            <th><spring:message code="secteur.libelle" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="secteur" items="${jobSeeker.secteursDemploi}">
                                            <tr>
                                                <td>${secteur.id}</td>
                                                <td>${secteur.libelle} </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <hr/>
                            <spring:url value="/jobSeeker/delete" var="jobSeeker_delete"/>
                            <form:form method="post" commandName="jobSeeker" action="${jobSeeker_delete}">
                                <form:hidden path="id"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <spring:url value="/jobSeeker/" var="jobSeeker_home"/>
                                <a href="${jobSeeker_home}" class="btn btn-primary  btn-sm">
                                    <span class="glyphicon glyphicon-list"></span>
                                    <spring:message code="jobSeeker.liste" />
                                </a>
                                <spring:url value="/jobSeeker/${jobSeeker.id}/edit" var="jobSeeker_edit"/>
                                <a href="${jobSeeker_edit}" class="btn btn-sm  btn-warning">
                                    <span class="glyphicon glyphicon-edit"></span>
                                    <spring:message code="action.modifier" />
                                </a>
                                <spring:url value="/placement/${jobSeeker.id}/affecter" var="placement_new"/>
                                <a href="${placement_new}" class="btn btn-sm btn-success">
                                    <span class="glyphicon glyphicon-new-window"></span>
                                    Affecter
                                </a>
                                <button type="submit" class="btn btn-sm  btn-danger">
                                    <span class="glyphicon glyphicon-remove-sign"></span>
                                    <spring:message code="action.effacer" />
                                </button>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div class="tab-pane active" id="placements">
                    <br/>
                    <hr>
                    <div class="row">
                        <div class="col-md-9">
                            <fieldset>
                                <legend>
                                    <h3><spring:message code="placement.liste" /></h3>
                                </legend>

                                <div class="dropdown pull-right ">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                        <spring:message code="search.taille" />
                                        : ${size}&nbsp;
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=5">5</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=10">10</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=20">20</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=30">30</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=40">40</a></li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="?&&size=50">50</a></li>
                                    </ul>
                                </div>
                                <table class="table table-condensed table-hover table-bordered">
                                    <thead class="bg-primary" >
                                        <tr>
                                            <th>
                                                <span class="btn">
                                                    <spring:message code="placement.entreprise" />
                                                </span>
                                            </th>
                                            <th>
                                                <span class="btn">
                                                    <spring:message code="placement.dateDebut" />
                                                </span>
                                            </th>
                                            <th>
                                                <span class="btn">
                                                    <spring:message code="placement.dateFin" />
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
                                                ${placement.entreprise.nom}
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${placement.dateDebut}" pattern="dd-MM-yyyy"  />
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${placement.dateFin}" pattern="dd-MM-yyyy"  />
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

                                                    <li><a href="?&queryentreprise=${queryentreprise}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=0&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                                <span class="glyphicon glyphicon-fast-backward"></span>
                                                            </a></li>
                                                        <li><a href="?&queryentreprise=${queryentreprise}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${page-1}&size=${size}"  <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                                <span class="glyphicon glyphicon-backward"></span>
                                                            </a></li>
                                                        <li><input type="text" class="pager_detail text-center" readonly value="${page+1}/${Totalpage}"/></li>
                                                    <li><a href="?&queryentreprise=${queryentreprise}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${page+1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                                <span class="glyphicon glyphicon-forward"></span>
                                                            </a></li>
                                                        <li><a href="?&queryentreprise=${queryentreprise}&querydatedebut=${querydatedebut}&querydatefin=${querydatefin}&page=${Totalpage-1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                                <span class="glyphicon glyphicon-fast-forward"></span>
                                                            </a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                </c:if>
                        </div>
                        </fieldset>

                        <div class="col-md-3">
                            <fieldset>
                                <legend>
                                    <h3>
                                        <spring:message code="action.rechercher" />
                                    </h3>
                                </legend>
                                <hr>
                                <spring:url value="/jobSeeker/${jobSeeker.id}/show" var="jobSeeker_search"
                                            htmlEscape="true" />
                                <form:form method="get" commandName="jobSeeker" action="${jobSeeker_search}">
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
                                    <spring:url value="/jobSeeker/${jobSeeker.id}/show" htmlEscape="true" var="placement_home" />
                                    <a href="${placement_home}" class="btn btn-default btn-sm">
                                        <span class="glyphicon glyphicon-refresh"></span>
                                        <spring:message code="search.delete" />
                                    </a>
                                </form:form>
                            </fieldset>
                        </div>
                    </div>
                </div>
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