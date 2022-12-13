package kr.or.ddit.service.Impl;

import kr.or.ddit.domain.facility.FacilityVO;
import kr.or.ddit.domain.facility.ReservationVO;
import kr.or.ddit.mapper.ReservationMapper;
import kr.or.ddit.service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;


	@Override
	public List<FacilityVO> facility() {
		return reservationMapper.facility();
	}

	@Override
	public int insert(ReservationVO vo) {
		return reservationMapper.insert(vo);
	}

	@Override
	public List<ReservationVO> list(String facCd) {
		return reservationMapper.list(facCd);
	}

	@Override
	public int delete(ReservationVO vo) {
		return reservationMapper.delete(vo);
	}

	@Override
	public int modify(HashMap<String, Object> map) {
		return reservationMapper.modify(map);
	}

	@Override
	public List<HashMap<String,Object>> history(ReservationVO vo) {
		return reservationMapper.history(vo);
	}


}
