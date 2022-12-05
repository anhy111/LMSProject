package kr.or.ddit.domain;

public class MemberAuth {
	private int memNo;
	private String auth;
	
	public MemberAuth() {}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberAuthVO [memNo=" + memNo + ", auth=" + auth + "]";
	}

	
	
}
