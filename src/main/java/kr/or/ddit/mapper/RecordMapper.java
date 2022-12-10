package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Record;

public interface RecordMapper {
	
	//신청
	public int RecordApply(Record record);
	//학적변동조회(신청목록조회)
	public List<Record> RecordList(int stuNo);
}
