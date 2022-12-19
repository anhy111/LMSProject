package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Counsel;
import kr.or.ddit.mapper.CounselMapper;
import kr.or.ddit.service.CounselService;

@Service
public class CounselServiceImpl implements CounselService {
	@Autowired
	CounselMapper counselMapper;
	
	//학생의 상담신청 목록
	@Override
		public List<Counsel> studentApplyList(int stuNo){
			return this.counselMapper.studentApplyList(stuNo);
		}
	//학생의 상담신청
	@Override
		public int applyInsert(Counsel counsel) {
			return this.counselMapper.applyInsert(counsel);
		}
	//학생의 담당 교수 목록
	@Override
	public List<Counsel> listOfProfessor(int stuNo){
		return this.counselMapper.listOfProfessor(stuNo);
	}
	//학생의 상담 내용 수정
	@Override
	public int applyModify(Counsel counsel) {
		return this.counselMapper.applyModify(counsel);
	}
	//교수의 상담목록 조회
	@Override
		public List<Counsel> professorCounselList(int proNo){
			return this.counselMapper.professorCounselList(proNo);
		}
	//교수의 비대면 상담답변
	@Override
	public int applyAnswerUpdate(Counsel counsel) {
		return this.counselMapper.applyAnswerUpdate(counsel);
	}
	//교수의 비대면 답변상세
	@Override
	public Counsel answerDetail(Long cnslCd) {
		return this.counselMapper.answerDetail(cnslCd);
		}
	//해당글의 학생명
	@Override
	public String studentNameByCounsels(Long cnslCd) {
		return this.counselMapper.studentNameByCounsels(cnslCd);
	}
	
	//교수의 대면 상담 상세
	@Override
	public Counsel answerNoteDetail(Long cnslCd) {
		return this.counselMapper.answerNoteDetail(cnslCd);
		}
}