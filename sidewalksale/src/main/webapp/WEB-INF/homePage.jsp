<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" type="text/css" href="/css/dashboard.css">
</head>
<body>
    <div class="header">
		<a href="/sidewalk-sale"><button>ON SALE NOW</button></a>
		<a href="/#"><button>ADD LISTING</button></a>
		<h2 style="font-size: 35px">Sidewalk.<span class="dandelion"><em>Sale</em></span></h2>
		<a href="/#"><button>SAVED LISTINGS</button></a>
		<a href="/login"><button>ACCOUNT</button></a>
	</div>
	<h1>Welcome Page <c:out value="${currentUser.email}"></c:out></h1>
    
	<c:if test="${userLocation == null}">
		<div>
			<h3>Sidewalk Sale requires location to show you items listed in your area.
			Please click Accept to continue. Thank you</h3>
			<form id="ipForm" action="/location" method="POST">
        		<input type="hidden" name = "ipAddress" id = "ip"/>
        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		<input type="submit" name="submit" value="Accept" /> 
    		</form>
		</div>
	</c:if>
	<div class="container">
    	<div class="description">
	    	<p>Welcome to <strong>Sidewalk Sale</strong>. I'd like this area to welcome the user by their first name if logged in 
	    	and display a logout button if they're logged in. otherwise, show: The items you are seeing are available in your area</p>
	    	<form id="logoutForm" method="POST" action="/logout">
       			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		<input type="submit" value="Logout!" />
    		</form>
	    </div>
		<div class="items">
			<div class="itemCard">
				<a href="/sidewalk-sale/details">
					<img alt="couch" src="<c:url value="/image/couch.jpeg"/>">
				</a>
				<p>Couch</p>
				<p>$300</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
					<img alt="lamp" src="<c:url value="/image/lamp.jpeg"/>">
				<p>Lamp</p>
				<p>$50</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="chair" src="<c:url value="/image/chair.jpeg"/>">
				<p>Chair</p>
				<p>$500</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="lamp" src="<c:url value="/image/lamp.jpeg"/>">
				<p>Lamp</p>
				<p>$50</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="couch" src="<c:url value="/image/couch.jpeg"/>">
				<p>Couch</p>
				<p>$300</p>
				<button class="yellowButton">Save</button>
			</div>
			<div class="itemCard">
				<img alt="chair" src="<c:url value="/image/chair.jpeg"/>">
				<p>Chair</p>
				<p>$500</p>
				<button class="yellowButton">Save</button>
			</div>
		</div>
		
    </div>
    <script src
   ="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
  
<script type="text/javascript">
    $(document).ready (function () {
        $.getJSON( "https://api.ipify.org?format=json", 
          function( data ) {
             console.log(data);
             $("#ip").val(data.ip) ;
        });
    });
</script>
    
</body>
</html>