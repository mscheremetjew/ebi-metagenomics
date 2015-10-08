<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="eng">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="en-GB" />
    <meta http-equiv="Window-target" content="_top" />
    <meta name="no-email-collection" content="http://www.unspam.com/noemailcollection/" />

    <title><tiles:insertAttribute name="pageTitle"/>&lt; EBI metagenomics &lt; EMBL-EBI</title>

    <meta name="description" content="EBI Metagenomics is a free resource for the analysis, archiving and browsing of metagenomic and metatranscriptomic data"/>
    <meta name="keywords" content="ebi, EBI, InterPro, interpro, metagenomics, metagenomic, metagenome, metagenomes, DNA, microbiology, microbial, ecology, organisms, microorganism, microorganisms, biodiversity, diversity, gene, genes, genome, genomes, genomic, genomics, ecogenomics, community genomics, genetic, sequencing, sequence, environment, environmental, ecosystem, ecosystems, samples, sample, annotation, protein, research, archive, metabolic, pathways, analysis, function, GAIA, shotgun, pyrosequencing, community, communities, metabolism, cultivation, bioinformatics, bioinformatic, database, metadata, dataset, data, repository"/>
    <meta name="author" content="InterPro EMBL-EBI">
    <!-- Mobile viewport optimized-->
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <!-- import Lato - temp?-->
    <link href='https://fonts.googleapis.com/css?family=Lato:400,300,700,900,100' rel='stylesheet' type='text/css'>

    <!-- EBI style and code - update to https-->
    <link rel="stylesheet" href="https://www.ebi.ac.uk/inc/css/contents.css" type="text/css" />
    <link rel="stylesheet" href="https://www.ebi.ac.uk/inc/css/userstyles.css" type="text/css" />
    <script src="https://www.ebi.ac.uk/inc/js/contents.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://www.ebi.ac.uk/inc/css/sidebars.css" type="text/css" />

        <link rel="alternate" title="EBI News RSS" href="/Information/News/rss/ebinews.xml" type="application/rss+xml" />
        <link type="text/css" rel="stylesheet" href="//www.ebi.ac.uk/web_guidelines/css/mitigation/develop/ebi-mitigation.css"/>
        <link type="text/css" rel="stylesheet" href="//www.ebi.ac.uk/web_guidelines/css/mitigation/develop/embl-petrol-colours.css"/>
        <script defer="defer" src="//www.ebi.ac.uk/web_guidelines/js/cookiebanner.js"></script>
        <script defer="defer" src="//www.ebi.ac.uk/web_guidelines/js/foot.js"></script>

        <style type="text/css" media="screen, projection">

            /* [FR] Feb 03, 2012 */

            /* The Magnificent Clearfix: Updated to prevent margin-collapsing on child elements.
            j.mp/bestclearfix */
            .clearfix:before, .clearfix:after { content: "\0020"; display: block; height: 0; overflow: hidden; }
            .clearfix:after { clear: both; }
            /* Fix clearfix: blueprintcss.lighthouseapp.com/projects/15318/tickets/5-extra-margin-padding-bottom-of-page */
            .clearfix { zoom: 1; }

            div.cols3 {padding:10px; clear:both;}

            div.cols3 .col1 {padding:0; float:left; width:32%; margin-right:2%;}

            div.cols3 .col2 {padding:0; float:left;width:32%;margin-right:2%;}

            div.cols3 .col3 {padding:0; float:left; width:32%; }

            div.cols3 ul { padding-left: 20px; }

        </style>
    <%-- END EBI style and code--%>

    <%-- remove favicon from img folder to root as was not working anymore--%>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico"/>

    <%--?v1.1 will trigger browsers to refresh the source--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css?v1.4" type="text/css" media="all"/>
    <%--css for image zooming--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.fancybox.css" type="text/css" media="screen" />

    <%--tooltip css--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.qtip.css?v1.1" type="text/css"/>

    <!--[if lt IE 9]>
    <style type="text/css">.krona_chart {display: none;}/*remove the Krona box */</style>
    <style type="text/css">#ie_krona {display: block;}/*Add a message to the Krona tab for IE users (lower version than IE9)*/</style>
    <style type="text/css">.but_chart_export, .chart-but-export {display: none;}/*remove the export button - both analysis and comparison - as export is not working for IE8, IE7, IE6*/</style>
    <![endif]-->
    <!--[if lt IE 8]>
    <style type="text/css"> table.result tbody tr td {background-color: #F4F4F8;}</style>
    <![endif]-->
    <!--[if lt IE 7]>
    <style type="text/css"> #feedback_div {display: none;}
    #feedback_no_div {display: block;}</style>
    <![endif]-->

    <!-- JQuery v1.11.1 and JQuery UI source-->
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1/jquery.js?v1.1" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.11.1/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Image zoomer-->
    <script src="${pageContext.request.contextPath}/js/jquery.fancybox.pack.js" type="text/javascript"></script>

    <%--tooltip css--%>
    <script src="${pageContext.request.contextPath}/js/qtip/jquery.qtip.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/qtip/common.js" type="text/javascript"></script>
    <%--end tooltip--%>
    <script src="${pageContext.request.contextPath}/js/jquery.validate-1.9.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form-3.51.0.js?v1.1" type="text/javascript"></script>
    <!-- The date picker is used within the submission page -->
    <script src="${pageContext.request.contextPath}/js/datepicker.js" type="text/javascript"></script>
    <!-- The auto completion is used with the study search page -->
    <script src="${pageContext.request.contextPath}/js/autocompletion.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/js/formclearer.js" type="text/javascript"></script>
    <!-- Jquey scroller - work only for the anchors on the same page-->
    <script src="${pageContext.request.contextPath}/js/smoothscrol.js" type="text/javascript"></script>
    <!-- The following line includes the feedback dialog script. -->
    <script src="${pageContext.request.contextPath}/js/feedback_script.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
<script type="text/javascript">
    document.createElement('header');
    document.createElement('hgroup');
    document.createElement('nav');
    document.createElement('menu');
    document.createElement('section');
    document.createElement('article');
    document.createElement('aside');
    document.createElement('footer');
    document.createElement('figure');
    document.createElement('figcaption');
</script>
    <![endif]-->  <%-- HTML5 tags working in IE8 by including this JavaScript in the head  --%>

    <%-- simple script for alternate row in a table color was #EFF1F1 originally--%>
    <script>
        $(document).ready(function () {
            $("table.result tbody tr:even").css("background-color", "#F4F4F8");
            $("table.result tbody tr:odd").css("background-color", "#e9e9e9");
        });
    </script>

    <script type="text/javascript"
            src="https://maps.google.com/maps/api/js?sensor=false">
    </script>
    <script type="text/javascript">
        function initialize(lat, long) {
            var latlng = new google.maps.LatLng(lat, long);
            google.maps.MarkerOptions
            var myOptions = {
                zoom:4,
                center:latlng,
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                streetViewControl: false
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"),
                    myOptions);
            var marker = new google.maps.Marker({
                position:latlng,
                map:map
            });
        }

    </script>

     <%--WARNING this is inserting a character on top of the page--%>
    <%--<!-- Script and noscript versions for feedback and login links --><script type="text/javascript">--%>
    <%--document.write('<style type="text/css">#noscript_feedbackLink{display: none;}#noscript_loginLink{display: none;}</style>');--%>
<%--</script>​--%>
    <!--Load the Google Visualization API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tablequerywrapper.js"></script>

    <noscript>
        <style type="text/css">
        #tax-Krona, #tabs-chart, #interpro-chart, #tabs-taxchart {display: none;}/*remove the Krona box  and all charts tabs when no javascript*/
        #script_feedbackLink {display: none;}/*remove the feedback button when no javascript*/
        #script_loginLink {display: none;}  /*remove the login button when no javascript*/
        #mod4 {display: none;} /* remove the last item - jumping line - of the carousel when no javascript */
        </style>
    </noscript>

</head>

<%@ include file="scriptlets/_getActivePage.jsp" %>
<c:set var="enaUrlParam" value="<%=activePage%>" scope="session"/>
<%-- The following variable saves and provides the base URL for the whole application --%>
<c:set var="baseURL" value="" scope="session"/>

<body class="<tiles:getAsString name='bodyClass'/>">

<%-- EBI-Interpro main header - exactly same as Interpro header--%>
<div class="headerdiv" id="headerdiv">
  <div class="header">
      <%--<div id="global-masthead-container"></div>--%>
      <%--<div id="local-masthead-container"></div>--%>


      <div id="global-masthead" class="masthead grid_24">

			<a href="//www.ebi.ac.uk/" title="Go to the EMBL-EBI homepage"><img src="//www.ebi.ac.uk/web_guidelines/images/logos/EMBL-EBI/EMBL_EBI_Logo_white.png" alt="EMBL European Bioinformatics Institute" /></a>

      <div class="nav">
				<ul id="global-nav">

          <li class="first active" id="services"><a href="//www.ebi.ac.uk/services">Services</a></li>
					<li id="research"><a href="//www.ebi.ac.uk/research">Research</a></li>
					<li id="training"><a href="//www.ebi.ac.uk/training">Training</a></li>
					<li id="industry"><a href="//www.ebi.ac.uk/industry">Industry</a></li>
					<li id="about" class="last"><a href="//www.ebi.ac.uk/about">About us</a></li>
				</ul>
      </div>
    </div>

    <div id="local-masthead" class="masthead grid_24">
    <!-- local-title - logo only patterns, see http://www.ebi.ac.uk/web/style/patterns -->
    <div class="logo-title" id="local-title"> <h1 class="visuallyhidden">EBI metagenomics</h1> <a href="<c:url value="/"/>" title="Back to EBI metagenomics homepage"><img src="${pageContext.request.contextPath}/img/logo_metagenomics_white_web.png" alt="EBI metagenomics logo"></a> </div>

        <nav>
            <tiles:insertAttribute name="mainMenu"/>
        </nav>

    </div>
  </div>
</div>
<%-- END EBI main header --%>
<div class="ebi_contents" id="contents"> <%-- style="margin:0; width:100%;"--%>
    <div id="content-full">
    <div class="grid_24">
    <tiles:insertAttribute name="breadcrumbs"/>

        <%--<header>--%>
            <%--<tiles:insertAttribute name="header"/>--%>
        <%--</header>--%>
        <%--<nav>--%>
            <%--<tiles:insertAttribute name="mainMenu"/>--%>
        <%--</nav>--%>

    <tiles:insertAttribute name="body"/>
    </div>
    </div>

    <footer>
    <%--<div id="global-footer-container"></div>--%>
       <tiles:insertAttribute name="footer"/>
    </footer>
</div>
<%-- END div contents --%>

<%--little beta flag--%>
<%--<a href="<c:url value="${baseURL}/about#intro"/>" title="About us"><div id="extra_beta" class="anim"></div></a>--%>

<!-- The following line includes the feedback DIV and the feedback FORM -->
<%@ include file="feedback/script/feedbackDiv.jsp" %>
<div id="toTop" class="anim"><img src="${pageContext.request.contextPath}/img/ico_scroll_top.png" alt="Scroll to top" ><span class="scroll anim">To top </span></div>
<!--Back top jQuery plugin-->
       <script type="text/javascript">
           $(document).ready(function () {
               $(window).scroll(function () {
                   if ($(this).scrollTop() != 0) {
                       $('#toTop').fadeIn();
                   } else {
                       $('#toTop').fadeOut();
                   }
               });

               $('#toTop').click(function () {
                   $('body,html').animate({scrollTop:0}, 800);
               });
           });
       </script>
<!-- End Back top jQuery plugin-->
</body>
</html>
