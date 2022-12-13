package kr.or.ddit.mapper;


import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;

public interface MemberMapper  {

	//회원 로그인 확인
    Member read(int memNo);

	Student readStudent(int memNo);

	Employee	readEmployee(int memNo);

	Manager readManager(int memNo);

	Professor readProfessor(int memNo);

	String searchId(HashMap<String, String> map);

	void changePw(Map<String, String> map);

	int stuUpdate(Student student);

	int updateStuPw(Map<String, String> map);

}
