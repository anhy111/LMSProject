package kr.or.ddit.domain;

public class College {
	private int colCd; 	//단과대코드
	private String colNm; //단과대학명
	private String colDes; //단과대설명
	private String colTel; //단과대연락처
	private String colAddr; //단과대위치
	private String colImgUrl; //단과대이미지URL
	
	
	public College() {
	}


	public int getColCd() {
		return colCd;
	}


	public void setColCd(int colCd) {
		this.colCd = colCd;
	}


	public String getColNm() {
		return colNm;
	}


	public void setColNm(String colNm) {
		this.colNm = colNm;
	}


	public String getColDes() {
		return colDes;
	}


	public void setColDes(String colDes) {
		this.colDes = colDes;
	}


	public String getColTel() {
		return colTel;
	}


	public void setColTel(String colTel) {
		this.colTel = colTel;
	}


	public String getColAddr() {
		return colAddr;
	}


	public void setColAddr(String colAddr) {
		this.colAddr = colAddr;
	}


	public String getColImgUrl() {
		return colImgUrl;
	}


	public void setColImgUrl(String colImgUrl) {
		this.colImgUrl = colImgUrl;
	}


	@Override
	public String toString() {
		return "College [colCd=" + colCd + ", colNm=" + colNm + ", colDes=" + colDes + ", colTel=" + colTel
				+ ", colAddr=" + colAddr + ", colImgUrl=" + colImgUrl + "]";
	}

	
}
