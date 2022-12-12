package kr.or.ddit.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.CommonDetail;

public interface CommonDetailMapper {
	
	//공통코드상세 목록
	public List<CommonDetail> commonDetailList(String comCd);
}
