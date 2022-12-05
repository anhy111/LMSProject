package kr.or.ddit.domain;

import java.util.List;

public class Member {

	private int memNo;
	private String memMl;
	private String memPass;
	//1:N
	private List<MemberAuth> memberAuthVOList;
	
	public Member() {}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemMl() {
		return memMl;
	}

	public void setMemMl(String memMl) {
		this.memMl = memMl;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}

	
	public List<MemberAuth> getMemberAuthVOList() {
		return memberAuthVOList;
	}

	public void setMemberAuthVOList(List<MemberAuth> memberAuthVOList) {
		this.memberAuthVOList = memberAuthVOList;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memMl=" + memMl + ", memPass=" + memPass + ", memberAuthVOList="
				+ memberAuthVOList + "]";
	}

	
	
	
}
