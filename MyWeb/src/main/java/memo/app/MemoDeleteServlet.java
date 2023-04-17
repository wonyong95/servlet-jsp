package memo.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MemoDelete")
public class MemoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out=res.getWriter();
//		[3] 삭제할 글 번호 받기
		String noStr=req.getParameter("no");
//
//		[3_2] 유효성 체크 =>redirect로 MemoList로 이동시키기
		if(noStr==null||noStr.trim().equals("")) {
			res.sendRedirect("MemoList");
			return;
		}
		int no=Integer.parseInt(noStr.trim());
//
//		[4] MemoDAO생성해서 deleteMemo(글번호)
		MemoDAO dao=new MemoDAO();//Ctrl+Shift+O
		try {
			int n=dao.deleteMemo(no);
	//		[5] 그 실행 결과 메시지 처리
	//	    이동 경로 처리 => MemoList로 이동
			String str=(n>0)?"글 삭제 성공":"글 삭제 실패";
			String loc="MemoList";
			out.println("<script>");
			out.println("alert('"+str+"');");
			out.println("location.href='"+loc+"';");
			out.println("</script>");
		}catch(SQLException e) {
			e.printStackTrace();
			out.println("Error: "+e.getMessage()+"<br>");
		}
//

		out.close();
	}

}


