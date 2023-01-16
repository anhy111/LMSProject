package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.ManageMapper;
import kr.or.ddit.service.ManageService;
import kr.or.ddit.util.FileUploadUtil;

@Service
public class ManageServiceImpl implements ManageService{

	@Autowired
	ManageMapper manageMapper;
	
	@Autowired
	FileUploadUtil fileUploadUtil;
	
	@Override
	public List<Student> studentList(int viewPage) {
		return this.manageMapper.studentList(viewPage);
	}
	
	@Override
	public List<Student> stuSearch(Map<String, String> map){
		return this.manageMapper.stuSearch(map);
	}
	
	@Override
	public Student detailStu(Map<String, String> map) {
		return this.manageMapper.detailStu(map);
	}
	
	@Override
	public int deleteStu(Map<String, String> map) {
		return this.manageMapper.deleteStu(map);
	}
	
	@Override
	public int deleteMemStu(Map<String, String> map) {
		return this.manageMapper.deleteMemStu(map);
	}
	
	@Override
	public int updateStu(Student student) {
		return this.manageMapper.updateStu(student);
	}
	
	@Override
	public List<Student> recordSearch(Map<String, String> map){
		return this.manageMapper.recordSearch(map);
	}
	
	@Override
	public Student recordManagePost(Map<String, String> map) {
		return this.manageMapper.recordManagePost(map);
	}
	
	@Override
	public int yesOrNo(Map<String, String> map) {
		return this.manageMapper.yesOrNo(map);
	}
	
	@Override
	public Member createEmpId() {
		return this.manageMapper.createEmpId();
	}
	
	@Override
	public int createMember(Employee employee) {
		return this.manageMapper.createMember(employee);
	}
	
	@Override
	public int createEmployee(Employee employee) {
		return this.manageMapper.createEmployee(employee);
	}
	
	@Override
	public int createProfessor (Employee employee) {
		return this.manageMapper.createProfessor(employee);
	}
	
	@Override
	public List<Employee> employeeList(int viewPage){
		return this.manageMapper.employeeList(viewPage);
	}
	
	@Override
	public Employee detailEmp(Map<String, String> map) {
		return this.manageMapper.detailEmp(map);
	}
	
	@Override
	public int deleteMemEmp(Map<String, String> map) {
		return this.manageMapper.deleteMemEmp(map);
	}
	
	@Override
	public int deleteEmp(Map<String, String> map) {
		return this.manageMapper.deleteEmp(map);
	}
	
	@Override
	public int deletePro(Map<String, String> map) {
		return this.manageMapper.deletePro(map);
	}
	
	@Override
	public int updateEmp(Employee employee) {
		return this.manageMapper.updateEmp(employee);
	}
	
	@Override
	public List<Evaluation> evaluationList(){
		return this.manageMapper.evaluationList();
	}
	
	@Override
	public Evaluation evaluationCon(Map<String, String> map) {
		return this.manageMapper.evaluationCon(map);
	}
	
	@Override
	public List<Evaluation> mineEvlList(String no){
		return this.manageMapper.mineEvlList(no);
	}
	
	@Override
	public int stuPaging() {
		return this.manageMapper.stuPaging();
	}
	
	@Override
	public int empPaging() {
		return this.manageMapper.empPaging();
	}
	
	@Override
	public int updateStudentRecord(Map<String, String> map){
		return this.manageMapper.updateStudentRecord(map);
		
	}
}
