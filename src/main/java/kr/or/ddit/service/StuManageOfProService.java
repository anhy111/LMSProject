package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.domain.SclHistory;
import kr.or.ddit.domain.Student;

public interface StuManageOfProService{

	public List<Student> stuList(int depCd);

	public List<SclHistory> stuSclList(Map<String, String> map);

	public int recommendationStu(Map<String, String> map);

	public List<SclHistory> schStuList(Map<String, String> map);

	public Student schStuRcmd(Map<String, String> map);

	public List<Student> myStuSearch(Map<String, String> map);

	public int deanRecommendation(Map<String, String> map, HttpServletRequest req);

	public int rejectRcmd(Map<String, String> map);

}
