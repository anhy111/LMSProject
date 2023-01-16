package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.KeyIndicators;

public interface KeyIndicatorsMapper {
	// 신입생 충원률
	public List<KeyIndicators> recruitmentRateList(KeyIndicators keyIndicators);
	// 학생 학적현황
	public List<KeyIndicators> studentState(KeyIndicators keyIndicators);
	// 수강평가 평점평균
	public List<KeyIndicators> evaluationList(KeyIndicators keyIndicators);
}
