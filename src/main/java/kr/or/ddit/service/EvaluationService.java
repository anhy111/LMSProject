package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Evaluation;

public interface EvaluationService {
	public List<Evaluation> studentEvaluationList(Evaluation evaluation);
	public List<Evaluation> evaluationQList();
	
	public int register(Evaluation evaluation);
}
