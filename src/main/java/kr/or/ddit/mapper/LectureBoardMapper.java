package kr.or.ddit.mapper;


import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;


import kr.or.ddit.domain.Attendence;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Student;
import kr.or.ddit.domain.StudentTest;
import kr.or.ddit.domain.StudentTestDetail;
import kr.or.ddit.domain.Test;
import kr.or.ddit.domain.TestQ;

public interface LectureBoardMapper {

	//자료실 리스트
	public Lecture dataList(@Param("keyWord") String keyWord,@Param("category") String category,@Param("lecaCd") String lecaCd);
	
	//자료실 상세
	public LecData dataDetail(String ldtCd);
	
	//자료 수정
	public int dataUpdate(HashMap<String, Object> map);
	
	//자료 삭제
	public int dataDelete(String ldtCd);
	
	//자료 등록========================================
	public int dataInsert1(Map<String, Object> map);
	public int dataInsert2(Map<String, Object> map);
	//==============================================
	
	//시험 리스트
	public List<Test> testList(String lecaCd);
	
	//강의 계획서 조회
	public LecApply lecApplySearch(String lecaCd);
	
	//시험 틀 추가
	public int testInsert(Test test);
	
	//문제 추가
	public int testQInsert(TestQ testQ);
	
	//시험 상세
	public Test testDetail(String testCd);
	
	//시험 삭세
	public int testDelete(String testCd);
	public int testQDelete(String testCd);
		
	//시험 응시 추가
	public int stuTestInsert(StudentTest stuTest);
	
	//시험 응시 상세추가
	public int insertStdList(List<StudentTestDetail> list);
	
	//학생 시험본거 상세
	public Test stuTestDetail(String teqCd);
	
	//시험 제출여부 
	public Test submitCheck(@Param("stuNo")String stuNo,@Param("lecaCd")String lecaCd,@Param("testCd")String testCd);
	
	//출결 학생리스트
	public List<Student> studentList(String lecaCd);
	
	//출결 학생 정보
	public Attendence attenStudentDetail(@Param("lecaCd") String lecaCd, @Param("stuNo") String stuNo);
	
	//출결 디테일
	public Attendence attendenceDetail(@Param("lecaCd") String lecaCd, @Param("stuNo") String stuNo);
	
	//출결 디테일
	public List<Attendence> attendStuDetail(@Param("lecaCd") String lecaCd, @Param("stuNo") String stuNo);
	
	//출결 카운트 체크
	public int attenChkCnt(Map<String, Object> map);
	
	//출결 인서트
	public int attendStuInsert(Attendence attendence);
	
	//출결 수정
	public int attendStuUpdate(Attendence attendence);
	

		
	
}
