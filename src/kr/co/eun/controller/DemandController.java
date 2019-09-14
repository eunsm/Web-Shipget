package kr.co.eun.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.eun.dao.DemandDAO;
import kr.co.eun.vo.DemandVO;
import kr.co.eun.vo.DreplyVO;

@Controller
public class DemandController {

	@Autowired
	DemandDAO dao;
	
	@RequestMapping("/Beauty.eun")
	public String beauty()
	{
		return "demand/Beauty";
	}
	@RequestMapping("/write.eun")
	public String write()
	{
		return "demand/write";
	}
	@RequestMapping("/writeproc.eun")
	public String writeproc(DemandVO vo)
	{
		dao.insertBoard(vo);
		String type = vo.getType();
		
		return "redirect:/"+type+".eun";
	}
	@RequestMapping("/read.eun")
	public String read()
	{
		return "demand/read";
	}
	@RequestMapping("/update.eun")
	public String update()
	{
		return "demand/update";
	}
	@RequestMapping("/updateproc.eun")
	public String updateproc(DemandVO vo,HttpServletRequest request)
	{
		dao.updateBoard(vo);
		
		int no = Integer.parseInt(request.getParameter("no"));
		String nowPage = request.getParameter("nowPage");
		String type=vo.getType();
		
		return "redirect:/read.eun?no="+no+"&nowPage="+nowPage+"&type="+type;
	}
	@RequestMapping("/delete.eun")
	public String delete(HttpServletRequest request)
	{
		int no = Integer.parseInt(request.getParameter("no"));
		String type = request.getParameter("type");
		dao.deleteBoard(no);
		
		return "redirect:/"+type+".eun";
	}
	@RequestMapping("/uplike.eun")
	public void uplike(HttpServletRequest request,HttpServletResponse response,HttpSession session)throws Exception
	{
		PrintWriter out = response.getWriter();
		try
		{
			int like = Integer.parseInt(request.getParameter("like"));
			int no = Integer.parseInt(request.getParameter("no"));
			like=like+1;
			dao.upLike(no, like);
			
			String id = (String)session.getAttribute("id");
			dao.addLike(no, id);
			
			out.print(like);
			out.flush();
			out.close();
		}
		catch (Exception e) 
		{
			   e.printStackTrace();
			   out.print("1");
		}
	}
	@RequestMapping("/replyproc.eun")
	public String replyproc(HttpServletRequest request,DreplyVO vo)
	{
		int no = Integer.parseInt(request.getParameter("no"));
		String nowPage = request.getParameter("nowPage");
		String type = request.getParameter("type");
		
		dao.insertreply(vo);
		
		return "redirect:/read.eun?no="+no+"&nowPage="+nowPage+"&type="+type+"#start";
	}
	@RequestMapping("/replydelete.eun")
	public String replydelete(HttpServletRequest request)
	{
		int reno = Integer.parseInt(request.getParameter("reno"));
		System.out.println(reno);
		String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));
		String nowPage = request.getParameter("nowPage");
		
		dao.deletereply(reno);
		
		return "redirect:/read.eun?no="+no+"&nowPage="+nowPage+"&type="+type+"#end";
	}
	@RequestMapping("/file_upload.eun")
	public void file_upload(HttpServletRequest request, HttpServletResponse response)
	{
		try { 
			//파일정보 
			String sFileInfo = ""; 
			//파일명을 받는다 - 일반 원본파일명 
			String filename = request.getHeader("file-name"); 
			//파일 확장자
			String filename_ext = filename.substring(filename.lastIndexOf(".")+1); 
			//확장자를소문자로 변경 
			filename_ext = filename_ext.toLowerCase(); 
			//이미지 검증 배열변수 
			String[] allow_file = {"jpg","png","bmp","gif"}; 
			//돌리면서 확장자가 이미지인지 
			int cnt = 0; 
			for(int i=0; i<allow_file.length; i++) 
			{ 
				if(filename_ext.equals(allow_file[i])){ 
					cnt++; 
				} 
			}
			//이미지가 아님 
			if(cnt == 0) { 
				PrintWriter print = response.getWriter(); 
				print.print("NOTALLOW_"+filename); 
				print.flush(); 
				print.close(); 
			} else { 
				//이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
				//파일 기본경로 
				String dftFilePath = request.getSession().getServletContext().getRealPath("/"); 
				//파일 기본경로 _ 상세경로 
				String filePath = dftFilePath + File.separator +"upload" + File.separator; 
				File file = new File(filePath); 
				if(!file.exists()) { 
					file.mkdirs(); 
				}
				String realFileNm = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss"); 
				String today= formatter.format(new java.util.Date()); 
				realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf(".")); 
				String rlFileNm = filePath + realFileNm; 
				///////////////// 서버에 파일쓰기 ///////////////// 
				InputStream is = request.getInputStream(); 
				OutputStream os=new FileOutputStream(rlFileNm); 
				int numRead; 
				byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))]; 
				while((numRead = is.read(b,0,b.length)) != -1){ 
					os.write(b,0,numRead); 
				} 
				if(is != null) { 
					is.close(); 
				} 
				os.flush(); 
				os.close();
				///////////////// 서버에 파일쓰기 ///////////////// 
				// 정보 출력 
				sFileInfo += "&bNewLine=true"; 
				// img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함 
				sFileInfo += "&sFileName="+ filename;; 
				sFileInfo += "&sFileURL="+"/upload/"+realFileNm; 
				PrintWriter print = response.getWriter(); 
				print.print(sFileInfo); 
				print.flush(); 
				print.close(); 		
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}
	@RequestMapping("/Book&Music.eun")
	public String bm()
	{
		return "demand/Book&Music";
	}
	@RequestMapping("/Electronic equipment.eun")
	public String Electronic()
	{
		return "demand/Electronic equipment";
	}
	@RequestMapping("/Fashion.eun")
	public String Fashion()
	{
		return "demand/Fashion";
	}
	@RequestMapping("/Game&Toy.eun")
	public String Game()
	{
		return "demand/Game&Toy";
	}
	@RequestMapping("/Living.eun")
	public String Living()
	{
		return "demand/Living";
	}
	@RequestMapping("/ETC.eun")
	public String ETC()
	{
		return "demand/ETC";
	}
	
}
