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
                <div class="row">
                    <div class="col-md-12">
                        <h4>
                            <span class="fa fa-user fa-lg"></span>
                            <spring:message code="placement.new" />
                        </h4>
                        <hr/>
                    </div>
                    <div class="col-md-12">
                        <h4>
                            <form:errors path="*"/>
                        </h4>
                        <hr/>
                    </div>
                </div>
                <spring:url   value="/placement/${placement.jobSeeker.id}/create" var="placement_create"  htmlEscape="true" />
                <form:form method="post" commandName="placement" action="${placement_create}">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="dateDebut" path="">
                                            <spring:message code="placement.dateDebut" />
                                        </form:label>
                                        <form:input id="dateDebut" path="dateDebut" cssClass="form-control input-sm"/>
                                        <form:errors path="dateDebut" cssClass="text-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="dateFin" path="">
                                            <spring:message code="placement.dateFin" />
                                        </form:label>
                                        <form:input id="dateFin" path="dateFin" cssClass="form-control input-sm"/>
                                        <form:errors path="dateFin" cssClass="text-danger"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="nombreDheureParJour" path="">
                                            <spring:message code="placement.nombreDheureParJour" />
                                        </form:label>
                                        <form:input id="nombreDheureParJour" path="nombreDheureParJour" cssClass="form-control input-sm"/>
                                        <form:errors path="nombreDheureParJour" cssClass="text-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="tauxHoraire" path="">
                                            <spring:message code="placement.tauxHoraire" />
                                        </form:label>
                                        <form:input id="tauxHoraire" path="tauxHoraire" cssClass="form-control input-sm"/>
                                        <form:errors path="tauxHoraire" cssClass="text-danger"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <form:label for="obs" path="">
                                            <spring:message code="placement.observation" />
                                        </form:label>
                                        <form:textarea id="obs" path="observation" cssClass="form-control input-sm"/>
                                        <form:errors path="observation" cssClass="text-danger"/>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <form:label path="" id="statut">
                                            <spring:message code="placement.statut" />
                                        </form:label>
                                        <form:select path="statut" class="form-control input-sm">
                                            <form:option value="none" >---</form:option>
                                            <c:forEach var="leStatut" items="${mesStatuts}">
                                                <form:option value="${leStatut.value}">
                                                    ${leStatut.value}
                                                </form:option>
                                            </c:forEach>
                                        </form:select>
                                        <form:errors path="statut" cssClass="text-danger"/>
                                    </div>
                                </div>
                            </div>
                            <hr>

                            <div class="row">
                                <fieldset>
                                    <legend>
                                        <spring:message code="placement.jobSeeker" />
                                    </legend>

                                </fieldset>
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
                            </div>

                            <div class="row">
                                <fieldset>
                                    <legend>
                                        <spring:message code="placement.entreprise" />
                                    </legend>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <form:label for="entreprise" path="">
                                                <spring:message code="placement.entreprise" />
                                            </form:label>
                                            <form:select path="entreprise.id" class="form-control input-sm">
                                                <form:option value="">---</form:option>
                                                <c:forEach var="entreprise" items="${entreprises}">
                                                    <form:option value="${entreprise.key}">
                                                        ${entreprise.value}
                                                    </form:option>
                                                </c:forEach>
                                            </form:select>
                                            <form:errors path="entreprise" cssClass="text-danger"/>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-sm btn-primary">
                                        <span class="glyphicon glyphicon-save"></span>
                                        <spring:message code="action.enregistrer" />
                                    </button>
                                    <spring:url value="/placement/" htmlEscape="true"
                                                var="placement_home" />
                                    <a href="${placement_home}" class="btn btn-sm btn-default">
                                        <span class="glyphicon glyphicon-list"></span>
                                        <spring:message code="placement.liste" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                $("#dateDebut").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    showButtonPanel: false
                });
                $("#dateFin").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    showButtonPanel: false
                });
            });
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>