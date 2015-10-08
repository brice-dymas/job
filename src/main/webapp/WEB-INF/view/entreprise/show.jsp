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
                    <span class="fa fa-institution fa-lg"></span>
                    <spring:message code="entreprise.afficher" />
                </h4>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4" id="table_show">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <th><spring:message code="entreprise.nom" /> : </th>
                            <td>${entreprise.nom}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.adresse" /> : </th>
                            <td>${entreprise.adresse}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.telephone" /> : </th>
                            <td>${entreprise.telephone}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.boitePostale" /> : </th>
                            <td>${entreprise.boitePostale}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.contact" /> : </th>
                            <td>${entreprise.contact}</td>
                        </tr>
                        <tr>
                            <th><spring:message code="entreprise.numeroPersonneAContacter" /> : </th>
                            <td>${entreprise.numeroPersonneAContacter}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-4">
                <hr/>
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