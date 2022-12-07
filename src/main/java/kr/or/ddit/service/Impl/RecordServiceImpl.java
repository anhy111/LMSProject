package kr.or.ddit.service.Impl;

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
}
