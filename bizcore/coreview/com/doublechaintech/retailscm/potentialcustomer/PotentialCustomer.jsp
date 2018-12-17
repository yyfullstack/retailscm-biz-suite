<%@ page import='java.util.*,com.doublechaintech.retailscm.*,com.doublechaintech.retailscm.potentialcustomer.PotentialCustomer'%>

<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sky" tagdir="/tags"%>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<!DOCTYPE html>
<html lang="en" slick-uniqueid="3"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="${baseURL}/" />    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
   
    <title>  ${userContext.localeMap['@system_name']} </title>

    <!-- Bootstrap core CSS -->
    <link href="./bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="./bootstrap/ie10-viewport-bug-workaround.css" rel="stylesheet">
 	<link href="./bootstrap/jquery-ui.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./bootstrap/dashboard.css" rel="stylesheet">
    <link href="./bootstrap/font-awesome.min.css" rel="stylesheet">
   
   

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./bootstrap/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 <style type="text/css">* {
 text-shadow: transparent 0px 0px 0px, rgba(0,0,0,0.68) 0px 0px 0px !important; 
}

</style>


</head>

  <body >


    <div class="container-fluid">
      <div class="row">
      
        <div class="col-xs-12 col-sm-12  col-md-12  main">
          
          <div class="table-responsive" id="content">
          <!-- real content -->

<c:set var="ownerBeanName" value="potentialCustomer" scope="request"/>
<c:set var="ownerClassName" value="PotentialCustomer" scope="request"/>




<div id="msg"></div>

<div class="row">

	<div class="col-xs-12 col-md-12">
			    <c:if test="${not empty result.errorMessageList}" >
    <ul>
    	<c:forEach var="item" items="${result.errorMessageList}">
    		
    		<div class="alert alert-success">
   ${item.sourcePosition} ${item.body}
</div>
    	</c:forEach>
    	</ul>
    </c:if>
</div>



</div> <!--<div class="row">-->

<div class="row">
	
</div>

<div class="row">
	
	<div class="col-xs-12 col-md-12">

	<ul class="nav nav-tabs" id="navi-tabs">
	  <li class="active"><a data-toggle="tab" href="#summary" class="disabled"><i class="fa  fa-home"></i> ${userContext.localeMap['@summary']}</a></li>
	 
	<% PotentialCustomer result = (PotentialCustomer)request.getAttribute("result");  %>
			<li><a data-toggle="tab" href="#potentialCustomerContactPersonList" class="disabled"> ${userContext.localeMap['potential_customer_contact_person']}</a></li>
			<li><a data-toggle="tab" href="#potentialCustomerContactList" class="disabled"> ${userContext.localeMap['potential_customer_contact']}</a></li>
			<li><a data-toggle="tab" href="#eventAttendanceList" class="disabled"> ${userContext.localeMap['event_attendance']}</a></li>
 
	</ul>
	</div>
</div>
<div class="tab-content"  id='tab-content'>
<div id="summary" class="tab-pane fade in active">
<div class="row">
	
	<div class="col-xs-12 col-md-12">
	
	</div>
</div>

<div class="row" desc="show parent objects">
	
	   
	<c:set var="potentialCustomer" value="${ result}" scope="request" />
<sky:include page="com/doublechaintech/retailscm/potentialcustomer/PotentialCustomer$Summary.jsp" />

	
</div>

	
	

	<div class="row">
<c:set var="retailStoreCityServiceCenter" value="${ result.cityServiceCenter}" scope="request" />
<sky:include page="com/doublechaintech/retailscm/retailstorecityservicecenter/RetailStoreCityServiceCenter$Info.jsp" />

<c:set var="cityPartner" value="${ result.cityPartner}" scope="request" />
<sky:include page="com/doublechaintech/retailscm/citypartner/CityPartner$Info.jsp" />

</div>








	





	</div><!-- end of <div id="summary" class="tab-pane fade in active">-->

	

		<c:if test='${not empty userContext.accessTokens["potentialCustomerContactPersonList"] or ignoreListAccessControl}'>
		<c:set var="potentialCustomerContactPersonList" value="${result.potentialCustomerContactPersonList}" scope="request"/>
		<c:set var="potentialCustomerContactPersonListName" value="potentialCustomerContactPersonList" scope="request"/>
		<div id="potentialCustomerContactPersonList" class="tab-pane fade sublist" refer-name="potential_customer">
			<sky:include page="com/doublechaintech/retailscm/potentialcustomercontactperson/PotentialCustomerContactPerson$List.jsp"
					referName="potentialCustomer"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["potentialCustomerContactList"] or ignoreListAccessControl}'>
		<c:set var="potentialCustomerContactList" value="${result.potentialCustomerContactList}" scope="request"/>
		<c:set var="potentialCustomerContactListName" value="potentialCustomerContactList" scope="request"/>
		<div id="potentialCustomerContactList" class="tab-pane fade sublist" refer-name="potential_customer">
			<sky:include page="com/doublechaintech/retailscm/potentialcustomercontact/PotentialCustomerContact$List.jsp"
					referName="potentialCustomer"/>
		</div>
	</c:if>
	<c:if test='${not empty userContext.accessTokens["eventAttendanceList"] or ignoreListAccessControl}'>
		<c:set var="eventAttendanceList" value="${result.eventAttendanceList}" scope="request"/>
		<c:set var="eventAttendanceListName" value="eventAttendanceList" scope="request"/>
		<div id="eventAttendanceList" class="tab-pane fade sublist" refer-name="potential_customer">
			<sky:include page="com/doublechaintech/retailscm/eventattendance/EventAttendance$List.jsp"
					referName="potentialCustomer"/>
		</div>
	</c:if>

	

</div><!--<div class="tab-content" style="padding-top: 10px">-->




 <!-- /real content -->
          
          
          </div>
        </div><!--  <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> -->
        </div><!-- <div class="row"> -->
        </div>
        
  
<div id="footer">
  <div class="col-xs-12 navbar-inverse navbar-fixed-bottom">
  <div class="row" id="bottomNav">
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-home"></i><br/>${userContext.localeMap['@home_page']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-envelope"></i><br>${userContext.localeMap['@message']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/home/"><i class="glyphicon glyphicon-envelope"></i><br>${userContext.localeMap['@message']}</a>
    </div>
    <div class="col-xs-3 text-center">
    	<a href="./secUserManager/showlogin/">
    	<i class="glyphicon glyphicon-user"></i><br>${userContext.localeMap['@log_out']}</a>
    </div>
  </div>
  </div>
</div>   <!-- --><!-- /.footer -->
        
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./bootstrap/jquery.min.js"></script>
    <script src="./bootstrap/jquery-ui.min.js"></script>
    
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./bootstrap/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./bootstrap/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./bootstrap/ie10-viewport-bug-workaround.js"></script>
    <script src="./scripts/qrcode.js" type="text/javascript"></script>    
    <script>

 	var qrLocaleLabel = "${userContext.localeMap['@qr_code']}";
 	var scanQRTips = "${userContext.localeMap['@qr_scan_to_continue']}";
 	$("a[data-toggle='tab']").removeClass("disabled");
 	
	
</script>
     <script src="./scripts/common.js" type="text/javascript"></script>
     <script src="./bootstrap/bootstrap3-typeahead.js" type="text/javascript"></script>


</body></html>

