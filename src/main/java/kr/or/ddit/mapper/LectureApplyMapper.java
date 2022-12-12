package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Professor;

public interface LectureApplyMapper {

	// 교수 상세
    Professor proInfo(int proNo);

	// 학년 / 학기
    List<LecApply> getYrNSem(int proNo);

	// 제출된 강의계획서 리스트
    List<LecApply> list(Map<String, Object> map);

	// 강의 개수 불러오기
    int getCnt(Map<String, Object> map);

	// 강의계획서 상세페이지 교수정보
    Professor inquiryFormProInfo(int proNo);

	// 강의계획서 상세페이지 기본사항,상세내용
    List<LecApply> inquiryFormLecApInfo(int proNo);
}
