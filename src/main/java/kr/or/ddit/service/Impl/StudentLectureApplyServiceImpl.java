package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.StudentLectureApplyMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.StudentLectureApplyService;

@Service
public class StudentLectureApplyServiceImpl implements StudentLectureApplyService{
	
	@Autowired
	StudentLectureApplyMapper studentLectureApplyMapper;
	
	@Override
	public int apply(StudentLecture studentLecture) {
		return this.studentLectureApplyMapper.apply(studentLecture);
	}
}
