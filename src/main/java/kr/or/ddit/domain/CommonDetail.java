package kr.or.ddit.domain;

import lombok.Data;

@Data
public class CommonDetail {
	private String comdCd;   //공통 코드 상세
	private String comCd;    //공통 코드
	private String comdNm;   //공통 코드 상세 명
	private String comdCon;  //공통 코드 상세 내용
	private String comdYn;   //사용여부
	private int comdOrdr;    //정렬순서
	private String comdReg;  //등록일시
	private int comdMem;     //등록자
	private String comdUpdTs;//수정일시
	private int comdUpdId;   //수정자
}
