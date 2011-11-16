<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="content-full">

    <%--<div id="sidebar">
    <div id="sidebar-warning">
   <span class="error" style="font-weight:bold;padding-top:2px;font-size:80%; float:right;">IMPORTANT</span> <h2>Data type</h2>
    <p>
    Presently, analysis is restricted to "long" (average reads lengths over 200nt), unassembled sequence reads, i.e. Roche 454 sequences,
    from metagenomic or metatranscriptomic samples.</p>
    <span class="separator"></span>
    <p><a href="mailto:datasubs@ebi.ac.uk?subject=EBI Metagenomics - dataset" title="Send an enquiry about Metagenomics data submission"> Contact us</a>, if your datasets do not fit this description, to help us better understand your needs so we can tailor our future developments appropriately.</p>
    </div></div>--%>

    <h2>Submit data</h2>

    <p class="intro">We currently provide a manually-supported submission service. You are asked to send us a summary of
        your data using an online form. You will then be contacted by our curation team to enable submission of your
        data to our analysis pipeline and to the underlying archive (SRA). Our curators will translate your data and
        metadata to the required formats and provide you with accession numbers that you can use for publication
        purposes, and a direct link to your analysis results (note, depending on the size of your submission, the
        analysis may take a few days to complete).</p>

    <%-- Removed because the two pages (login and SSend the form look too similar
    <p class="sub_warn"><img src="${pageContext.request.contextPath}/img/ico_warning_8.png" alt="Important: Data type"> Presently, analysis is restricted to "long" (average reads lengths over 200nt), unassembled sequence reads, i.e. Roche 454 sequences, from metagenomic or metatranscriptomic samples.</p>
--%>
    <p class="step_breadcrumbs"><span id="selected"><%--<span class="num">2</span>--%> Send the form </span></p>

    <div class="sub">

        <div class="sub_form">
            <form:form action="submit" commandName="subForm">
                <fieldset>
                    <div class="form_row">
                        <span><spring:message code="submissionForm.inputField.title.label"/><small>*</small> :</span>
                        <br/>
                        <form:input path="subTitle" cssErrorClass="error" title="Project title"
                                    cssStyle="width:313px;"/>
                        <span class="form_help"><spring:message code="submissionForm.inputField.title.help"/></span>
                        <form:errors path="subTitle" cssClass="error"/></div>
                    <div class="form_row">
                        <span><spring:message code="submissionForm.inputField.date.label"/><small>*</small> :</span>
                        <br/>
                        <form:input id="datepicker" path="releaseDate" cssErrorClass="error"
                                    title="Hold project data private until date"
                                    cssStyle="width:296px;"/>
                        <span class="form_help"><spring:message code="submissionForm.inputField.date.help"/></span>
                        <form:errors cssClass="error" path="releaseDate"/>
                    </div>
                    <div class="form_row">
                        <span><spring:message code="submissionForm.inputField.desc.label"/><small>*</small> :</span>
                        <br/>
                        <form:textarea path="dataDesc" cssErrorClass="error" title="Comments about your project"
                                       cssStyle="width:303px; height:100px;float:left;"/>
                        <span class="form_help"><spring:message code="submissionForm.inputField.desc.help.provide"/> <ul>
                            <li><spring:message code="submissionForm.inputField.desc.help.li.1"/></li>
                            <li><spring:message code="submissionForm.inputField.desc.help.li.2"/></li>
                            <li><spring:message code="submissionForm.inputField.desc.help.li.3"/></li>
                        </ul><br/><spring:message code="submissionForm.inputField.desc.help.this"/></span>
                        <form:errors cssClass="error" path="dataDesc"/>
                    </div>
                    <p style="clear:both;/*For IE6*/">
                        <input type="submit" name="submit" value="Submit" class="main_button"/>
                        <span class="clear_but">| <a href="/metagenomics" title="cancel">Cancel</a></span>
                    </p>
                </fieldset>
            </form:form>
            <small>* Required</small>
        </div>
    </div>

    <div class="sub_ask"> If your datasets do not fit this description, to help us better understand your needs, please
        email us (<a href="mailto:datasubs@ebi.ac.uk?subject=EBI Metagenomics - data submission"
                     title="Send an enquiry about Metagenomics data submission">datasubs@ebi.ac.uk</a>).
    </div>

</div>
