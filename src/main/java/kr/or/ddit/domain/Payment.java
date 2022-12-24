package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Payment {

	private int stuNo;	//학번
	private int paySem;	//납부학기
	private Date payDt;	//납부일자
	private int payAmt;	//납부금액
	private String payYn;	//납부상태
	
	private int paySumfee;	//납부되는 등록금 총액
	private int paySumamt;	//납부된 등록금 총액
	
	private int depCd;		//학과코드
	private String depNm;	//학과명
	
	private int colFee;			//단과대 등록금
	private int colCd;			//단과대코드
	private String colNm; 		//단과대학명
	private String colDes; 		//단과대설명
	private String colTel; 		//단과대연락처
	private String colAddr; 	//단과대위치
	private String colImgUrl;	//단과대이미지
	
	private String stuNm;	//학생이름
	private int stuYr;		//학년
	private int stuSem;		//학생현재학기
	
	private int sclhAmt;	//장학금 지급액
	
	private int sclAmt;		//장학금액
}
