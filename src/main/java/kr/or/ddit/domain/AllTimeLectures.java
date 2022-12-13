package kr.or.ddit.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AllTimeLectures {
	
	/*조회 필드
	  -년도, 학기, 단과대, 학과, 과목, 이수구분, 강의명, 교수명, 학년, 학점, 개설여부, 수강인원
	  -강의명, 교수명은 input text 태그에서 직접 타이핑 검색 조회
	  -나머지는 select 태그로 선택시 조회
	*/
	
	//parameter
	private int lecaYr;//년도
	private String lecaSem;//학기
	private String colNm;//단과대명
	private String depNm;//학과명
	private String subNm;//과목명
	private String lecaCate;//이수구분
	private String lecaNm;//강의명
	private String empNm;//교수직책+교수명
	private int lecaTrg;//개설학년
	private int lecaCrd;//배정학점
	private String lecYn;//개설여부 Y, N
	private int lecHcnt;//수강중인 인원
	
	//result
	private Lecture lecture;
	private LecApply lecApply;
	private Subject subject;
	private Department department;
	private College college;
	private Professor professor;
	private Employee employee;
	
}
