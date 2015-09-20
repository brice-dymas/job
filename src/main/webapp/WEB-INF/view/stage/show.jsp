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
                    <spring:message code="stage.afficher" />
                </h4>
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 col-md-offset-2" id="table_show">
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <td><spring:message code="stage.dateebut" /></td>
                            <td><spring:message code="stage.dateFin" /></td>
                            <td><spring:message code="stage.statut" /></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${stage.dateDebut}</td>
                            <td>${stage.prenom}</td>
                            <td>${stage.statut}</td>
                        </tr>
                        <tr>
                            <td>
                            <td><spring:message code="stage.dateebut" /></td> :
                            ${stage.observation}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <hr>

        <div class="row">
            <fieldset>
                <legend>
                    <spring:message code="stage.jobSeeker" />
                </legend>
                <table class="table table-condensed table-hover table-bordered">
                    <thead>
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
                    <thead>
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
                                    <spring:message code="jobSeeker.boitePostale" />
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
    </tiles:putAttribute>
</tiles:insertDefinition>