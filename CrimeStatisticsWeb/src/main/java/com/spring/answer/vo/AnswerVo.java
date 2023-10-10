package com.spring.answer.vo;
import java.util.Date;

public class AnswerVo {
	private int answer_id; 
	private int question_id;
	private String adminid; 
	private String answer_cont; 
	private String answer_title; 
	private Date create_date;
	private String nickname;
	
	public AnswerVo() {}

	public AnswerVo(int answer_id, int question_id, String adminid, String answer_cont, String answer_title,
			Date create_date) {
		super();
		this.answer_id = answer_id;
		this.question_id = question_id;
		this.adminid = adminid;
		this.answer_cont = answer_cont;
		this.answer_title = answer_title;
		this.create_date = create_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "AnswerVo [answer_id=" + answer_id + ", question_id=" + question_id + ", adminid=" + adminid
				+ ", answer_cont=" + answer_cont + ", answer_title=" + answer_title + ", create_date=" + create_date
				+ "]";
	}

	public String getAnswer_title() {
		return answer_title;
	}

	public void setAnswer_title(String answer_title) {
		this.answer_title = answer_title;
	}

	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminId) {
		this.adminid = adminId;
	}
	public String getAnswer_cont() {
		return answer_cont;
	}
	public void setAnswer_cont(String answer_cont) {
		this.answer_cont = answer_cont;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
}
