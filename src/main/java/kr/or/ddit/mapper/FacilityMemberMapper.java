package kr.or.ddit.mapper;

import kr.or.ddit.domain.facility.Facility;
import kr.or.ddit.domain.facility.FacilityScheduleVO;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface FacilityMemberMapper {

	//풀캘린더 시작-------------------------------------------------------
	@Select("SELECT * FROM FACILITY")
	List<Facility> facility();

	//일정 등록
	void insertSch(FacilityScheduleVO facilityScheduleVO);

	//일정 삭제
	void deleteSch(FacilityScheduleVO facilityScheduleVO);

	//일정 수정
	void updateSch(FacilityScheduleVO facilityScheduleVO);
	
	//일정 리스트
	List<FacilityScheduleVO> listSch(int facCd);
	//풀캘린더 끝-------------------------------------------------------

}
