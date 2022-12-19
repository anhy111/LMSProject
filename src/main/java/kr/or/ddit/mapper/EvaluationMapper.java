package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Evaluation;

public interface EvaluationMapper {
	public List<Evaluation> evaluationList(Evaluation evaluation);
	public List<Evaluation> evaluationQList();
	
	public int register(Evaluation evaluation);
}
