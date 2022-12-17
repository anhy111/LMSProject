package EvaluationServiceImpl.java;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Record;
import kr.or.ddit.mapper.RecordMapper;
import kr.or.ddit.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService{
	@Autowired
	RecordMapper recordMapper;
	
	//신청
	@Override
	public int RecordApply(Record record) {
		return this.recordMapper.RecordApply(record);
	}
	//학적변동조회(신청목록조회)
	@Override
	public List<Record> RecordList(int stuNo){
		return this.recordMapper.RecordList(stuNo);
	}
}
