<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="user.model.*,java.util.*"   %>

<jsp:include page="/top.jsp"/>
<%-- <jsp:useBean id="user" class="user.model.UserVO" scope="application" /> --%>
    <div class="container">
    	<h1>회원 목록 페이지 [Admin Page]</h1>
    	<table id="userTable" border="1">
    		<tr>
    			<th class="m3">번호</th>
    			<th class="m3">이름</th>
    			<th class="m3">아이디</th>
    			<th class="m3">연락처</th>
    			<th class="m3">회원상태</th>
    			<th class="m3">수정|삭제</th>
    		</tr>
    		<!-- --------------- -->
    		<jsp:useBean id="userDAO" class="user.model.UserDAO" scope="session" />
    		<%
    			//UserDAO userDao=new UserDAO();
    			List<UserVO> arr=userDAO.listUser();
    			if(arr==null||arr.size()==0){
    				out.println("<tr><td colspan='6'>데이터가 없습니다</td></tr>");
    			}else{
 					for(UserVO vo:arr){   			
    		%>
			    		<tr>
			    			<td><%=vo.getIdx()%></td>
			    			<td><%=vo.getName()%></td>
			    			<td><%=vo.getUserid()%></td>
			    			<td><%=vo.getAllHp()%></td>
			    			<td class="mstate<%=vo.getMstate()%>"><%=vo.getMstateStr()%></td>
			    			<td>
			    			<a href="#" onclick="userEdit('<%=vo.getIdx()%>')">수정</a>|
			    			<a href="javascript:userDel('<%=vo.getIdx()%>')">삭제</a>
			    			</td>
			    		</tr>
    		<% 		}//for-----
    			}//else---------------------
    		%>
    		<!-- --------------- -->
    	</table>
    	<!--  수정 또는 삭제 처리를 위한 form -->
    	<for name="userF" method="post">
    	<!-- hidden field ---------------- -->
    	<input type="hidden" name="idx">
    	<!-- -------------------------------- -->
    	</form>
    </div>
    <script>
    	function userEdit(num){
    		userF.idx.value=num;
    		userF.action='modify.jsp';
    		userF.submit();
    	}
    	function userDel(num){
    		user.idx.value=num;
    		userF.action='delete.jsp';
    		userF.submit();
    	}
    </script>
<jsp:include page="/foot.jsp"/>