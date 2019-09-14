package kr.co.eun.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLSyntaxErrorException;

public class DBUtil {
	
	public static Connection getConncetion()
	{
		Connection conn = null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
			conn = DriverManager.getConnection(url, "eun", "saem");
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("드라이버 파일이 없습니다.");
		}
		catch(SQLSyntaxErrorException e)
		{
			System.out.println("url 문법이 잘못되었습니다.");
		}
		catch(SQLException e)
		{
			System.out.println("DB 접속정보가 올바르지 않습니다.");
		}
		
		return conn;
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs){
		if(rs != null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		close(conn, pstmt);
	}
	
	//close
	public static void close(Connection conn, PreparedStatement pstmt ){
		//2. 선언한 객체를 닫는다. 
		if(pstmt != null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
