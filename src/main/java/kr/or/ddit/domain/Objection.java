package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Objection {
private int	    objCd ; //이의신청코드
private int	    stuNo ; //학번
private int	    lecaCd; //강의코드
private String	objTtl; //이의제목
private String	objCon; //이의내용
@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
@DateTimeFormat(pattern = "yyyy-MM-dd")
private Date	objDt ; //이의신청날짜
private String	    objYn ; //처리결과
private String	objRpl; //처리내용
private String lecaYrnsem;
private String stuNm;
private String lecaNm;
private String colDep;
private String yrSem;
private String  lecaGrade;
private String  slScore;
}
