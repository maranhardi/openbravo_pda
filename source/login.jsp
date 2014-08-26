<%--
   Openbravo POS is a point of sales application designed for touch screens.
   Copyright (C) 2007-2009 Openbravo, S.L.
   http://sourceforge.net/projects/openbravopos

    This file is part of Openbravo POS.

    Openbravo POS is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Openbravo POS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Openbravo POS.  If not, see <http://www.gnu.org/licenses/>.
 --%>
<%--
	Edited by: hardimaran
--%>

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="utf8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name = "viewport" content="width=device-width, initial-scale=1">
    <title><bean:message key="welcome.title"/></title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/bootstrap-theme.css" rel="stylesheet">
</head>
<body>
    <center>
    	<img src="images/logo.gif" alt="Openbravo" /><br><br>
    </center>
    <logic:messagesPresent >
            <html:messages id="msg">
                <p>
                    <strong><center><font color="red" size="-1"><bean:write name="msg" /></font></center></strong>
                </p>
            </html:messages>
        </logic:messagesPresent>
    <div class="container">
	<form class="form-signin" role="form" action="login.do" method="post">
    	<h2 class="form-signin-heading">Please log in</h2>
    	<input type="username" class="form-control" name="login" placeholder="Username" required autofocus>
    	<input type="password" class="form-control" name="password" placeholder="Password">
    	<button class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
    </form>
	</div>
		
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
