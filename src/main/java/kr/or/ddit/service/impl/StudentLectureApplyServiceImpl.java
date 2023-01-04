package kr.or.ddit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.domain.StudentLecture;
import kr.or.ddit.mapper.StudentLectureApplyMapper;
import kr.or.ddit.service.StudentLectureApplyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudentLectureApplyServiceImpl implements StudentLectureApplyService{
	
	@Autowired
	StudentLectureApplyMapper studentLectureApplyMapper;
	
	@Transactional
	@Override
	public String apply(StudentLecture studentLecture) {
		
		studentLecture.setCategory("stuLec");
		
		// 쿼리문 실행해서 규칙에 위반되면 0반환 -> 신청 불가
		if(this.studentLectureApplyMapper.duplicateCheckLectureTime(studentLecture) > 0) {
			new RuntimeException();
			return "duplicate";
		}
		
		if(this.studentLectureApplyMapper.maxCredit(studentLecture) == 0) {
			new RuntimeException();
			return "maxCredit";
		}
		
		if(this.studentLectureApplyMapper.checkHeadcount(studentLecture) == 0) {
			new RuntimeException();
			return "maxHeadcount";
		}
		
		// 입력 도중 에러는 알기 힘듬
		if(this.studentLectureApplyMapper.apply(studentLecture) == 0) {
			new RuntimeException();
			return "unknown";
		}
		if(this.studentLectureApplyMapper.increaseHeadcount(studentLecture) == 0) {
			new RuntimeException();
			return "unknown";
		}
		
		return "success";
	}
	
	@Transactional
	@Override
	public int applyCancel(StudentLecture studentLecture) {
		int result = this.studentLectureApplyMapper.applyCancel(studentLecture);
		if(result == 0) {
			return 0;
		}
		return this.studentLectureApplyMapper.decreaseHeadcount(studentLecture);
	}
	
	@Override
	public String save(StudentLecture studentLecture) {
		
		studentLecture.setCategory("wish");
		if(this.studentLectureApplyMapper.duplicateCheckLectureTime(studentLecture) > 0) {
			new RuntimeException();
			return "duplicate";
		}
		
		if(this.studentLectureApplyMapper.maxCredit(studentLecture) == 0) {
			new RuntimeException();
			return "maxCredit";
		}
		
		if(this.studentLectureApplyMapper.save(studentLecture)==0) {
			new RuntimeException();
			return "unknown";
		}
		return "success";
	}
	
	@Override
	public int saveCancel(StudentLecture studentLecture) {
		return this.studentLectureApplyMapper.saveCancel(studentLecture);
	}
}
