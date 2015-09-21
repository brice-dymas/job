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
                    <spring:message code="stage.show" />
                </h4>
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2" id="table_show">
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th><spring:message code="stage.dateDebut" /></th>
                            <th><spring:message code="stage.dateFin" /></th>
                            <th><spring:message code="stage.statut" /></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${stage.dateDebut}</td>
                            <td>${stage.dateFin}</td>
                            <td>${stage.statut}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="stage.observation" /></th>
                        </tr>
                        <tr>
                            <td>${stage.observation}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br/>

        <div class="row">
            <fieldset>
                <legend>
                    <spring:message code="stage.jobSeeker" />
                </legend>
                <table class="table table-condensed table-hover table-bordered">
                    <thead class="bg-primary">
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
                                    <spring:message code="jobSeeker.cni" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.email" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="jobSeeker.telephone" />
                                </span>
                            </th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${stage.jobSeeker.nom}</td>
                            <td>${stage.jobSeeker.prenom}</td>
                            <td>${stage.jobSeeker.cni}</td>
                            <td>${stage.jobSeeker.email}</td>
                            <td>${stage.jobSeeker.telephone}</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="row">
            <fieldset>
                <legend>
                    <spring:message code="stage.entreprise" />
                </legend>
                <table class="table table-condensed table-hover table-bordered">
                    <thead class="bg-primary">
                        <tr>
                            <th>
                                <span class="btn">
                                    <spring:message code="entreprise.nom" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="entreprise.adresse" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="entreprise.telephone" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="entreprise.contact" />
                                </span>
                            </th>
                            <th>
                                <span class="btn">
                                    <spring:message code="entreprise.boitePostale" />
                                </span>
                            </th>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${stage.entreprise.nom}</td>
                            <td>${stage.entreprise.adresse}</td>
                            <td>${stage.entreprise.telephone}</td>
                            <td>${stage.entreprise.contact}</td>
                            <td>${stage.entreprise.boitePostale}</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <hr/>
                <spring:url value="/stage/delete" var="stage_delete"/>
                <form:form method="post" commandName="stage" action="${stage_delete}">
                    <form:hidden path="id"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <spring:url value="/stage/" var="stage_home"/>
                    <a href="${stage_home}" class="btn btn-sm  btn-primary">
                        <span class="glyphicon glyphicon-list"></span>
                        <spring:message code="stage.liste" />
                    </a>
                    <spring:url value="/stage/${stage.id}/edit" var="stage_edit"/>
                    <a href="${stage_edit}" class="btn btn-sm  btn-warning">
                        <span class="glyphicon glyphicon-edit"></span>
                        <spring:message code="action.modifier" />
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