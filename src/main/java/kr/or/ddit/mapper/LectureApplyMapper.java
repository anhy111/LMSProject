package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;

public interface LectureApplyMapper {

	// 교수 상세
    public Professor proInfo(int proNo);
    // 학년 / 학기
    public List<LecApply> getYrNSem(int proNo);
}
