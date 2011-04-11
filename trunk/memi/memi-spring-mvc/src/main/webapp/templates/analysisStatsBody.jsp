<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="goSlimExportID" value="Export GO slim terms table (CSV)"/>

<div id="content-full">
<c:choose>
    <c:when test="${not empty model.sample}">
        <div id="sidebar-analysis">
        <div id="sidebar-export" >

                    <ul>
                        <li><a title="Click to download all submitted nucleotide data on the ENA website" href="<c:url value="http://www.ebi.ac.uk/ena/data/view/${model.sample.sampleId}"/>">Export submitted nucleotide data (ENA website)</a></li>
                        <li><a title="Click to download processed fasta nucleotide sequences" href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportMaskedFASTAFile/${model.emgFile.fileName}"/>">Export processed nucleotide data (FASTA)</a></li>
                        <li><a title="Click to download predicted CDS in fasta format" href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportCDSFile/${model.emgFile.fileName}"/>">Export predicted CDS (FASTA)</a></li>
                        <li><a title="Click to download full InterPro match table (TSV)" href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportI5File/${model.emgFile.fileName}"/>">Export Interpro matches (TSV)</a></li>
                    </ul>

        </div>

       <div id="sidebar-steps">
          <h2> Data processing steps </h2>
                    <ol>
                        <li>Submitted reads (fasta)</li>

                        <li>Nucleotide sequence processing
                         <ol><li>Clipping - low quality ends trimmed and adapter sequences removed using Biopython SeqIO package</li>
                             <li>Quality filter - sequences with > 10% undetermined nucleotides removed</li>
                          <li>Read length filter � sequences shorter than 99 nt removed</li>
                          <li>Remove duplicate sequences � clustered on 99% identity (UCLUST v  1.1.579), representative sequence chosen</li>
                          <li> Repeat masking � RepeatMasker (open-3.2.2), removed reads with 50% or more nucleotides masked</li>
                         </ol></li>
                        <li>CDS prediction (FragGeneScan v 1.15)</li>
                        <li>InterPro match generation. pCDS were searched with InterProScan 5.0 (beta release) using InterPro release 31.0 (Databases included in search � Pfam). A Gene Ontology (GO) annotation profile was generated by mappings GO terms derived from InterPro matches to the following GO slim: goslim_goa</li>
                    </ol>
        </div>
       </div>

        <h2>Analysis results<br/>
        ${model.sample.sampleName} sample</h2>


        <h3>General statistics</h3>
        <c:set var="noDisplayID" value="No data to display."/>

        <p>Total number of sequence reads with predicted CDS features and InterPro matches<br/>

                    <c:url var="statisticsImage" value="/getImage" scope="request">
                        <c:param name="imageName" value="statistics.png"/>
                        <c:param name="imageType" value="PNG"/>
                        <c:param name="dir" value="${model.emgFile.fileID}"/>
                    </c:url>
                     <%--<img src="<c:out value="${statisticsImage}"/>"/>  --%>
         <img src="http://chart.googleapis.com/chart?chco=6daf50|93c47e|bbd9ad|e1eedc&cht=bhs&chxt=x,y&chxs=1,343434,11,1,l|0,ffffff,0,0,_&chs=450x130&chxl=1:|Processed+reads+with+InterPro+match|Processed+reads+with+pCDS|Processed+reads|Submitted+reads&chds=0,265514&chm=N,343434,0,-1,11,,:4&chd=t:132757,80620,62432,2017"/>
         </p>

        <h3>InterPro protein matches</h3>
        <p>Top 5 abundant InterPro terms found in this analysis:</p>
        <c:choose>
            <c:when test="${not empty model.interProEntries}">
                <%--<c:set var="proteinExportID" value="Export full InterPro protein matches table (Excel or TSV)"/>--%>
                <%--<a title="<c:out value="${proteinExportID}"/>"--%>
                <%--href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportIPRFile/${model.emgFile.fileName}"/>">--%>
                <%--<c:out value="${proteinExportID}"/>--%>
                <%--</a>--%>

               <div class="export">
                <c:set var="exportDetailedID" value="Export detailed file (TSV, 448Mb)" scope="page"/>
                <a href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportI5File/${model.emgFile.fileName}"/>"
                    title="<c:out value="${exportDetailedID}"/>">
                    <c:out value="${exportDetailedID}"/>
                </a>
                <c:set var="exportTableID" value="Export full table (CSV)" scope="page"/>
                <a href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportIPRFile/${model.emgFile.fileName}"/>"
                   id="csv" title="<c:out value="${exportTableID}"/>">
                    <c:out value="${exportTableID}"/>
                </a>
            </div>
                <table border="1" class="result" id="small">
                    <thead>
                    <tr>
                        <th scope="col" abbr="IEid" width="90px">InterPro ID</th>
                        <th scope="col" abbr="IEname">Entry name</th>
                        <th scope="col" abbr="IEnum"  width="80px">Protein matches</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="entry" items="${model.interProEntries}" varStatus="status">
                        <tr>
                            <td>
                                <c:url var="linkToInterProSearch" value="http://wwwdev.ebi.ac.uk/interpro/ISearch">
                                    <c:param name="query" value="${entry.entryID}"/>
                                </c:url>
                                <a href="<c:out value="${linkToInterProSearch}"/>" title="<c:out value="Link to ${entry.entryID}"/>" class="ext">
                                    <c:out value="${entry.entryID}"/>
                                </a>
                            </td>
                            <td style="text-align:left;">${entry.entryDescription}</td>
                            <td id="ordered">${entry.numOfEntryHits}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:set var="showFullTableID" value="View full table"/>
                <p><a title="<c:out value="${showFullTableID}"/>"  href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/showProteinMatches"/>">
                <c:out value="${showFullTableID}"/></a></p>

            </c:when>
            <c:otherwise>
                <b><c:out value="${noDisplayID}"/></b>
            </c:otherwise>
        </c:choose>


        <h3>GO Terms annotation</h3>
        <p>A Gene Ontology (GO) annotation profile was generated by mappings GO terms derived from InterPro matches to  GO slim (goslim_goa).</p>

        <div id="go-chart">
            <div class="export">


  <c:if test="${not empty model.pieChartBiologicalProcessURL}">

  <c:set var="goExportID" value="Export full GO result file (TSV)"/>
  <a title="<c:out value="${goExportID}"/>" href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportGOFile/${model.emgFile.fileName}"/>">
  <c:out value="${goExportID}"/></a>


  <a  id="csv" title="<c:out value="${goSlimExportID}"/>" href="<c:url value="${baseURL}/analysisStatsView/${model.sample.sampleId}/doExportGOSlimFile/${model.emgFile.fileName}"/>">
  <c:out value="${goSlimExportID}"/></a>
  </c:if>


        </div>
           <div style="border-top:0px #dedede solid;clear:both;padding-top:14px;">
             <div id="go-chart-process">
               <h2>Biological process</h2>
               <c:choose>
                <c:when test="${not empty model.pieChartBiologicalProcessURL}">

                    <c:url var="bioImage" value="/getImage" scope="request">
                        <c:param name="imageName" value="biological.png"/>
                        <c:param name="imageType" value="PNG"/>
                        <c:param name="dir" value="${model.emgFile.fileID}"/>
                    </c:url>
                    <%--<img src="<c:out value="${bioImage}"/>"/>--%>
                    <img src="http://chart.googleapis.com/chart?chbh=14&cht=bhs&chco=ff0a00|ff4700|ff8400|ffb444|ffd088|ffebcc|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082|b8b082&chs=300x347&chxt=x&chxs=0,ffffff,0,0,_&chd=t:339456,331153,295104,271080,231710,148571,86519,73324,24639,9530,6309,1595,1368,1209,396,196,12,2,1&chds=0,678912&chxr=0,0,678912&chm=tmacromolecule+metabolic+process+(339456),343434,0,0,9,,l:4:0|tcellular+process+(331153),343434,0,1,9,,l:4:0|tbiosynthetic+process+(295104),343434,0,2,9,,:4|tnucleobase+nucleoside+nucleotide+and+nucleic+acid+metabolic+process+(271080),343434,0,3,9,,:4|tmetabolic+process+(231710),343434,0,4,9,,:4|ttransport+(148571),343434,0,5,9,,:8|tregulation+of+biological+process+(86519),343434,0,6,9,,:4|tresponse+to+stimulus+(73324),343434,0,7,9,,:4|tcatabolic+process+(24639),343434,0,8,9,,:4|tmulti-organism+process+(9530),343434,0,9,9,,:4|tbiological_process+(6309),343434,0,10,9,,:4|tcell+communication+(1595),343434,0,11,9,,:4|tsecretion+(1368),343434,0,12,9,,:4|tcell+differentiation+(1209),343434,0,13,9,,:4|tcellular+component+movement+(396),343434,0,14,9,,:4|tpathogenesis+(196),343434,0,15,9,,:4|tcell+death+(12),343434,0,16,9,,:4|tmulticellular+organismal+process+(2),343434,0,17,9,,:4|tmulticellular+organismal+development+(1),343434,0,18,9,,:4"/>
                </c:when>
                <c:otherwise>
                <b><c:out value="${noDisplayID}"/></b>
                </c:otherwise>
               </c:choose>
             </div>

            <div id="go-chart-molecular">
               <h2>Molecular function</h2>
               <c:choose>
                 <c:when test="${not empty model.pieChartCellularComponentURL}">
                           <c:url var="cellImage" value="/getImage" scope="request">
                                    <c:param name="imageName" value="molecular.png"/>
                                    <c:param name="imageType" value="PNG"/>
                                    <c:param name="dir" value="${model.emgFile.fileID}"/>
                                </c:url>
                                  <%--<img src="<c:out value="${cellImage}"/>"/> --%>
                 <img src="http://chart.googleapis.com/chart?chbh=14&cht=bhs&chco=7403ff|9c00ff|b744ff|d188ff|ecccff|f7ebff|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2|cfc8d2&chs=300x473&chxt=x&chxs=0,ffffff,0,0,_&chma=0,40,0,0&chd=t:335063,194614,191041,131029,86016,82764,78037,63878,42514,42370,34434,33473,30627,27601,26475,17328,16311,6438,6294,5362,3375,1776,1753,1054,516,146&chds=0,678912&chxr=0,0,678912&chm=tbinding+(335063),545454,0,0,9,,:4|thydrolase+activity+(194614),545454,0,1,9,,:4|tnucleic+acid+binding+(191041),545454,0,2,9,,:4:0|ttransferase+activity+(131029),545454,0,3,9,,:4|tcatalytic+activity+(86016),545454,0,4,9,,:4|ttransporter+activity+(82764),545454,0,5,9,,:4|toxidoreductase+activity+(78037),545454,0,6,9,,:4|tligase+activity+(63878),545454,0,7,9,,:4|tion+transmembrane+transporter+activity+(42514),545454,0,8,9,,:4|tisomerase+activity+(42370),545454,0,9,9,,:4|tmolecular_function+(34434),545454,0,10,9,,:4|tkinase+activity+(33473),545454,0,11,9,,:4|tsignal+transducer+activity+(30627),545454,0,12,9,,:4|tstructural+molecule+activity+(27601),545454,0,13,9,,:4|tlyase+activity+(26475),545454,0,14,9,,:4|thelicase+activity+(17328),545454,0,15,9,,:4|tprotein+binding+(16311),545454,0,16,9,,:4|telectron+carrier+activity+(6438),545454,0,17,9,,:4|treceptor+activity+(6294),545454,0,18,9,,:4|ttranscription+regulator+activity+(5362),545454,0,19,9,,:4|tprotein+transporter+activity+(3375),545454,0,20,9,,:4|tenzyme+regulator+activity+(1776),545454,0,21,9,,:4|tchannel+activity+(1753),545454,0,22,9,,:4|tantioxidant+activity+(1054),545454,0,23,9,,:4|tintegrase+activity+(516),545454,0,24,9,,:4|tmotor+activity+(146),545454,0,25,9,,:4 "/>
                 </c:when>
                 <c:otherwise>
                 <b><c:out value="${noDisplayID}"/></b>
                 </c:otherwise>
                 </c:choose>
            </div>
            <div id="go-chart-cellular">
               <h2>Cellular component</h2>
               <c:choose>
                 <c:when test="${not empty model.pieChartCellularComponentURL}">
                           <c:url var="cellImage" value="/getImage" scope="request">
                                    <c:param name="imageName" value="cellular.png"/>
                                    <c:param name="imageType" value="PNG"/>
                                    <c:param name="dir" value="${model.emgFile.fileID}"/>
                                </c:url>
                                  <%--<img src="<c:out value="${cellImage}"/>"/> --%>
                 <img src="http://chart.googleapis.com/chart?chbh=14&cht=bhs&chco=0c24d9|003bff|446fff|88a3ff|ccd7ff|e6ebff|b6babe|b6babe|b6babe|b6babe|b6babe&chs=300x203&chxt=x&chxs=0,ffffff,0,0,_&chma=0,40,0,0&chd=t:172677,101006,58908,16321,8255,4099,2916,600,42,1,1&chds=0,678912&chxr=0,0,678912&chm=tmembrane+(172677),545454,0,0,9,,:4|tcytoplasm+(101006),545454,0,1,9,,:4|tintracellular+(58908),545454,0,2,9,,:4|tchromosome+(16321),545454,0,3,9,,:4|texternal+encapsulating+structure+(8255),545454,0,4,9,,:4|tcellular_component+(4099),545454,0,5,9,,:4|tcell+(2916),545454,0,6,9,,:4|textracellular+region+(600),545454,0,7,9,,:4|tnucleus+(42),545454,0,8,9,,:4|tproteinaceous+extracellular+matrix+(1),545454,0,9,9,,:4|textracellular+space+(1),545454,0,11,9,,:4"/>
                 </c:when>
                 <c:otherwise>
                 <b><c:out value="${noDisplayID}"/></b>
                 </c:otherwise>
                 </c:choose>
             </div>
             </div>
        </div>

    </c:when>
    <c:otherwise>
        <h2>Analysis Statistics</h2>

        <h3>Sample ID Not Recognised</h3>
    </c:otherwise>
</c:choose>


</div>