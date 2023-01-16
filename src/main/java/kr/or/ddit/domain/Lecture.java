package kr.or.ddit.domain;

import java.util.List;

import lombok.Data;

@Data
public class Lecture {

	private int lecaCd;// 강의코드
	private int subCd;// 과목코드
	private String lecYn;// 개강 상태
	private int lecHcnt;// 수강인원
	private int lecaYn;// 승인여부
	private int depCd;// 학과코드
	private LecApply lecApply;
	private Employee employee;
	private Department department;
	private List<Task> taskList;
	
	private Allocation allocation;
    private Building building;
    private College college;
    private Professor professor;
    private Room room;
    private Subject subject;
    private List<LecData> lecDataList;
	
    private int rowNo; //순번
}
