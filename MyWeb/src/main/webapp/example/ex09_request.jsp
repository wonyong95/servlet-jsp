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
    	String uri=request.getRequestURI();
    	//uri=>컨텍스트명 이후 경로를 반환
    	//Myweb/example/ex09_request.jsp
    	String ctx=request.getContextPath();//"/MyWeb"
    	String qStr=request.getQueryString();//query string을반환
    	String clientIp=request.getRemoteAddr();//client ip주소를 반환
    	
    	//실습: uri문자열에서 "/example/ex02_request.jsp"문자열을 추출해서 출력하세요
    	String uri_1=uri.substring(ctx.length());
    	//실습: uri문자열에서 "/example/ex02_request"문자열을 추출해서 출력하세요
    	String uri_2=uri_1.replace(".jsp","");
    	/*
    	if(exe2.equals("example/ex01")){
    		//ex01.jsp로 페이지이동
    	}*/
    	
    	String path=request.getServletPath();//컨텍스트명을 포함하지 않는 경로 문자열을 반환
    	//"/"example/ex09_request.jsp"
    	String proto=request.getProtocol();
    	
    	int index=path.lastIndexOf(".jspx");
    	//검색한 문자열을 뒤에서 부터 찾아서 해당 인덱스 번호를 반환한다. 검색결과 없으면 -1을 반환한다
    	System.out.println(index);
    	if(index>0){
    		//path=path.substring(0,index);
    	}
    %>
    <h2>서버 도메인명:<%=server%></h2>
    <h2>서버 포트번호:<%=port%></h2>
    <h2>요청 URL   :<%=url%></h2>
    <h2>요청 URI   : <%=uri %></h2>
    <h2>컨텍스트명  : <%=ctx %></h2>
    <h2>쿼리 스트링 : <%=qStr %></h2>
    <h2>클라이언트 IP: <%=clientIp %></h2>
    <h2>프로토콜   : <%=proto %></h2>
    <h2>서블릿 패스   : <%=path %></h2>
    <h2><%=uri_2%></h2>
    </div>
<jsp:include page="/foot.jsp"/>    
    