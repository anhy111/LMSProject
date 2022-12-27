package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.KeyIndicators;

public interface KeyIndicatorsService {
	public List<KeyIndicators> recruitmentRateList(KeyIndicators keyIndicators);
	public List<KeyIndicators> studentState(KeyIndicators keyIndicators);
	public List<KeyIndicators> evaluationList(KeyIndicators keyIndicators);
}
