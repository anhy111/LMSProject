package kr.or.ddit.service;

import kr.or.ddit.domain.facility.FacilityVO;
import kr.or.ddit.domain.facility.ReservationVO;

import java.util.HashMap;
import java.util.List;

public interface ReservationService {
	//시설목록 조회
    List<FacilityVO> facility();
	//예약 등록하기
    int insert(ReservationVO vo);
	//예약 불러오기
    List<ReservationVO> list(String facCd);
	//예약 삭제하기
    int delete(ReservationVO vo);
	//예약 수정하기
    int modify(HashMap<String,Object> map);
	//과거 예약내역 불러오기
    List<HashMap<String,Object>> history(ReservationVO vo);

}
