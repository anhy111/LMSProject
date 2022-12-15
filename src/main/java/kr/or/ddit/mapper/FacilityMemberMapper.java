package kr.or.ddit.mapper;

import kr.or.ddit.domain.facility.FacilityScheduleVO;

import java.util.List;

public interface FacilityMemberMapper {

	//풀캘린더 시작-------------------------------------------------------
	//일정 등록
	void insertSch(FacilityScheduleVO facilityScheduleVO);

	//일정 삭제
	void deleteSch(FacilityScheduleVO facilityScheduleVO);

	//일정 수정
	void updateSch(FacilityScheduleVO facilityScheduleVO);
	
	//일정 리스트
	List<FacilityScheduleVO> listSch();
	//풀캘린더 끝-------------------------------------------------------

}
