package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class LecApply {

    private int lecaCd;         //강의계획신청코드
    private int lecaYr;         //년도

    private String lecaSem;     //학기

    private String lecaNm;      //강의명
    private String lecaCon;     //교과목개요
    private int lecaTrg;        //개설학년
    private int lecaCrd;        //학점
    private int lecaPer;        //강의시수
    private int lecaCap;        //가능정원
    private String lecaTm;      //강의시작시간
    private String lecaWk;      //강의요일
    private String lecaHall;    //강의건물
    private int lecaUnit;       //강의호
    private String lecaBook;    //교재 및 참고서
    private String lecaNote;    //비고
    private Date lecaDt;        //신청일자
    private int lecaGrade;      //평가구분
    private String lecaImsiYn;  //임시저장
    private String lecaCate;    //이수구분
    private int lecaMp;         //중간고사비율
    private int lecaFp;         //기말고사비율
    private int lecaTp;         //과제비율
    private int lecaAp;         //출결비율
    private int proNo;			//담당교수
    
    private String lecaYs;		//년도/학기
    private int subCd;			//과목코드
    private String lecaTt;		//강의시간/강의실
    private String lecaApproval; //승인여부
    private String subNm;		//과목명
    
}
