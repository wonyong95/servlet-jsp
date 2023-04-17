package user.model;
import java.sql.*;
import java.util.*;

import common.util.DBUtil;
public class UserDAO {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserDAO() {
		System.out.println("UserDAO()생성자...");
	}//------------------------------
	
	public  boolean idCheck(String userid) throws SQLException{
		try {
			con=DBUtil.getCon();
			String sql="select idx from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			//결과는 있으면 1개 레코드를 반환, 없으면x
			boolean b= rs.next();
//			if(b)
//				return false;//이미 사용중
//			else
//				return true;//사용가능
			return !b;
		}finally {
			close();
		}
	}//----------------------------
	
	public int insertUser(UserVO user) throws SQLException{
		try {
			con=DBUtil.getCon();
			StringBuilder buf=new StringBuilder("insert into member(");
				buf.append(" idx,name,userid,pwd,hp1,hp2,hp3,")
				   .append(" post, addr1, addr2) values(")
				   .append(" member_seq.nextval,?,?,?,?,?,?,?,?,?)");
			String sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setString(2,user.getUserid());
			ps.setString(3,user.getPwd());
			ps.setString(4,user.getHp1());
			ps.setString(5,user.getHp2());
			ps.setString(6,user.getHp3());
			ps.setString(7, user.getPost());
			ps.setString(8, user.getAddr1());
			ps.setString(9, user.getAddr2());
			return ps.executeUpdate();
		}finally {
			close();
		}
	}//------------------------------
	
	public List<UserVO> listUser() throws SQLException{
		try {
			con=DBUtil.getCon();
			StringBuilder buf=new StringBuilder("select member.*, ")
					.append(" decode(mstate,0,'활동회원',-1,'정지회원',-2,'탈퇴회원',9,'관리자') mstateStr ")
					.append(" from member order by idx desc");			
			//String sql="select * from member order by idx desc";
			String sql=buf.toString();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			return makeList(rs);
		}finally {
			close();
		}
	}//-------------------------------
	public List<UserVO> makeList(ResultSet rs) throws SQLException{
		List<UserVO> arr=new ArrayList<>();
		while(rs.next()) {
			int idx=rs.getInt("idx");
			String name=rs.getString("name");
			String userid=rs.getString("userid");
			String pwd=rs.getString("pwd");
			String hp1=rs.getString("hp1");
			String hp2=rs.getString("hp2");
			String hp3=rs.getString("hp3");
			
			String post=rs.getString("post");
			String addr1=rs.getString("addr1");
			String addr2=rs.getString("addr2");
			java.sql.Date indate=rs.getDate("indate");
			int mileage=rs.getInt("mileage");
			int mstate=rs.getInt("mstate");
			String mstateStr=rs.getString("mstateStr");
			UserVO user=new UserVO(idx,name,userid,pwd,hp1,hp2,hp3,post,addr1,addr2,indate,mileage,mstate,mstateStr);
			arr.add(user);
		}//while
		return arr;
	}//-----------------------------------
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//-------------------------

}////////////////////////////////////////