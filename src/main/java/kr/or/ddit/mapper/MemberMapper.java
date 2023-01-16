package kr.or.ddit.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;

public interface MemberMapper  {

	//회원 로그인 확인
    public Member read(int memNo);

    public Student readStudent(int memNo);

    public Employee readEmployee(int memNo);

    public Manager readManager(int memNo);

    public Professor readProfessor(int memNo);

    public String searchId(HashMap<String, String> map);

    public void changePw(Map<String, String> map);

    public int stuUpdate(Student student);

    public int updateStuPw(Map<String, String> map);
    
    public List<SclHistory> mySclList(int memNo);
    
    public int empUpdate(Employee employee);
    
    public int inMypage(Member member);

}
