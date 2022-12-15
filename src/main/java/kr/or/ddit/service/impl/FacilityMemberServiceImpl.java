package kr.or.ddit.service.impl;

import kr.or.ddit.domain.facility.FacilityScheduleVO;
import kr.or.ddit.mapper.FacilityMemberMapper;
import kr.or.ddit.service.FacilityMemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class FacilityMemberServiceImpl implements FacilityMemberService {
	
	private final FacilityMemberMapper facilityMemberMapper;
	
	@Override
	public void insertSch(FacilityScheduleVO facilityScheduleVO) {
		this.facilityMemberMapper.insertSch(facilityScheduleVO);
	}
	
	//일정 삭제
	@Override
	public void deleteSch(FacilityScheduleVO facilityScheduleVO) {
		this.facilityMemberMapper.deleteSch(facilityScheduleVO);
	}

	//일정 리스트
	@Override
	public List<FacilityScheduleVO> listSch(){

		return this.facilityMemberMapper.listSch();
	}
}
