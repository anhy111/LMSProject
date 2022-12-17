package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.mapper.EvaluationMapper;
import kr.or.ddit.service.EvaluationService;

@Service
public class EvaluationServiceImpl implements EvaluationService {
	
	@Autowired
	EvaluationMapper evaluationMapper;
	
	@Override
	public List<Evaluation> evaluationList() {
		return evaluationMapper.evaluationList();
	}
}
