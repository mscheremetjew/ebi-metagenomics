<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src='http://github.highcharts.com/master/highcharts.src.js' type='text/javascript'></script>
<script src='http://github.highcharts.com/master/highcharts-more.js' type='text/javascript'></script>
<script src='http://github.highcharts.com/master/modules/exporting.src.js' type='text/javascript'></script>

<script>
    // Could I have some tabs please ?
    $(function() {
        $( '#tabs' ).tabs();
    });
</script>

<style>
    #bars {

    }
    #bars .rChart {
        display:inline-block;
    }

    #pca .rChart {
        display:inline-block;
    }

</style>

<h3><p>Functional analysis result: ${data}</p></h3>
<ul>
    <li>Project: <a href="<c:url value="${baseURL}/project/${study.studyId}"/>" target="_blank" title="View project page">${study.studyId}</a> - ${study.studyName}</li>
    <li>Samples: <c:forEach var="sample" items="${samples}">
        <a href="<c:url value="${baseURL}/sample/${sample.sampleId}"/>" target="_blank">${sample.sampleId}</a>
    </c:forEach></li>
</ul>
<p>Use tabs below to switch between available visualizations.</p>
<%--div class="sample_ana"--%>
<div id="tabs">
    <ul>
        <li><a href="#overview">Overview</a></li>
        <li><a href="#bars">Barcharts</a></li>
        <li><a href="#stack">Stacked columns</a></li>
        <li><a href="#heatmap">Heatmap</a></li>
        <li><a href="#pca">Principal Components Analysis</a></li>
        <li><a href="#jstable">Table</a></li>
    </ul>
    <div id="overview">
        <p>${graphCode[0]}</p>
    </div>
    <div id="bars">
        <div>${graphCode[1]}</div>
    </div>
    <div id="stack">Select category
        <select id="stack_select">
            <option value="">Choose a GO type</option>
            <option value="bio">Biological process</option>
            <option value="cell">Cellular component</option>
            <option value="mol">Molecular function</option>
        </select>
        ${graphCode[2]}
    </div>
    <div id="heatmap">Select category
        <select id="hm_select">
            <option value="">Choose a GO type</option>
            <option value="bio">Biological process</option>
            <option value="cell">Cellular component</option>
            <option value="mol">Molecular function</option>
        </select>
        ${graphCode[3]}
    </div>
    <div id="pca">
        Principal Component 1 <input id="pc1" type="number" name="Principal Component 1" min="1" max="3" value="1" disabled>
        Principal Component 2 <input id="pc2" type="number" name="Principal Component 2" min="1" max="3" value="2" disabled> <br>
        <p>${graphCode[4]}</p>
    </div>
    <div id="jstable">
        <p>${graphCode[5]}</p>
    </div>
</div>
<%--/div--%>
<script>
    // jQuery FTW !!! Hiding / showing div for heatmaps and stacked columns

    // Heatmap first
    hideAllHMDivs = function () {
        $("#hm_bio").hide();
        $("#hm_cell").hide();
        $("#hm_mol").hide();
    };

    handleNewHMSelection = function () {

        hideAllHMDivs();

        switch ($(this).val()) {
            case 'bio':
                $("#hm_bio").show();
                break;
            case 'cell':
                $("#hm_cell").show();
                break;
            case 'mol':
                $("#hm_mol").show();
                break;
        }
    };

    $(document).ready(function() {

        $("#hm_select").change(handleNewHMSelection);

        // Run the event handler once now to ensure everything is as it should be
        handleNewHMSelection.apply($("#hm_select"));

    });

    // Then stacked columns
    hideAllStackDivs = function () {
        $("#stack_biological_process").hide();
        $("#stack_cellular_component").hide();
        $("#stack_molecular_function").hide();
    };

    handleNewStackSelection = function () {

        hideAllStackDivs();

        switch ($(this).val()) {
            case 'bio':
                $("#stack_biological_process").show();
                break;
            case 'cell':
                $("#stack_cellular_component").show();
                break;
            case 'mol':
                $("#stack_molecular_function").show();
                break;
        }
    };

    $(document).ready(function() {

        $("#stack_select").change(handleNewStackSelection);

        // Run the event handler once now to ensure everything is as it should be
        handleNewStackSelection.apply($("#stack_select"));

    });

    // Then stacked columns
    hideAllPCA = function () {
        $("#stack_biological_process").hide();
        $("#stack_cellular_component").hide();
        $("#stack_molecular_function").hide();
    };

    handleNewStackSelection = function () {

        hideAllStackDivs();

        switch ($(this).val()) {
            case 'bio':
                $("#stack_biological_process").show();
                break;
            case 'cell':
                $("#stack_cellular_component").show();
                break;
            case 'mol':
                $("#stack_molecular_function").show();
                break;
        }
    };

    $(document).ready(function() {

        $("#stack_select").change(handleNewStackSelection);

        // Run the event handler once now to ensure everything is as it should be
        handleNewStackSelection.apply($("#stack_select"));

    });

</script>