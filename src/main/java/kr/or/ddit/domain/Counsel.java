package kr.or.ddit.domain;

import java.util.Date;

public class Counsel {
	private int cnslCd; //상담코드
	private int stuNo; //학번
	private String cnslCate; //카테고리
	private String cnslTtl; //제목
	private String cnslCon; //내용
	private Date cnslReg; //신청일
	private Date cnslDt; //상담일
	private String cnslRpl; //답변
	
	public Counsel() {
	}

	public int getCnslCd() {
		return cnslCd;
	}

	public void setCnslCd(int cnslCd) {
		this.cnslCd = cnslCd;
	}

	public int getStuNo() {
		return stuNo;
	}

	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}

	public String getCnslCate() {
		return cnslCate;
	}

	public void setCnslCate(String cnslCate) {
		this.cnslCate = cnslCate;
	}

	public String getCnslTtl() {
		return cnslTtl;
	}

	public void setCnslTtl(String cnslTtl) {
		this.cnslTtl = cnslTtl;
	}

	public String getCnslCon() {
		return cnslCon;
	}

	public void setCnslCon(String cnslCon) {
		this.cnslCon = cnslCon;
	}

	public Date getCnslReg() {
		return cnslReg;
	}

	public void setCnslReg(Date cnslReg) {
		this.cnslReg = cnslReg;
	}

	public Date getCnslDt() {
		return cnslDt;
	}

	public void setCnslDt(Date cnslDt) {
		this.cnslDt = cnslDt;
	}

	public String getCnslRpl() {
		return cnslRpl;
	}

	public void setCnslRpl(String cnslRpl) {
		this.cnslRpl = cnslRpl;
	}

	@Override
	public String toString() {
		return "Counsel [cnslCd=" + cnslCd + ", stuNo=" + stuNo + ", cnslCate=" + cnslCate + ", cnslTtl=" + cnslTtl
				+ ", cnslCon=" + cnslCon + ", cnslReg=" + cnslReg + ", cnslDt=" + cnslDt + ", cnslRpl=" + cnslRpl + "]";
	}
	
	
	
}
