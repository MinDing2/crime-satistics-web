package com.spring.question.vo;

public class QuestionVo {
	private int question_id; 
	private String memberid; 
	private String question_title;
	private String question_content;
	private String create_date; 
	private String nickname;
	
	public QuestionVo() {}
	
	public QuestionVo(int question_id, String memberid, String question_title, String question_content) {
		super();
		this.question_id = question_id;
		this.memberid = memberid;
		this.question_title = question_title;
		this.question_content = question_content;
	}

	@Override
	public String toString() {
		return "QuestionVo [question_id=" + question_id + ", memberid=" + memberid + ", question_title="
				+ question_title + ", question_content=" + question_content + "]";
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public int getQuestion_id() {
		return question_id;
	}
	
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	
	public String getMemberid() {
		return memberid;
	}
	
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	public String getQuestion_title() {
		return question_title;
	}
	
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	
	public String getQuestion_content() {
		return question_content;
	}
	
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getNickname() {
		return nickname;
    }

    public void setNickname(String nickname) {
         this.nickname = nickname;
    }
	
}
