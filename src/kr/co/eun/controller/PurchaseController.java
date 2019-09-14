package kr.co.eun.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.eun.dao.PurchaseDAO;
import kr.co.eun.vo.PreplyVO;
import kr.co.eun.vo.PurchaseVO;

@Controller
public class PurchaseController {

	@Autowired
	PurchaseDAO dao;
	
	@RequestMapping("/pwrite.eun")
	public String write()
	{
		return "purchase/write";
	}
	@RequestMapping("/pwriteproc.eun")
	public String writeproc(MultipartHttpServletRequest request)
	{
		PurchaseVO vo = new PurchaseVO();
		Map<String, MultipartFile> files = request.getFileMap();
		CommonsMultipartFile cmf = (CommonsMultipartFile)files.get("files");
		UUID uuid = UUID.randomUUID();
		String path = request.getServletContext().getRealPath("/mainimage/")+uuid.toString()+"_"+cmf.getOriginalFilename();
		/*String path = "C:/capstone/workspace/ShipGet/WebContent/mainimage/"+cmf.getOriginalFilename();*/
		File file = new File(path);
		try {
			cmf.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		vo.setFiles("/ShipGet/mainimage/"+uuid.toString()+"_"+cmf.getOriginalFilename());
		vo.setId(request.getParameter("id"));
		vo.setWriter(request.getParameter("writer"));
		vo.setType(request.getParameter("type"));
		vo.setContent(request.getParameter("content"));
		vo.setTitle(request.getParameter("title"));
		vo.setPrice(request.getParameter("price"));
		vo.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		vo.setEnddate(request.getParameter("enddate"));
		dao.insertBoard(vo);
		String type = vo.getType();
		return "redirect:/"+type+".eun";
	}
	@RequestMapping("/pBeauty.eun")
	public String beauty()
	{
		return "purchase/Beauty";
	}
	@RequestMapping("/pread.eun")
	public String read()
	{
		return "purchase/read";
	}
	@RequestMapping("/preplydelete.eun")
	public void preplydelete(HttpServletRequest request,HttpServletResponse response)
	{
		String reno = request.getParameter("reno");
		System.out.println(reno);
		/*String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));
		String nowPage = request.getParameter("nowPage");*/
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");
		try
		{
			boolean flag = dao.deletereply(reno);
			if(!flag)
				response.getWriter().print(mapper.writeValueAsString("Fail"));
			else
				response.getWriter().print(mapper.writeValueAsString("OK"));
		}
		catch (IOException ex) {
            System.out.println("오류: 댓글 삭제에 문제가 발생했습니다.");
        }
			/*return "purchase/replydelfail";
		return "redirect:/read.eun?no="+no+"&nowPage="+nowPage+"&type="+type;*/
	}
	@RequestMapping("/preplyproc.eun")
	public void preplysubmit(HttpServletResponse response,PreplyVO vo)
	{
		ObjectMapper mapper = new ObjectMapper();
		response.setContentType("application/json;charset=UTF-8");
		dao.insertreply(vo);
		try
		{
			response.getWriter().print(mapper.writeValueAsString(vo.getReno()));
		}
		catch (IOException ex) {
            System.out.println("오류: 댓글 저장에 문제가 발생했습니다.");
        }
	}
	@RequestMapping("/preplyreplysave.eun")
	public String replyreply(PreplyVO vo,ModelMap modelmap)
	{
		dao.insertreply(vo);
		modelmap.addAttribute("replyreply",vo);
		return "purchase/replyreply";
	}
	@RequestMapping("/purchaseform.eun")
	public String purchaseform()
	{
		return "purchase/purchaseform";
	}
	@RequestMapping("/pupdate.eun")
	public String update()
	{
		return "purchase/update";
	}
	@RequestMapping("/pupdateproc.eun")
	public String updateproc(PurchaseVO vo,HttpServletRequest request)
	{
		return "purchase/read";
	}
	@RequestMapping("/orderlist.eun")
	public String orderlist()
	{
		return "order/orderlist";
	}
}
