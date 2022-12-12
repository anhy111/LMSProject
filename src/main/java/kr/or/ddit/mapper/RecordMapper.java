package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Record;

public interface RecordMapper {

	//신청
    int RecordApply(Record record);
	//학적변동조회(신청목록조회)
    List<Record> RecordList(int stuNo);
}
