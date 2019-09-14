package kr.co.eun.controller;

import java.io.PrintWriter;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.eun.dao.MemberDAO;
import kr.co.eun.vo.MemberVO;



@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;

	@RequestMapping("/index.eun")
	public String indexmain()
	{
		return "index";
	}
	@RequestMapping("/login.eun")
	public String login()
	{
		return "member/login";
	}
	@RequestMapping("/loginproc.eun")
	public String loginproc(HttpServletRequest request,HttpSession session) 
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO vo = dao.getMember(id);
		if (vo != null) {
			if (pw.equals(vo.getPw())) {
				session.setAttribute("id", id);
				session.setAttribute("name", vo.getName());
				return "redirect:/index.eun";
			} else {
				String msg = "비밀번호가 일치하지 않습니다";
				session.setAttribute("msg", msg);
				return "redirect:/login.eun";
			}
		} else {
			String msg = "회원이 아니시거나 아이디가 일치하지 않습니다";
			session.setAttribute("msg", msg);
			return "redirect:/login.eun";
		}
	}
	@RequestMapping("/logout.eun")
	public String logout()
	{
		return "member/logout";
	}
	@RequestMapping("/signup.eun")
	public String signup()
	{
		return "member/signup";
	}
	@RequestMapping("/signproc.eun")
	public String signproc(MemberVO vo)
	{
		dao = new MemberDAO();
		dao.addMember(vo);
		return "redirect:/login.eun";
	}
	@RequestMapping("/email.eun")
	public ModelAndView email(HttpServletResponse response,HttpServletRequest request) throws Exception
	{
		String email = request.getParameter("email");
		String authNum = "";
		authNum = RandomNum();
		sendEmail(email,authNum);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/email");
		mv.addObject("email",email);
		mv.addObject("authNum", authNum);
		
		return mv;
	}
	private void sendEmail(String email,String authNum)
	{
		String host = "smtp.gmail.com";
		String subject = "ShipGet 인증번호 전달";
		String fromName = "ShipGet 관리자";
		String from = "shipget0401@gmail.com";
		String to1 = email;
		
		String content = "인증번호 [ "+ authNum + " ]";
		try
		{
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol","smtp");
			props.put("mail.smtp.host",host);
			props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port","465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth","true");
			
			Session mailSession = Session.getInstance(props,new javax.mail.Authenticator(){
				protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
					return new javax.mail.PasswordAuthentication(from, "capstone17");
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content,"text/html;charset=euc-kr");
			Transport.send(msg);
		}
		catch (MessagingException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String RandomNum()
	{
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<=6;i++)
		{
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	@RequestMapping("/idcheck.eun")
	public void idcheck(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception
	{
		PrintWriter out = response.getWriter();
		try
		{
			 String paramId = (request.getParameter("prmId") == null) ? "" : String.valueOf(request.getParameter("prmId"));
			 int chkPoint = dao.idcheck(paramId.trim());
			 
			 out.print(chkPoint);
			 out.flush();
			 out.close();
		}
		catch (Exception e) 
		{
			   e.printStackTrace();
			   out.print("1");
		}
	}
	
	@RequestMapping("/jusoPopup.eun")
	public String jusopopup()
	{
		return "member/jusoPopup";
	}
	
	@RequestMapping("/findid.eun")
	public String findid()
	{
		return "member/findid";
	}
	
	@RequestMapping("/findidproc.eun")
	public String findidproc()
	{
		return "member/findidproc";
	}
	@RequestMapping("/findpw.eun")
	public String findpw()
	{
		return "member/findpw";
	}
	
	@RequestMapping("/findpwproc.eun")
	public String findpwproc()
	{
		return "member/findpwproc";
	}
}
