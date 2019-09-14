package kr.co.eun.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.eun.common.DBUtil;
import kr.co.eun.vo.DemandVO;
import kr.co.eun.vo.DreplyVO;

@Repository
public class DemandDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	public List<DemandVO> getList(int start,int end,String type)
	{
		List<DemandVO> list = new ArrayList<>();
		conn = DBUtil.getConncetion();
		sql = "SELECT * FROM (SELECT rownum as rnum,no,title,type,writer,regdate,count FROM demand order by regdate DESC) b WHERE b.type= ? and b.rnum BETWEEN ? AND ?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setInt(2,start);
			pstmt.setInt(3,end);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				DemandVO vo = new DemandVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setCount(rs.getInt("count"));
				list.add(vo);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public void insertBoard(DemandVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "insert into demand(no,type,title,content,regdate,writer,id) values(SEQ_DEMAND_NO.nextval,?,?,?,sysdate,?,?)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getType());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setString(4,vo.getWriter());
			pstmt.setString(5,vo.getId());
			
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("글 등록 성공");
			}
			else
			{
				System.out.println("글 등록 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public DemandVO getBoard(int no)
	{
		DemandVO vo = new DemandVO();
		conn = DBUtil.getConncetion();
		sql = "select * from demand where no = ?";

		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setLikes(rs.getInt("likes"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setCount(rs.getInt("count"));
				vo.setId(rs.getString("id"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	public int getCount(String type)
	{
		int total=0;
		conn = DBUtil.getConncetion();
		sql = "select count(no) from demand where type=?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,type);
			rs = pstmt.executeQuery();
			if(rs.next())
				total = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return total;
	}
	
	public void updateBoard(DemandVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "update demand set type=?, title=?, content=? where no=?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getType());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setInt(4,vo.getNo());
			
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("글 수정 성공");
			}
			else
			{
				System.out.println("글 수정 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void deleteBoard(int no)
	{
		conn = DBUtil.getConncetion();
		sql = "delete from demand where no = ?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("글 삭제 성공");
			}
			else
			{
				System.out.println("글 삭제 실패");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void upCount(int no)
	{
		conn = DBUtil.getConncetion();
		sql = "update demand set count=count+1 where no=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,no);
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("조회수 수정 성공");
			}
			else
			{
				System.out.println("수정 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void upLike(int no,int likes)
	{
		conn = DBUtil.getConncetion();
		sql = "update demand set likes=? where no=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,likes);
			pstmt.setInt(2,no);
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("하트 수정 성공");
			}
			else
			{
				System.out.println("수정 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void addLike(int no,String id)
	{
		conn = DBUtil.getConncetion();
		sql = "insert into dlike(no,id,dno,flag) values(SEQ_DLIKE_NO.nextval,?,?,'Y')";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setInt(2,no);
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("삽입 성공");
			}
			else
			{
				System.out.println("삽입 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public String getLike(String id,int no)
	{
		String flag = "";
		conn = DBUtil.getConncetion();
		sql = "select flag from dlike where id=? and dno=?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setInt(2,no);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = rs.getString("flag");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return flag;
	}
	
	public List<DreplyVO> getreplyList(int pno)
	{
		List<DreplyVO> list = new ArrayList<>();
		conn = DBUtil.getConncetion();
		sql="select * from dreply where pno=? order by regdate";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,pno);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				DreplyVO vo = new DreplyVO();
				vo.setNo(rs.getInt("no"));
				vo.setPno(rs.getInt("pno"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setId(rs.getString("id"));
				list.add(vo);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	
	public void insertreply(DreplyVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "insert into dreply(no,pno,content,regdate,writer,id) values(SEQ_DREPLY_NO.nextval,?,?,sysdate,?,?)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getPno());
			pstmt.setString(2,vo.getContent());
			pstmt.setString(3,vo.getWriter());
			pstmt.setString(4,vo.getId());
			
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("글 등록 성공");
			}
			else
			{
				System.out.println("글 등록 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
	
	public void deletereply(int no)
	{
		conn = DBUtil.getConncetion();
		sql = "delete from dreply where no = ?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("글 삭제 성공");
			}
			else
			{
				System.out.println("글 삭제 실패");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}
}
