package kr.co.eun.vo;

public class PreplyVO {
	private String brdno;
	private String reno;
	private String rewriter;
/*	private String redeleteflag;*/
    private String rememo;
    private String redate;
    private String reparent;
    private String redepth;
    private int reorder;
    private String id;
    
	public String getBrdno() {
		return brdno;
	}
	public void setBrdno(String brdno) {
		this.brdno = brdno;
	}
	public String getReno() {
		return reno;
	}
	public void setReno(String reno) {
		this.reno = reno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	/*public String getRedeleteflag() {
		return redeleteflag;
	}
	public void setRedeleteflag(String redeleteflag) {
		this.redeleteflag = redeleteflag;
	}*/
	public String getRememo() {
		return rememo;
	}
	public void setRememo(String rememo) {
		this.rememo = rememo;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public String getReparent() {
		return reparent;
	}
	public void setReparent(String reparent) {
		this.reparent = reparent;
	}
	public String getRedepth() {
		return redepth;
	}
	public void setRedepth(String redepth) {
		this.redepth = redepth;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
}
