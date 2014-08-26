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
    Document   : showFloors
    Created on : Nov 10, 2008, 1:24:13 PM
    Author     : jaroslawwozniak
--%>
<%--
	Edited by: hardimaran
--%>


<%@page pageEncoding="UTF-8"
        import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
            <title><bean:message key="floors" /></title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <script type='text/javascript' src='a.js'></script>
        <script type='text/javascript' src='tableScript.js'></script>
    </head>
    <body>
        <jsp:useBean id="floorId" scope="request" type="java.lang.String" />
        <center>
        <img src="images/logo.gif" alt="Openbravo" class="logo" /><br>
        </center>
        <div>
        <center>
            <form name="FloorForm" method="post" class="pad">
                <html:select property="floorId" value="${floorId}" onchange="saveFloorId(this.value);retrieveURL( 'sec/floorAjaxAction.do?floorId=' + this.value, 'ble');"  >
                    <html:options collection="floors" property="id" labelProperty="name"  />
                </html:select>
            </form>
        
            <div class="pad2">
                <span id="ble">
                    <logic:present name="places">
                            <input type="hidden" name="floorId" value="0" />
                            <% ArrayList places = (ArrayList) request.getSession().getAttribute("places");%>
                            <c:forEach var="place" items="${places}">
                                <c:set var="var" value="false" />
                                <c:forEach var="busy" items="${busy}">
                                    <c:if test="${place.id == busy.id}">
                                        <input type=submit name="id" class="btn btn-lg btn-warning" value="${place.name}" onclick="getLocation('${place.id}');">
                                        <c:set var="var" value="true" />
                                    </c:if>
                                </c:forEach>
                                    <c:if test="${var == false}">
                                       <input type=submit name="id" class="btn btn-lg btn-success" value="${place.name}" onclick="getLocation('${place.id}');">
                                    </c:if>
                               
                            </c:forEach>
                    </logic:present>
                </span>
			</div>
            </center>

        <div class="bottom">
        	<div class="lBottom">
            	<form action="logout.do">
                <input type="submit" class="btn btn-sm btn-danger" id="d" value="Log out" style="width:100px; margin-bottom:20px;">            
				</form>
			</div>
        </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>

</html>
