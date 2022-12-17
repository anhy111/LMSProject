package EvaluationServiceImpl.java;

import kr.or.ddit.domain.facility.Facility;
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
	public List<Facility> facility() {
		return this.facilityMemberMapper.facility();
	}


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
	public List<FacilityScheduleVO> listSch(int facCd){

		return this.facilityMemberMapper.listSch(facCd);
	}
}
