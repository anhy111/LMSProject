package kr.or.ddit.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Task {

	private int taskCd;
	private int lecaCd;
	private String taskNm;
	private String taskCon;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date taskSdt;
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date taskEdt;
	private int atchFileId;

}
