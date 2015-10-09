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
                    <spring:message code="typeDocument.nouveau" />
                </h4>
                <hr/>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <spring:url value="/typeDocument/create" var="typeDocument_create"
                            htmlEscape="true" />
                <form:form method="post" commandName="typeDocument" action="${typeDocument_create}">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <div class="form-group">
                                <form:label for="nom" path="">
                                    <spring:message code="typeDocument.nom" /> :
                                </form:label>
                                <form:input id="nom" path="nom" cssClass="form-control"/>
                                <h5>
                                    <form:errors path="nom" cssClass="label label-danger"/>
                                </h5>

                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-save"></span>
                                <spring:message code="action.enregistrer" />
                            </button>
                            <spring:url value="/typeDocument/" htmlEscape="true"
                                        var="typeDocument_home" />
                            <a href="${typeDocument_home}" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-list"></span>
                                <spring:message code="typeDocument.liste" />
                            </a>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>