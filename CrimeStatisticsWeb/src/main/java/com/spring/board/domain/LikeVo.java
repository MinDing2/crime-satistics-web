package com.spring.board.domain;

public class LikeVo {
	private int likeno;
	private int bnum;
	private String memberid;
	private int likecheck;
	
	public LikeVo() {}
	public LikeVo(int likeno, int bnum, String memberid, int likecheck) {
		super();
		this.likeno = likeno;
		this.bnum = bnum;
		this.memberid = memberid;
		this.likecheck = likecheck;
	}

	public int getLikeno() {
		return likeno;
	}

	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public int getLikecheck() {
		return likecheck;
	}

	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}

	@Override
	public String toString() {
		return "LikeVo [likeno=" + likeno + ", bnum=" + bnum + ", memberid=" + memberid + ", likecheck=" + likecheck
				+ "]";
	}
}
