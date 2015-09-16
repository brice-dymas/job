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
                            <spring:message code="jobSeeker.modifier" /> : ${jobSeeker.numero}
                        </h4>
                        <hr/>
                    </div>
                </div>

                <spring:url   value="/jobSeeker/${jobSeeker.id}/update" var="jobSeeker_update"  htmlEscape="true" />
                <form:form method="post" enctype="multipart/form-data" commandName="jobSeeker" action="${jobSeeker_update}?${_csrf.parameterName}=${_csrf.token}">

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="nom" path="">
                                            <spring:message code="jobSeeker.nom" /> :
                                        </form:label>
                                        <form:input id="nom" path="nom" cssClass="form-control input-sm"/>
                                        <form:errors path="nom" cssClass="text-danger"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <form:label for="prenom" path="">
                                            <spring:message code="jobSeeker.prenom" /> :
                                        </form:label>
                                        <form:input id="prenom" path="prenom" cssClass="form-control input-sm"/>
                                        <form:errors path="prenom" cssClass="text-danger"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="cni" path="">
                                            <spring:message code="jobSeeker.cni" /> :
                                        </form:label>
                                        <form:input id="cni" path="cni" cssClass="form-control input-sm "/>
                                        <form:errors path="cni" cssClass="text-danger"/>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="email" path="">
                                            <spring:message code="jobSeeker.email" /> :
                                        </form:label>
                                        <form:input id="email" path="email" cssClass="form-control input-sm"/>
                                        <form:hidden id="numero" path="numero"/>
                                        <form:errors path="email" cssClass="text-danger"/>
                                    </div>
                                </div>



                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="telephone" path="">
                                            <spring:message code="jobSeeker.telephone" /> :
                                        </form:label>
                                        <form:input id="telephone" path="telephone" cssClass="form-control input-sm"/>
                                        <form:errors path="telephone" cssClass="text-danger"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="statut" path="">
                                            <spring:message code="jobSeeker.statut" />
                                        </form:label>
                                        <form:select id="statut" path="statut" cssClass="form-control">
                                            <form:options  items="${LesStatuts}" />
                                        </form:select>
                                        <form:errors path="statut"  cssClass="text-danger" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="cv" path="">
                                            <spring:message code="jobSeeker.cv" /> :
                                            <a href="<c:url value="/resources/documents/${jobSeeker.cv}"/>">
                                                <span class="glyphicon glyphicon-download"></span>
                                            </a>
                                        </form:label>
                                        <form:input type="file" id="cv" path="cvData" cssClass="filestyle" data-buttonName="btn-primary" data-size="sm" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <form:label for="cheque" path="">
                                            <spring:message code="jobSeeker.cheque" /> :
                                            <a href="<c:url value="/resources/documents/${jobSeeker.cheque}"/>">
                                                <span class="glyphicon glyphicon-download"></span>
                                            </a>
                                        </form:label>
                                        <form:input type="file" id="cheque" path="chequeData" cssClass="filestyle" data-buttonName="btn-primary" data-size="sm" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <fieldset>
                                        <legend>Secteurs d'emploi</legend>
                                        <div class="row">
                                            <div class="col-lg-8 ">
                                                <div id="secteur">
                                                    <table class="table table-bordered">

                                                        <tbody data-size="${jobSeeker.secteursDemploi.size()}">

                                                            <c:if test="${0 le jobSeeker.secteursDemploi.size()}">

                                                                <c:forEach items="${jobSeeker.secteursDemploi}" varStatus="status" begin="0">

                                                                    <tr class="list-secteur">
                                                                        <td>
                                                                            <spring:bind path="secteursDemploi[${status.index}].id">
                                                                                <form:select path="${status.expression}" cssClass="form-control input-sm" >
                                                                                    <form:options items="${secteurs}" />
                                                                                </form:select>
                                                                                <form:errors path="${status.expression}" cssClass="text-danger"/>
                                                                            </spring:bind>
                                                                        </td>
                                                                        <td class="row-align">
                                                                            <button type="button" id="removeSecteurButton" class="btn btn-sm btn-default remove-secteur" >
                                                                                <span class="glyphicon glyphicon-minus-sign"></span>
                                                                            </button>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                    <button type="button" id="addSecteurButton" class="btn btn-sm btn-default add-secteur">
                                                        <span class="glyphicon glyphicon-plus-sign"></span>
                                                        <spring:message code="action.ajouter" />
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
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
                                    <spring:url value="/jobSeeker/" htmlEscape="true"
                                                var="jobSeeker_home" />
                                    <a href="${jobSeeker_home}" class="btn btn-sm btn-default">
                                        <span class="glyphicon glyphicon-list"></span>
                                        <spring:message code="jobSeeker.liste" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <script src="<c:url value="/resources/js/jquery.dynamiclist.min.js" />"></script>
        <script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
        <script type="text/javascript">


            $(document).ready(function () {

                $("#contact").dynamiclist({
                    itemClass: "list-contact",
                    addClass: "add-contact",
                    removeClass: "remove-contact"
                });
                $("#secteur").dynamiclist({
                    itemClass: "list-secteur",
                    addClass: "add-secteur",
                    removeClass: "remove-secteur"
                });
            });
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>