package kr.or.ddit.service.impl;

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
  //[상담테이블] (신청 목록 조회) 단, 상담에 추가된 학적신청 번호는 제외
	@Override
    public List<Record> counselFilteredRecordList(int stuNo){
    	return this.recordMapper.counselFilteredRecordList(stuNo);
    }
}
