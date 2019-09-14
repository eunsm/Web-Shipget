package kr.co.eun.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.eun.common.DBUtil;
import kr.co.eun.vo.DreplyVO;
import kr.co.eun.vo.PreplyVO;
import kr.co.eun.vo.PurchaseVO;

@Repository
public class PurchaseDAO {
	Connection conn;
	PreparedStatement pstmt,pstmt2;
	ResultSet rs;
	String sql;
	
	public List<PurchaseVO> getList(int start,int end,String type)
	{
		List<PurchaseVO> list = new ArrayList<>();
		conn = DBUtil.getConncetion();
		sql = "SELECT * FROM (SELECT rownum as rnum,no,title,type,writer,files,price,quantity,nowquan,enddate,regdate,count FROM purchase order by regdate DESC) b WHERE b.type= ? and b.rnum BETWEEN ? AND ?";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,type);
			pstmt.setInt(2,start);
			pstmt.setInt(3,end);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				PurchaseVO vo = new PurchaseVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setType(rs.getString("type"));
				vo.setWriter(rs.getString("writer"));
				vo.setFiles(rs.getString("files"));
				vo.setRegdate(rs.getString("regdate"));
				vo.setEnddate(rs.getString("enddate"));
				vo.setPrice(rs.getString("price"));
				vo.setQuantity(rs.getInt("quantity"));
				vo.setNowquan(rs.getInt("nowquan"));
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
	
