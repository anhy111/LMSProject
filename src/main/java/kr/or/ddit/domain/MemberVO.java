package kr.or.ddit.domain;

import java.util.List;

public class MemberVO {

	private int memNo;
	private String memMl;
	private String memPass;
	//1:N
	private List<MemberAuthVO> memberAuthVOList;
	
	public MemberVO() {}

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

	
	public List<MemberAuthVO> getMemberAuthVOList() {
		return memberAuthVOList;
	}

	public void setMemberAuthVOList(List<MemberAuthVO> memberAuthVOList) {
		this.memberAuthVOList = memberAuthVOList;
	}

	@Override
	public String toString() {
		return "MemberVO [memNo=" + memNo + ", memMl=" + memMl + ", memPass=" + memPass + ", memberAuthVOList="
				+ memberAuthVOList + "]";
	}

	
	
	
}
