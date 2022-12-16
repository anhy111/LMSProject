package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
@Data
public class TaskSubmit {
	private int      tsubCd     ;
	private int      lecaCd     ;
	private int      taskCd     ;
	private int      stuNo      ;
	private Date     tsubDt     ;
	private int      tsubScore  ;
	private int      atchFileId ;
	private String   tsubCon    ;
	//=============================
	private Student  student    ;
	private List<Attach> attach;
	
}
