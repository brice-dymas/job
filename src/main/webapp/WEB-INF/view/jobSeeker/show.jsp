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

<tiles:insertDefinition name="layout">
    <tiles:putAttribute name="body">
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
                                </a>
                            </td>
                            <th>Chèque</th>
                            <td>
                                <a href="<c:url value="/resources/documents/${jobSeeker.cheque}"/>">
                                    <span class="fa fa-download fa-lg"></span>
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
                    <spring:url value="/stage/${jobSeeker.id}/affecter" var="stage_new"/>
                    <a href="${stage_new}" class="btn btn-sm btn-success">
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
    </tiles:putAttribute>
</tiles:insertDefinition>