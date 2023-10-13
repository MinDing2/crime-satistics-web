package com.spring.notice.vo;

public class NoticeVo {

	//fields
	private int nbnum;
	private String title;
	private String cont;
	private String writer;
	private String regdate;
	private int readcount;
	private String enddate;
	
	//Constructor
	public NoticeVo() {}
	public NoticeVo(int nbnum, String title, String cont, String writer, String regdate, int readcount,
			String enddate) {
		super();
		this.nbnum = nbnum;
		this.title = title;
		this.cont = cont;
		this.writer = writer;
		this.regdate = regdate;
		this.readcount = readcount;
		this.enddate = enddate;
	}
	
	//Getter/Setter
	public int getNbnum() {
		return nbnum;
	}
	public void setNbnum(int nbnum) {
		this.nbnum = nbnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	
	@Override
	public String toString() {
		return "NoticeVo [nbnum=" + nbnum + ", title=" + title + ", cont=" + cont + ", writer=" + writer + ", regdate="
				+ regdate + ", readcount=" + readcount + ", enddate=" + enddate + "]";
	}
}
