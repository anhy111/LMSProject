package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Student;

public interface TotalScoreMapper {

	//총 건수 세기(성적 받은 건수)
	public int getCount(HashMap<String, Object> map);
	
	//학생 정보 가져오기
	public Student getInfo(@RequestParam("stuNo") String stuNo);
	
	//년도 및 학기 구하기
	public List<LecApply> getYrAndSem(@RequestParam HashMap<String, Object> map);
	public HashMap<String, Object> getNow();
		
	
}
