package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.CommonDetail;
import kr.or.ddit.mapper.CommonDetailMapper;
import kr.or.ddit.service.CommonDetailService;

@Service
public class CommonDetailServiceImpl implements CommonDetailService{
	
	@Autowired
	CommonDetailMapper commonDetailMapper;
	
	@Override
	public List<CommonDetail> commonDetailList(String comCd) {
		return this.commonDetailMapper.commonDetailList(comCd);
	}
	//상세공통코드에 따른 공통코드상세명
	@Override
	public CommonDetail comdNmConvert(String comdCd) {
		return this.commonDetailMapper.comdNmConvert(comdCd);
	}
}
