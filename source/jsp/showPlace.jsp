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
    Document   : showPlace
    Created on : Nov 11, 2008, 5:38:14 PM
    Author     : jaroslawwozniak
--%>
<%--
	Edited by: hardimaran
--%>

<%@page pageEncoding="UTF-8"
        import="java.util.List, com.openbravo.pos.ticket.ProductInfoExt, com.openbravo.pos.ticket.TicketLineInfo"%>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@ taglib prefix="bean" uri="http://jakarta.apache.org/struts/tags-bean"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/bootstrap-theme.css" rel="stylesheet">
        <script type="text/javascript" src='../tableScript.js'></script>
        <script type="text/javascript" src='../a.js'></script>
        <title><bean:message key="tables" /></title>
     </head>
    <body>
        <div class="logo">
        <center>
        <img src="../images/logo.gif" alt="Openbravo" class="logo" /><br>
        
            <jsp:useBean id="products" type="List<ProductInfoExt>" scope="request" />
            <jsp:useBean id="place" type="java.lang.String" scope="request" />
            <jsp:useBean id="placeName" type="java.lang.String" scope="request" />
            <jsp:useBean id="floorName" type="java.lang.String" scope="request" />
            <jsp:useBean id="floorId" type="java.lang.String" scope="request" />
            <jsp:useBean id="lines" type="List<TicketLineInfo>" scope="request" />
        </center>
        <a href='../showFloors.do?floorId=${floorId}'>${placeName} | Go back</a><br>
        </div>
        
        <div>
        <input name="place" class="btn btn-success" value="Add" type="submit" onclick="window.location='showProducts.do?place=${place}&floorId=${floorId}'" style="width:70px;margin-bottom:15px;margin-left:70%;" class="floor"/>
        <br>
        </div>
        <span class="middle">
            <center>
            <table border="0" id="table" class="pickme">
                <thead>
                    <tr>
                        <th class="name"><bean:message key="item" /></th>
                        <th class="normal"><bean:message key="price" /></th>
                   <!--     <th class="units">#</th>-->
                        <th class="normal"># / <bean:message key="value" /></th>
                        <th class="units"></th>
                        <th class="units"></th>
                       
                </thead>
                <tbody>
                    <span id="products" >
                        <% boolean rowodd = false; %>
                        <c:forEach var="line" items="${lines}" varStatus="nr">
                            <% rowodd = !rowodd; %>
                            <tr id="${nr.count - 1}" class="<%= rowodd ? "odd" : "even" %>">
                                <c:choose>
                                    <c:when test="${products[nr.count - 1].com == true}">
                                        <td class="name">* ${products[nr.count - 1].name}</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="name">${products[nr.count - 1].name}</td>
                                    </c:otherwise>
                                </c:choose>
                                <td class="normal"><fmt:formatNumber type="currency" value="${line.price}" maxFractionDigits="2" minFractionDigits="2"/></td>
                                <td class="normal" id="value${nr.count - 1}"><input type="text" id="input${nr.count - 1}" size="3" onchange="getIndexBackByEditing('${nr.count -1}', '${place}');" value="<fmt:formatNumber type="number" value="${line.multiply}" maxFractionDigits="2" minFractionDigits="0"/>" /> <fmt:formatNumber type="currency" value="${line.value}" maxFractionDigits="2" minFractionDigits="2"/></td>
                                <td><input type="button" value="+" class="btn btn-success" class="bTest" style="height:35px; width:35px;" onclick="ajaxCall(3, '${place}', '${nr.count - 1}');"></td>
                                <td><input type="button" value="-" class="btn btn-success" class="bTest" style="height:35px; width:35px;" onclick="ajaxCall(1, '${place}', '${nr.count - 1}');"></td>
                            </tr>
                        </c:forEach>
                    </span>

                </tbody>
            </table>
            </center>
        
            <p class="total" id="atotal">Total: <fmt:formatNumber type="currency" value="${total}" maxFractionDigits="2" minFractionDigits="2" /> </p>
            <input name="place" value="Add" class="btn btn-success" type="submit" onclick="window.location='showProducts.do?place=${place}&floorId=${floorId}'" style="width:70px;margin-bottom:15px;margin-left:70%;" class="floor" /><br />
            <input name="delete" value="Delete" class="btn btn-danger" type="submit" onclick="confirmDeleting('${floorId}', '${place}');" style="width:70px; max-width:100%; margin:0px 0px 10px 10px;"class="floor" />  
        </span>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
	<script src="../js/bootstrap.js"></script>
    </body>
</html>
