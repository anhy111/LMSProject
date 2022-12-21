package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> departmentList() {
		return this.departmentMapper.departmentList();
	}
	
	@Override
	public int register(Department department) {
		return this.departmentMapper.register(department);
	}
	
	@Override
	public List<Department> departmentByCollegeList(int colCd) {
		return this.departmentMapper.departmentListByCollege(colCd);
	}
	
	@Override
	public Department departmentDetail(Department department) {
		return this.departmentMapper.departmentDetail(department);
	}
	
	@Override
	public int delete(Department department) {
		return this.departmentMapper.delete(department);
	}
	
	@Override
	public int update(Department department) {
		return this.departmentMapper.update(department);
	}
	
	@Override
	public int validationDepartmentName(String depNm) {
		return this.departmentMapper.validationDepartmentName(depNm);
	}
	
	@Override
	public Professor searchProfessor(Department department) {
		return this.departmentMapper.searchProfessor(department);
	}
}
