package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Objection;
import kr.or.ddit.domain.Student;

public interface TotalScoreMapper {

	//총 건수 세기(성적 받은 건수)
	public int getCount(HashMap<String, Object> map);
	public int getPreCnt(HashMap<String, Object> map);
	
	//학생 정보 가져오기
	public Student getInfo(@RequestParam("stuNo") String stuNo);
	
	//년도 및 학기 구하기
	public List<LecApply> getYrAndSem(@RequestParam HashMap<String, Object> map);
	public HashMap<String, Object> getNow();
	
	//성적 불러오기
	public List<LecApply> getList(HashMap<String, Object> map);
	public List<LecApply> getPreList(HashMap<String, Object> map);
	//성적 불러오기
	public List<LecApply> getListAgain(HashMap<String, Object> map);
	
	//이수학점 조회
	public int getTotalCrd(String stuNo);
	
	//집계정보 조회
	public HashMap<String, Object> getTotalInfo(HashMap<String, Object> map);
	public HashMap<String, Object> getPreTotalInfo(HashMap<String, Object> map);
	
	//이의신청 여부 확인
	public Objection checkObjection(HashMap<String, Object> map); 
	
	//이의신청 안한 과목 정보 불러오기
	public LecApply getCourseInfo(String lecaCd);
		
	//이의신청 insert
	public int preAppeal(Objection obj);
	
	//이의신청 리스트(교수)
	public List<Objection> objectionList(String proNo);
	
	//이의신청 상세
	public Objection objDetail(String objCd); 
	
	//이의신청 승인
	public int updateY(Objection obj);
	//이의신청 반려
	public int updateN(Objection obj);
	
	
		
		
	
}
