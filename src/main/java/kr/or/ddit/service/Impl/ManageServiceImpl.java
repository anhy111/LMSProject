package kr.or.ddit.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Student> studentList() {
		return this.manageMapper.studentList();
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
	public int updateStu(Student student) {
		return this.manageMapper.updateStu(student);
	}
	
	@Override
	public List<Student> recordManage(){
		return this.manageMapper.recordManage();
	}
	
	@Override
	public Student recordManagePost(Map<String, String> map) {
		return this.manageMapper.recordManagePost(map);
	}
	
	@Override
	public int yesOrNo(Map<String, String> map) {
		return this.manageMapper.yesOrNo(map);
	}
}
