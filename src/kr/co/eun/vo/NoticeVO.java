package kr.co.eun.vo;

public class NoticeVO {
	private int no;
	private String content;
	private String regdate;
	private String category;
	private int readno;
	private String readtype;
	private String sender;
	private String receiver;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getReadno() {
		return readno;
	}
	public void setReadno(int readno) {
		this.readno = readno;
	}
	public String getReadtype() {
		return readtype;
	}
	public void setReadtype(String readtype) {
		this.readtype = readtype;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
}
