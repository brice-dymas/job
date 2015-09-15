<%--
    Document   : new
    Created on : Dec 10, 2014, 9:20:13 AM
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
                    <spring:message code="entreprise.nouveau" />
                </h4>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <spring:url value="/entreprise/create" var="entreprise_create"
                            htmlEscape="true" />
                <form:form method="post" commandName="entreprise" action="${entreprise_create}">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <form:label for="nom" path="">
                                            <spring:message code="entreprise.nom" /> :
                                        </form:label>
                                        <form:input id="nom" path="nom" cssClass="form-control"/>
                                        <form:errors path="nom" cssClass="label label-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="bp" path="">
                                            <spring:message code="entreprise.boitePostale" /> :
                                        </form:label>
                                        <form:input id="bp" path="boitePostale" cssClass="form-control"/>
                                        <form:errors path="boitePostale" cssClass="label label-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="telephone" path="">
                                            <spring:message code="entreprise.telephone" /> :
                                        </form:label>
                                        <form:input id="telephone" path="telephone" cssClass="form-control"/>
                                        <form:errors path="telephone" cssClass="label label-danger"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="adresse" path="">
                                            <spring:message code="entreprise.adresse" /> :
                                        </form:label>
                                        <form:input id="adresse" path="adresse" cssClass="form-control"/>
                                        <form:errors path="adresse" cssClass="label label-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="contact" path="">
                                            <spring:message code="entreprise.contact" /> :
                                        </form:label>
                                        <form:input id="contact" path="contact" cssClass="form-control"/>
                                        <form:errors path="contact" cssClass="label label-danger"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-save"></span>
                                <spring:message code="action.enregistrer" />
                            </button>
                            <spring:url value="/entreprise/" htmlEscape="true"
                                        var="entreprise_home" />
                            <a href="${entreprise_home}" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-list"></span>
                                <spring:message code="entreprise.liste" />
                            </a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>