<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/top.jsp"/>
    
    <div class="container">
    	<h1>request의 주요 메서드</h1>
    <%
    	String server=request.getServerName();//서버 도메인명
    	int port=request.getServerPort();//서버에서 열어둔 포트번호
    	StringBuffer buf=request.getRequestURL();//전체 URL을 반환
    	String url=buf.toString();   	
    
    %>
    <h2>서버 도메인명:<%=server%></h2>
    <h2>서버 포트번호:<%=port%></h2>
    <h2>요청 URL   :<%=url%></h2>
    </div>
<jsp:include page="/foot.jsp"/>    
    