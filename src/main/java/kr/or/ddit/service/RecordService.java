package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Record;

public interface RecordService {

	//신청
	public int RecordApply(Record record);
	//학적변동조회(신청목록조회)
	public List<Record> RecordList(int stuNo);

}
