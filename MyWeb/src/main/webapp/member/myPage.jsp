<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="user.model.UserVO" scope="application" />
<h1>MyPage- [<%=user.getName()%>]</h1>
<h2>아이디: <%=user.getUserid()%></h2>
<h2>주 소: <%=user.getAllAddr()%></h2>