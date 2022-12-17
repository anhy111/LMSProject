package kr.or.ddit.service;

import kr.or.ddit.domain.facility.Facility;
import kr.or.ddit.domain.facility.FacilityScheduleVO;

import java.util.List;

//서비스 interface : 비즈니스 로직
public interface FacilityMemberService {
	//풀캘린더-----------------------------------------

		List<Facility> facility();

		//일정등록
		void insertSch(FacilityScheduleVO facilityScheduleVO);
		//일정 삭제
		void deleteSch(FacilityScheduleVO facilityScheduleVO);
		//일정 리스트
		List<FacilityScheduleVO> listSch(int facCd);
	//풀캘린더-----------------------------------------
}













