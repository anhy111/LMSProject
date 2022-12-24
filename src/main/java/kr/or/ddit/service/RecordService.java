package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Record;

public interface RecordService {

	//신청
    public int RecordApply(Record record);
	//학적변동조회(신청목록조회)
    public List<Record> RecordList(int stuNo);
    //[상담테이블] (신청 목록 조회) 단, 상담에 추가된 학적신청 번호는 제외
	public List<Record> counselFilteredRecordList(int stuNo);

}