	public void insertBoard(PurchaseVO vo)
	{
		conn = DBUtil.getConncetion();                                                                               
		sql = "insert into purchase(no,type,title,content,regdate,writer,id,quantity,price,enddate,files) values(SEQ_PURCHASE_NO.nextval,?,?,?,sysdate,?,?,?,?,?,?)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getType());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setString(4,vo.getWriter());
			pstmt.setString(5,vo.getId());
			pstmt.setInt(6,vo.getQuantity());
			pstmt.setString(7,vo.getPrice());
			pstmt.setString(8,vo.getEnddate());
			pstmt.setString(9,vo.getFiles());
			
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
	
	public PurchaseVO getBoard(int no)
	{
		PurchaseVO vo = new PurchaseVO();
		conn = DBUtil.getConncetion();
		sql = "select no,title,type,writer,content,regdate,count,id,enddate,files,TO_CHAR(price,'999,999,999,999,999') as price,quantity,nowquan,bank,accountno from purchase where no = ?";
		
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
				vo.setRegdate(rs.getString("regdate"));
				vo.setCount(rs.getInt("count"));
				vo.setId(rs.getString("id"));
				vo.setEnddate(rs.getString("enddate"));
				vo.setFiles(rs.getString("files"));
				vo.setPrice(rs.getString("price"));
				vo.setQuantity(rs.getInt("quantity"));
				vo.setNowquan(rs.getInt("nowquan"));
				vo.setBank(rs.getString("bank"));
				vo.setAccountno(rs.getString("accountno"));
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
		sql = "select count(no) from purchase where type=?";
		
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
	
	public void updateBoard(PurchaseVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "update purchase set type=?, title=?, content=?,quantity=?,enddate=?,files=? where no=?";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getType());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setInt(4,vo.getQuantity());
			pstmt.setString(5,vo.getEnddate());
			pstmt.setString(6,vo.getFiles());
			pstmt.setInt(7,vo.getNo());
			
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
		sql = "delete from purchase where no = ?";
		
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
		sql = "update purchase set count=count+1 where no=?";
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
	
	public void insertreply(PreplyVO vo)
	{
		conn = DBUtil.getConncetion();
		int order = 0;
		try
		{
			if(vo.getReno()==null||"".equals(vo.getReno()))
			{
				if(vo.getReparent()!=null)
				{
					sql = "select brdno, redepth+1 redepth, reorder from preply where reno=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getReparent());
					rs = pstmt.executeQuery();
					//PreplyVO vo2 = new PreplyVO();
					
					if (rs.next()) {
						vo.setBrdno(rs.getString("brdno"));
						System.out.println("3"+rs.getString("brdno"));
						vo.setRedepth(rs.getString("redepth"));
						System.out.println("33"+rs.getString("redepth"));
						vo.setReorder(rs.getInt("reorder")+1);
						order = rs.getInt("reorder");
						System.out.println("333"+rs.getInt("reorder"));
					}
					/*vo.setBrdno(vo2.getBrdno());
					vo.setRedepth(vo2.getRedepth());
					vo.setReorder(vo2.getReorder()+1);
					System.out.println("22 "+vo2.getReorder());*/
					
					sql = "UPDATE preply SET reorder=reorder+1 WHERE brdno = ? AND reorder >"+order;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getBrdno());
					System.out.println("***"+order);
					//pstmt.setInt(2, order);
					
					int result = pstmt.executeUpdate();
					if (result > 0) {
						System.out.println("댓글1 성공");
					} else {
						System.out.println("댓글1 실패");
					}
				}
				else
				{
					sql = "select nvl(max(reorder),0)+1 from preply where brdno=?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, vo.getBrdno());
					rs = pstmt.executeQuery();
					if (rs.next()) {
						vo.setReorder(rs.getInt(1));
					}
				}
				/*String sql3 = "select nvl(max(reno),0)+1 from preply";
				pstmt = conn.prepareStatement(sql3);
				rs = pstmt.executeQuery();
				String res = "";
				if(rs.next())
					res = rs.getString(1);*/
				String sql4 = "insert into preply(BRDNO, RENO, ID,REWRITER,REMEMO, REDATE, REORDER, REPARENT, REDEPTH)"
							+ "values(?,SEQ_PREPLY_RENO.nextval,?,?,?,sysdate,?,?,?)";
				pstmt = conn.prepareStatement(sql4);
				pstmt.setString(1,vo.getBrdno());
			/*	pstmt.setString(2,res);*/
				pstmt.setString(2,vo.getId());
				pstmt.setString(3,vo.getRewriter());
				pstmt.setString(4,vo.getRememo());
				pstmt.setInt(5,vo.getReorder());
				if(vo.getReparent()==null)
				{
					pstmt.setString(6,vo.getReno());
					pstmt.setString(7,"0");
				}
				else
				{
					pstmt.setString(6,vo.getReparent());
					pstmt.setString(7,vo.getRedepth());
				}
				
				int result2 = pstmt.executeUpdate();
				if (result2 > 0) {
					System.out.println("댓글11 성공");
				} else {
					System.out.println("댓글11 실패");
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
	}
	public boolean deletereply(String reno)
	{
		conn =  DBUtil.getConncetion();
		try
		{
			sql = "select count(*) from preply where reparent=? and reno!=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reno);
			pstmt.setString(2,reno);
			rs = pstmt.executeQuery();
			int result=0;
			if(rs.next())
				result = rs.getInt(1);
			if(result>0)
				return false;
			String sql2 = "delete from preply where reno=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1,reno);
			int res = pstmt.executeUpdate();
			if (res > 0) {
				System.out.println("댓글2 삭제 성공");
			} else {
				System.out.println("댓글2 삭제 실패");
			}		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt, rs);
		}
		return true;
	}
	
	/*public void insertperantreply(PreplyVO vo)
	{
		conn = DBUtil.getConncetion();
		sql = "insert into preply(BRDNO, RENO, ID,REWRITER,REMEMO, REDATE, REORDER, REPARENT, REDEPTH)"
			+ "values(?,SEQ_PREPLY_RENO.nextval,?,?,sysdate,?,?,?)";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getBrdno());
			pstmt.setString(2,vo.getId());
			pstmt.setString(3,vo.getRewriter());
			pstmt.setString(4,vo.getRememo());
			pstmt.setInt(5,vo.getReorder());
			pstmt.setString(6,vo.getReparent());
			pstmt.setString(7,vo.getRedepth());
			int result = pstmt.executeUpdate();
			
			if(result > 0)
			{
				System.out.println("부모 댓글 등록 성공");
			}
			else
			{
				System.out.println("부모 댓글  등록 실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			DBUtil.close(conn, pstmt);
		}
	}*/
	
	public List<PreplyVO> getreplyList(String brdno)
	{
		List<PreplyVO> list = new ArrayList<>();
		conn = DBUtil.getConncetion();
		sql="select * from preply where brdno=? order by reorder";
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,brdno);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				PreplyVO vo = new PreplyVO();
				vo.setBrdno(rs.getString("brdno"));
				vo.setId(rs.getString("id"));
				vo.setRedate(rs.getString("redate"));
				vo.setRedepth(rs.getString("redepth"));
				vo.setRememo(rs.getString("rememo"));
				vo.setReno(rs.getString("reno"));
				vo.setReorder(rs.getInt("reorder"));
				vo.setReparent(rs.getString("reparent"));
				vo.setRewriter(rs.getString("rewriter"));
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
	
}
