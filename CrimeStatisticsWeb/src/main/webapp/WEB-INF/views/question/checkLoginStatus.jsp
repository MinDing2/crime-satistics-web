<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String memberid = (String) session.getAttribute("memberid");
boolean loggedIn = (memberid != null);
String responseJSON = "{\"loggedIn\": " + loggedIn + "}";

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(responseJSON);
%>