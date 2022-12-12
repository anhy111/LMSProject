package kr.or.ddit.domain;

import lombok.Data;

@Data
public class Common {
	private String comCd;   //공통 코드
	private String comNm;   //공통 코드명
	private String comCont; //공통 코드 내용
	private String comReg;  //등록일시
	private int comMem;     //등록자
	private String comUpdTs;//수정일시
	private int comUpdId;   //수정자
}                           
