package kr.or.ddit.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.StudentTest;
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
		
	//시험 제출여부 
	public List<Test> checkTestSubmit(String stuCd);
	
	//시험 응시 추가
	public int stuTestInsert(StudentTest stuTest);
}
