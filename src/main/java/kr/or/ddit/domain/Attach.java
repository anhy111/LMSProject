package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Attach {

	private int atchFileId; //첨부파일ID
	private int fileSn; //파일순번
	private String fileStreCours; //파일저장경로
	private String streFileNm; //저장파일명
	private String orignlFileNm; //원본파일명
	private String fileExtsn; //파일확장자
	private int fileSize;  //파일크기
	private Date createDt; 
}
