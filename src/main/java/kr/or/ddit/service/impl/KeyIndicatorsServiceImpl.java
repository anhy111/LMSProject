package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.KeyIndicators;
import kr.or.ddit.mapper.KeyIndicatorsMapper;
import kr.or.ddit.service.KeyIndicatorsService;

@Service
public class KeyIndicatorsServiceImpl implements KeyIndicatorsService {
	
	@Autowired
	KeyIndicatorsMapper keyIndicatorsMapper;
	
	@Override
	public List<KeyIndicators> recruitmentRateList(KeyIndicators keyIndicators) {
		return this.keyIndicatorsMapper.recruitmentRateList(keyIndicators);
	}
	
	@Override
	public List<KeyIndicators> studentState(KeyIndicators keyIndicators) {
		return this.keyIndicatorsMapper.studentState(keyIndicators);
	}
}	
