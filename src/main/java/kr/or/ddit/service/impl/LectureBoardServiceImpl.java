package kr.or.ddit.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.ddit.domain.Attendence;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.domain.Student;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.domain.StudentTest;
import kr.or.ddit.domain.StudentTestDetail;
import kr.or.ddit.domain.Test;
import kr.or.ddit.domain.TestQ;
import kr.or.ddit.mapper.LectureBoardMapper;
import kr.or.ddit.service.LectureBoardService;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LectureBoardServiceImpl implements LectureBoardService{
	@Inject
	LectureBoardMapper lectureBoardMapper;
	@Autowired
	LectureBoardService lectureBoardService;
	
	//자료실 리스트
	@Override
	public Lecture dataList(String keyWord, String category,String lecaCd){
		return this.lectureBoardMapper.dataList(keyWord, category, lecaCd);
	}
	//자료실 상세
	@Override
	public LecData dataDetail(String ldtCd) {

		LecData lecData = this.lectureBoardMapper.dataDetail(ldtCd);
		if(lecData != null) {
			this.lectureBoardMapper.countPlus(ldtCd);
		}
		return lecData;
	}
	
	
	//자료 수정
	@Override
	public int dataUpdate(HashMap<String, Object> map) {
		return this.lectureBoardMapper.dataUpdate(map);
	}
	//자료 삭제
	@Override
	public int dataDelete(String ldtCd) {
		return this.lectureBoardMapper.dataDelete(ldtCd);
	}
	
	//자료 등록
	@Override
	public int dataInsert1(Map<String, Object> map) {
		return this.lectureBoardMapper.dataInsert1(map);
	}
	@Override
	public int dataInsert2(Map<String, Object> map) {
		return this.lectureBoardMapper.dataInsert2(map);
	}
	

	//시험 리스트
	@Override
	public List<Test> testList(String lecaCd){
		return this.lectureBoardMapper.testList(lecaCd);
	}

	//강의 계획서 조회
	@Override
	public LecApply lecApplySearch(String lecaCd){
		return this.lectureBoardMapper.lecApplySearch(lecaCd);
	}
	
	//시험 틀 추가
	@Override
	public int testInsert(Test test) {
		int result = 0;
		List<TestQ> testQList = new ArrayList<TestQ>();
		//시험 등록
		 this.lectureBoardMapper.testInsert(test);
		log.info(test.toString()+"111");
		 List<TestQ> list = test.getTestQList();
		 for (TestQ testQ1 : list) {
			 testQ1.setTestCd(test.getTestCd());
			 testQList.add(testQ1);
		 }
		 log.info("testCd"+testQList);
		 //시험 문제 추가
		 for (TestQ testQ : testQList) {
			 log.info("testq:+++++++++++++ "+testQ.toString());
			 result = this.lectureBoardMapper.testQInsert(testQ);
		}
		
		 return result;
	}
	
	//시험 상세
	@Override
	public Test testDetail(String testCd) {
		return this.lectureBoardMapper.testDetail(testCd);
	}
	
	//시험 삭세
	@Override
	public int testDelete(String testCd) {
		int result = 0;
		
		result = this.lectureBoardMapper.testQDelete(testCd);
		log.info(result+"DKDKDKDKDK");
		if(result > 0) {
			result = this.lectureBoardMapper.testDelete(testCd);
		}
		return result;
	}
	
	//시험 응시 추가
	@Override
	public int stuTestInsert(StudentTest stuTest) {
		return this.lectureBoardMapper.stuTestInsert(stuTest);
	}
	//시험 응시 상세추가
	@Override
	public int insertStdList(List<StudentTestDetail> list) {
		return this.lectureBoardMapper.insertStdList(list);
	}
	
	@Override
	//학생 시험본거 상세
	public Test stuTestDetail(String stCd){
		return this.lectureBoardMapper.stuTestDetail(stCd);
	}
	
	//시험 제출여부 	
	@Override
	public Test submitCheck(String stuNo,String lecaCd,String testCd) {
		return this.lectureBoardMapper.submitCheck(stuNo, lecaCd, testCd);
	}

	//출결 학생리스트
	@Override
	public List<Student> studentList(String lecaCd){
		return this.lectureBoardMapper.studentList(lecaCd);
	}
	
	//출결 학생 정보
	@Override
	public Attendence attenStudentDetail(String lecaCd, String stuNo) {
		return this.lectureBoardMapper.attenStudentDetail(lecaCd, stuNo);
	}
	
	//출결 디테일
	@Override
	public Attendence attendenceDetail(String lecaCd, String stuNo) {
		return this.lectureBoardMapper.attendenceDetail(lecaCd, stuNo);
	}
	
	//출결 디테일
	@Override
	public List<Attendence> attendStuDetail(String lecaCd, String stuNo) {
		return this.lectureBoardMapper.attendStuDetail(lecaCd, stuNo);
	}
	
	//출결 카운트 체크
	@Override
	public int attenChkCnt(Map<String, Object> map) {
		return this.lectureBoardMapper.attenChkCnt(map);
	}
	
	//출결 인서트
	@Override
	public int attendStuInsert(Attendence attendence) {
		return this.lectureBoardMapper.attendStuInsert(attendence);
	}
	
	//출결 수정
	@Override
	public int attendStuUpdate(Attendence attendence) {
		return this.lectureBoardMapper.attendStuUpdate(attendence);
	}
	
	@Override
	public List<Student> getGradeList(int lecaCd){
		return this.lectureBoardMapper.getGradeList(lecaCd);
	}
	
	@Override
	public List<Student> lecStuScoreDetail(Map<String, Object> map){
		return this.lectureBoardMapper.lecStuScoreDetail(map);
	}

	@Override
	public Student getStuScoreAndMaxScore(Map<String, Object> map) {
		return this.lectureBoardMapper.getStuScoreAndMaxScore(map);
	}
	
	@Override
	public int stuGradeUpdate(StudentLecture stuLec) {
		return this.lectureBoardMapper.stuGradeUpdate(stuLec);
	}
	
	
	//학생이 자기 성적 조회(현재 강의)
	@Override
	public StudentLecture stuLecScoreSearch(String lecaCd, String stuNo) {
		return this.lectureBoardMapper.stuLecScoreSearch(lecaCd, stuNo);
	}
	
	
	
}
