package kr.or.ddit.mapper;

import kr.or.ddit.domain.facility.FacilityVO;
import kr.or.ddit.domain.facility.ReservationVO;

import java.util.HashMap;
import java.util.List;

public interface ReservationMapper {
	//시설 불러오기
    List<FacilityVO> facility();
	//예약 등록
    int insert(ReservationVO vo);
	//예약 불러오기
    List<ReservationVO> list(String facCd);
	//예약 삭제
    int delete(ReservationVO vo);
	//예약 수정
    int modify(HashMap<String,Object> map);
	//과거예약 조회
    List<HashMap<String,Object>> history(ReservationVO vo);
}
