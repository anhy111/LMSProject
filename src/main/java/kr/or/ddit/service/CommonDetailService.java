package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.CommonDetail;

public interface CommonDetailService {

	//공통코드상세 목록
	public List<CommonDetail> commonDetailList(String comCd);
	//상세공통코드에 따른 공통코드상세명
	public CommonDetail comdNmConvert(String comdCd);
}
