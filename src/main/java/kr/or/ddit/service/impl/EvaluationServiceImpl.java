package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Evaluation;
import kr.or.ddit.mapper.EvaluationMapper;
import kr.or.ddit.service.EvaluationService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class EvaluationServiceImpl implements EvaluationService {
	
	@Autowired
	EvaluationMapper evaluationMapper;
	
	@Override
	public List<Evaluation> evaluationList(Evaluation evaluation) {
		return this.evaluationMapper.evaluationList(evaluation);
	}
	
	@Override
	public List<Evaluation> evaluationQList() {
		return this.evaluationMapper.evaluationQList();
	}
	
	@Override
	public int register(Evaluation evaluation) {
		return this.evaluationMapper.register(evaluation);
	}
}
