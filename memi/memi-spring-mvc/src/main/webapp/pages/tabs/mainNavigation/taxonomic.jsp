<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div id="fragment-taxonomy">

    <div class="main_tab_full_content">
        <p>These are the results from the taxonomic analysis steps of our pipeline. You can switch between
            different views of the data using the menu of icons below (pie, bar, stacked and interactive krona
            charts). If you wish to download the full set of results, all files are listed under the
            "Download" tab.</p>

        <c:choose>
            <c:when test="${empty model.sample.analysisCompleted}">
                <div class="msg_error">Analysis in progress.</div>
            </c:when>
            <c:when test="${not empty model.sample.analysisCompleted && !model.analysisStatus.taxonomicAnalysisTabDisabled}">
                <h3>Top taxonomy Hits</h3>

                <div id="tabs-taxchart">
                    <ul>
                        <li class="selector_tab">Switch view:</li>
                            <%--<li><a href="#tax-table" title="Table view"><span class="ico-table"></span></a></li>--%>
                        <li><a title="Pie-Chart-View"
                               href="<c:url value="${baseURL}/sample/${model.sample.sampleId}/taxPieChartView"/>"><span
                                class="ico-pie"></span></a></li>
                        <li><a title="Bar-Chart-View"
                               href="<c:url value="${baseURL}/sample/${model.sample.sampleId}/taxBarChartView"/>"><span
                                class="ico-barh"></span></a></li>
                        <li><a title="Stacked-Column-Chart-View"
                               href="<c:url value="${baseURL}/sample/${model.sample.sampleId}/taxColumnChartView"/>"><span
                                class="ico-col"></span></a></li>
                        <li class="but_krona"><a title="Krona-Chart-View"
                                                 href="<c:url value="${baseURL}/sample/${model.sample.sampleId}/kronaChartView"/>"><span
                                class="ico-krona"></span></a></li>
                            <%--<li class="ico-downl"><a class="icon icon-functional" data-icon="=" href="#download" title="Download image/table"></a></li>--%>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="msg_error">No taxonomy result files have been associated with this sample.</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script type="text/javascript">

        //Ajax load approach as described here: http://jqueryui.com/tabs/#ajax
        $("#tabs-taxchart").tabs({
            cache:true,
            ajaxOptions:{
                error:function (xhr, status, index, anchor) {
                    $(anchor.hash).html("<div class='msg_error'>Couldn't load this tab. We'll try to fix this as soon as possible.</div>");
                }
            },
            spinner:false,
            select:function (event, ui) {
                var tabID = "#ui-tabs-" + (ui.index + 1);
                $(tabID).html("<b>Loading Data.... Please wait....</b>");
            }
        });
        //Default functionality
        $("#tabs-taxchart").tabs({${model.analysisStatus.taxonomicAnalysisTab.tabsOptions}});


</script>
<%--Remove the filter box for taxonomy table when the total number of phylum is less than 10--%>
<c:if test="${fn:length(model.taxonomyAnalysisResult.taxonomyDataSet)<10}">
    <style>#tax_table_filter, #tax_table_col_filter, #tax_table_bar_filter {
        display: none;
    }</style>
</c:if>