<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--Page variable which is used several time within this page. Used for not specified study attributes.--%>
<c:set var="notGivenId" value="(not given)"/>

<div id="project_ov">
    <div class="biome_project"><span class="biome_icon icon_sm ${model.study.biomeIconCSSClass}"></span></div>
    <div class="title_tab_p">
        <span class="subtitle">Project overview <span>(${model.study.studyId})</span></span>

        <h2 class="fl_uppercase_title">${model.study.studyName}</h2>
    </div>

    <tags:publications publications="${model.study.publications}" relatedPublications="${model.relatedPublications}"
                       relatedLinks="${model.relatedLinks}"/>


    <c:if test="${!model.study.public}">
        <p>Private data <img alt="private" src="${pageContext.request.contextPath}/img/icon_priv_private.gif">
            <c:choose>
                <c:when test="${not empty model.study.publicReleaseDate}">
                    <c:set var="publicReleaseDate" value="${model.study.publicReleaseDate}"/>
                <span class="list_date">&nbsp;(will be published on the <fmt:formatDate value="${publicReleaseDate}"
                                                                                        pattern="dd-MMM-yyyy"/>)</span>
                </c:when>
                <c:otherwise>
                    <c:set var="publicReleaseDate" value="${notGivenId}"/>
                </c:otherwise>
            </c:choose>
        </p>
    </c:if>


    <p class="project_upd_date">
        <c:choose>
            <c:when test="${not empty model.study.ncbiProjectId && model.study.ncbiProjectId>0}">
                BioProject <a class="ext"
                              href="<c:url value="https://www.ebi.ac.uk/ena/data/view/Project:${model.study.ncbiProjectId}"/>"><c:out
                    value="${model.study.ncbiProjectId}"/></a> -
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
        Last updated: ${model.study.formattedLastReceived}</p>

    <h3 class="study_desc">Description</h3>

    <div class="output_form">
        <c:choose>
            <c:when test="${not empty model.study.studyAbstract}">
                <c:set var="studyAbstract" value="${model.study.studyAbstract}"/>
            </c:when>
            <c:otherwise>
                <c:set var="studyAbstract" value="${notGivenId}"/>
            </c:otherwise>
        </c:choose>

        <p class="study_desc_text"><c:out value="${studyAbstract}"/></p>


        <c:choose>
            <c:when test="${not empty model.study.experimentalFactor}">
                <c:choose>
                    <c:when test="${model.study.experimentalFactor=='none'}"></c:when>
                    <c:otherwise>
                        <c:set var="experimentalFactor" value="${model.study.experimentalFactor}"/>
                        <h4>Experimental factor: <c:out value="${experimentalFactor}"/></h4>
                    </c:otherwise></c:choose>
            </c:when>
            <c:otherwise>
                <c:set var="experimentalFactor" value="${notGivenId}"/>
            </c:otherwise>
        </c:choose>

        <c:if test="${not empty model.study.biome}">
            <h4>Classification: <c:out value="${fn:replace(model.study.biome.lineage,':',' > ')}"/></h4>
        </c:if>
    </div>

    <h3>Contact details</h3>

    <div class="output_form">
        <c:set var="centreName" value="${model.study.centreName}"/>
        <c:choose>
            <c:when test="${not empty model.study.centreName}">
                <div class="result_row">
                    <div class="result_row_label">Institute:</div>
                    <div class="result_row_data"><c:out value="${centreName}"/></div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="result_row">
                    <div class="result_row_label">Institute:</div>
                    <c:set var="centreName" value="${notGivenId}"/></div>
            </c:otherwise>
        </c:choose>

        <c:set var="contactName" value="${model.study.authorName}" scope="page"/>
        <c:set var="contactMail" value="${model.study.authorEmailAddress}" scope="page"/>

        <c:choose>
            <c:when test="${not empty contactName}">
                <div class="result_row">
                    <div class="result_row_label">Name:</div>
                    <div class="result_row_data">${contactName}</div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="result_row">
                    <div class="result_row_label">Name:</div>
                    <div class="result_row_data">not available</div>
                </div>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${not empty contactMail}">
                <div class="result_row">
                    <div class="result_row_label">Email:</div>
                    <div class="result_row_data">${contactMail}</div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="result_row">
                    <div class="result_row_label">Email:</div>
                    <div class="result_row_data lowercase">not available</div>
                </div>
            </c:otherwise>
        </c:choose>

    </div>

    <%--<h3>Other information</h3>--%>


    <c:choose>
        <c:when test="${not empty model.samples}">
            <h3 id="samples_id">Associated samples</h3>
            <%-- <c:if test="${isDialogOpen==false}">
                <p><span style="color:red">No export data available for that(these) sample(s)!</span></p>
            </c:if>
            <div>
                <a href="<c:url value="${baseURL}/project/${model.study.studyId}/doExport/"/>">Export more detailed sample info to CSV</a>
            </div>--%>

            <!-- Removed link temporarily-->
            <%--<div class="export">--%>
            <%--<a href="<c:url value="${baseURL}/project/${model.study.studyId}/doExport/"/>" id="csv_plus"--%>
            <%--title="<spring:message code="studyView.download.anchor.title"/>">--%>
            <%--<spring:message code="download.anchor.label.detailed"/></a>--%>
            <%--</div>--%>


            <table border="1" class="result">
                <thead>
                <tr>
                    <th scope="col" class="h_left">Sample name</th>
                    <th scope="col">Sample ID</th>
                    <th scope="col">Collection date</th>
                    <th scope="col" width="140px">Source</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sample" items="${model.samples}" varStatus="status">
                    <tr>
                        <td class="h_left" id="ordered">
                            <c:if test="${!sample.public}"><img alt="private"
                                                                src="${pageContext.request.contextPath}/img/icon_priv_private.gif">&nbsp;&nbsp;</c:if>
                            <a href="<c:url value="${baseURL}/projects/${sample.study.studyId}/samples/${sample.sampleId}"/>"
                               class="fl_uppercase_title">${sample.sampleName}</a>
                        </td>
                        <td style="width:94px;">${sample.sampleId}</td>
                        <td style="width:130px;">
                            <c:choose>
                                <c:when test="${empty sample.collectionDate}">-</c:when>
                                <c:otherwise><fmt:formatDate value="${sample.collectionDate}"
                                                             pattern="dd-MMM-yyyy"/></c:otherwise>
                            </c:choose></td>
                        <td>${sample.sampleTypeAsString}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </c:when>
        <c:otherwise>
            <%--<p>No samples to display</p>--%>
        </c:otherwise>
    </c:choose>
</div>
