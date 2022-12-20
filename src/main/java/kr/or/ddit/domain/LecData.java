package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class LecData {
	private int    ldtCd     ; //강의자료코드
	private int    lecaCd    ; //강의코드
	private String ldtTtl    ; //제목
	private String ldtCon    ; //내용
	private Date   ldtReg    ; //작성일자
	private String ldtWriter ; //작성자
	private int    atchFileId; //첨부 파일 아이디
	private int    ldtCount  ; //조회 수
	private List<Attach> attachList; //attach
}
