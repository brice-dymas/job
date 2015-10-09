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
            <div class="col-md-8 col-md-offset-2">
                <h4>
                    <span class="fa fa-user fa-lg"></span>
                    <spring:message code="placement.show" />
                </h4>
                <hr/>
            </div>
        </div>
        <div class="row">
            <table class="table table-condensed table-hover table-bordered">
                <thead align="center" class="bg-primary">
                    <tr align="center">
                        <th><spring:message code="placement.dateDebut" /></th>
                        <th><spring:message code="placement.dateFin" /></th>
                        <th><spring:message code="placement.statut" /></th>
                        <th><spring:message code="placement.nombreDheureParJour" /></th>
                        <th><spring:message code="placement.tauxHoraire" /></th>
                        <th><spring:message code="placement.observation" /></th>
                    </tr>
                </thead>
                <tbody>
                    <tr align="center">
                        <td><fmt:formatDate value="${placement.dateDebut}" type="date" pattern="dd-MM-yyyy" /></td>
                        <td><fmt:formatDate value="${placement.dateFin}" type="date" pattern="dd-MM-yyyy" /></td>
                        <td>${placement.statut}</td>
                        <td>${placement.nombreDheureParJour}</td>
                        <td>${placement.tauxHoraire}</td>
                        <td>${placement.observation}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br/>

        <div class="row">
            <fieldset>
                <legend>
                    <spring:message code="placement.jobSeeker" />
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
                            <td>${placement.jobSeeker.nom}</td>
                            <td>${placement.jobSeeker.prenom}</td>
                            <td>${placement.jobSeeker.cni}</td>
                            <td>${placement.jobSeeker.email}</td>
                            <td>${placement.jobSeeker.telephone}</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="row">
            <fieldset>
                <legend>
                    <spring:message code="placement.entreprise" />
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
                            <td>${placement.entreprise.nom}</td>
                            <td>${placement.entreprise.adresse}</td>
                            <td>${placement.entreprise.telephone}</td>
                            <td>${placement.entreprise.contact}</td>
                            <td>${placement.entreprise.boitePostale}</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <hr/>
                <spring:url value="/placement/delete" var="placement_delete"/>
                <form:form method="post" commandName="placement" action="${placement_delete}">
                    <form:hidden path="id"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <spring:url value="/placement/" var="placement_home"/>
                    <a href="${placement_home}" class="btn btn-sm  btn-primary">
                        <span class="glyphicon glyphicon-list"></span>
                        <spring:message code="placement.liste" />
                    </a>&nbsp;&nbsp;
                    <spring:url value="/jobSeeker/${placement.jobSeeker.id}/show" htmlEscape="true" var="jobSeeker_show" />
                    <a href="${jobSeeker_show}" class="btn btn-sm btn-success">
                        <span class="glyphicon glyphicon-backward"></span>
                        <spring:message code="placement.jobSeeker" />
                    </a> &nbsp;&nbsp;
                    <spring:url value="/placement/${placement.id}/edit" var="placement_edit"/>
                    <a href="${placement_edit}" class="btn btn-sm  btn-warning">
                        <span class="glyphicon glyphicon-edit"></span>
                        <spring:message code="action.modifier" />
                    </a>
                    &nbsp;&nbsp;
                    <button type="submit" class="btn btn-sm  btn-danger">
                        <span class="glyphicon glyphicon-remove-sign"></span>
                        <spring:message code="action.effacer" />
                    </button>
                </form:form>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>