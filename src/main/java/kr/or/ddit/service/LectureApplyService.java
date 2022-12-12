package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;

public interface LectureApplyService {

	Professor proInfo(int proNo);

	List<LecApply> getYrNSem(int proNo);

	List<LecApply> list(Map<String, Object> map);

	int getCnt(Map<String, Object> map);

	Professor inquiryFormProInfo(int proNo);

	List<LecApply> inquiryFormLecApInfo(int proNo);
}
