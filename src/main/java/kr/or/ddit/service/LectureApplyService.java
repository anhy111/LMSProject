package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;

public interface LectureApplyService {

	public Professor proInfo(int proNo);

	public List<LecApply> getYrNSem(int proNo);
}
