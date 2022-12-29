package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Record;

public interface RecordService {

	//신청
    public int RecordApply(Record record);
	//학적변동조회(신청목록조회)
    public List<Record> RecordList(int stuNo);
    //학적신청 수정
    public int modifyRecordByStudent(Record record);
    //학적신청 삭제
    public int deleteRecordByStudent(int recCd);
    //[상담테이블] (신청 목록 조회) 단, 상담에 추가된 학적신청 번호는 제외
	public List<Record> counselFilteredRecordList(int stuNo);
    //학적신청정보 상세보기
	public Record detailRecord(int recCd);

}
