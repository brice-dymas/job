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

<tiles:insertDefinition name="layout">
    <tiles:putAttribute name="body">
        <div class="row">
            <div class="col-md-8 col-md-offset-1">
                <h4>
                    <span class="fa fa-institution fa-lg"></span>
                    <spring:message code="entreprise.afficher" />
                </h4>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2" id="table_show">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <th><spring:message code="entreprise.nom" /> : </th>
                            <td>${entreprise.nom}</td>

                            <th><spring:message code="entreprise.adresse" /> : </th>
                            <td>${entreprise.adresse}</td>

                            <th><spring:message code="entreprise.telephone" /> : </th>
                            <td>${entreprise.telephone}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.boitePostale" /> : </th>
                            <td>${entreprise.boitePostale}</td>

                            <th><spring:message code="entreprise.contact" /> : </th>
                            <td>${entreprise.contact}</td>

                            <th><spring:message code="entreprise.numeroPersonneAContacter" /> : </th>
                            <td>${entreprise.numeroPersonneAContacter}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>


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
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=5">5</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=10">10</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=20">20</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=30">30</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=40">40</a></li>
                            <li role="presentation"><a role="menuitem" tabindex="-1" href="?&querynom=${querynom}&querystatut=${querystatut}&&size=50">50</a></li>
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

                                        <li><a href="?&querynom=${querynom}&querystatut=${querystatut}&&page=0&size=${size}" <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                    <span class="glyphicon glyphicon-fast-backward"></span>
                                                </a></li>
                                            <li><a href="?&querynom=${querynom}&querystatut=${querystatut}&&page=${page-1}&size=${size}"  <c:if test="${page eq 0}">class ="btn btn-sm disabled"</c:if>>
                                                    <span class="glyphicon glyphicon-backward"></span>
                                                </a></li>
                                            <li><input type="text" class="pager_detail text-center" readonly value="${page+1}/${Totalpage}"/></li>
                                        <li><a href="?&querynom=${querynom}&querystatut=${querystatut}&&page=${page+1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                    <span class="glyphicon glyphicon-forward"></span>
                                                </a></li>
                                            <li><a href="?&querynom=${querynom}&querystatut=${querystatut}&&page=${Totalpage-1}&size=${size}"  <c:if test="${page+1 eq Totalpage}">class ="btn btn-sm disabled"</c:if>>
                                                    <span class="glyphicon glyphicon-fast-forward"></span>
                                                </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>


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
                    <spring:url value="/entreprise/${entreprise.id}/show" var="placement_search"
                                htmlEscape="true" />
                    <form:form method="get" commandName="entreprise" action="${placement_search}">
                        <div class="form-group">
                            <label>
                                <spring:message code="jobSeeker.nom" />
                            </label>
                            <input type="text" value="${querynom}" class="form-control input-sm" name="querynom"/>
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
                        <hr/>
                        <button class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-search">
                                <spring:message code="action.rechercher"/>
                            </span>
                        </button>
                        <spring:url value="/entreprise/${entreprise.id}/show" htmlEscape="true" var="placement_home" />
                        <a href="${placement_home}" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-refresh"></span>
                            <spring:message code="search.delete" />
                        </a>
                    </form:form>
                </fieldset>
            </div>
        </c:if>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-8 col-md-offset-4">
            <spring:url value="/entreprise/delete" var="entreprise_delete"/>
            <form:form method="post" commandName="entreprise" action="${entreprise_delete}">
                <form:hidden path="id"/>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <spring:url value="/entreprise/" var="entreprise_home"/>
                <a href="${entreprise_home}" class="btn btn-default btn-primary">
                    <span class="glyphicon glyphicon-list"></span>
                    <spring:message code="entreprise.liste" />
                </a>
                <spring:url value="/entreprise/${entreprise.id}/edit" var="entreprise_edit"/>
                <a href="${entreprise_edit}" class="btn btn-default  btn-warning">
                    <span class="glyphicon glyphicon-edit"></span>
                    <spring:message code="action.modifier" />
                </a>
                <button type="submit" class="btn btn-default  btn-danger">
                    <span class="glyphicon glyphicon-remove-sign"></span>
                    <spring:message code="action.effacer" />
                </button>
            </form:form>
        </div>
    </div>
</tiles:putAttribute>
</tiles:insertDefinition>