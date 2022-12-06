package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Counsel;
import kr.or.ddit.mapper.CounselMapper;
import kr.or.ddit.service.CounselService;

@Service
public class CounselServiceImpl implements CounselService {
	@Autowired
	CounselMapper counselMapper;
	
	//상담 목록
	@Override
	public List<Counsel> CounselList(){
		return this.counselMapper.CounselList();
	}
}
