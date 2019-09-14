package kr.co.eun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import kr.co.eun.common.DBUtil;
import kr.co.eun.vo.MemberVO;

@Repository
public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public MemberVO getMember(String id)
	{
		MemberVO vo = null;
		conn = DBUtil.getConncetion();
		sql = "select * from member where id=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setZipNo(rs.getString("zipNo"));
				vo.setAddress1(rs.getString("address1"));
				vo.setAddrdetail(rs.getString("addrdetail"));
				vo.setAddress2(rs.getString("address2"));
				vo.setEmail(rs.getString("email"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public void addMember(MemberVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "insert into member(id,pw,name,phone,zipno,address1,addrdetail,address2,email) values(?,?,?,?,?,?,?,?,?)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getId());
			pstmt.setString(2,vo.getPw());
			pstmt.setString(3,vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5,vo.getZipNo());
			pstmt.setString(6, vo.getAddress1());
			pstmt.setString(7,vo.getAddrdetail());
			pstmt.setString(8,vo.getAddress2());
			pstmt.setString(9,vo.getEmail());
			
			int result = pstmt.executeUpdate();
			if(result>0)
				System.out.println("회원가입 성공");
			else
				System.out.println("회원가입 실패");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void updateMember(MemberVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "update member set pw=?,phone=?,zipno=?,address1=?,addrdetail=?,address2=?,email=? where id=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPw());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3,vo.getZipNo());
			pstmt.setString(4, vo.getAddress1());
			pstmt.setString(5,vo.getAddrdetail());
			pstmt.setString(6,vo.getAddress2());
			pstmt.setString(7,vo.getEmail());
			pstmt.setString(8,vo.getId());
			
			int result = pstmt.executeUpdate();
			if(result>0)
				System.out.println("수정 성공");
			else
				System.out.println("수정 실패");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void deleteMember(String id)
	{
		conn = DBUtil.getConncetion();
		sql = "delete member where id=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			int result = pstmt.executeUpdate();
			if(result>0)
				System.out.println("탈퇴 성공");
			else
				System.out.println("탈퇴 실패");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public String findid(String name,String phone,String email)
	{
		conn = DBUtil.getConncetion();
		sql = "select id from member where name=? and phone=? and email=?";
		String id = "";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,phone);
			pstmt.setString(3,email);
			rs = pstmt.executeQuery();
			if(rs.next())
				id = rs.getString(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return id;
	}
	
	public int idcheck(String id)
	{
		conn = DBUtil.getConncetion();
		sql = "select count(*) as cnt from member where id=?";
		int cnt = 0;
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next())
				cnt = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return cnt;
	}
}
