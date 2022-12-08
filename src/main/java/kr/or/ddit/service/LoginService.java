package kr.or.ddit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;

public interface LoginService {
	
	public Member read(int memNo);
	
	public Student readStudent(int memNo);
	
	public Employee	readEmployee(int memNo);
	
	public Manager readManager(int memNo);
	
	public Professor readProfessor(int memNo);
	
	public String searchId(HashMap<String, String> map);
	
	public String changePw(Map<String, String> map);
	
}
