package kr.or.ddit.service;


import java.util.HashMap;
import java.util.Map;

import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;

public interface LectureBoardService {


	//자료실 리스트
	public Lecture dataList(String keyWord, String category,String lecaCd);
	
	//자료실 상세
	public LecData dataDetail(String ldtCd);
	
	//자료 수정
	public int dataUpdate(HashMap<String, Object> map);
	
	//자료 삭제
	public int dataDelete(String ldtCd);
	//자료 등록
	public int dataInsert1(Map<String, Object> map);
	public int dataInsert2(Map<String, Object> map);
}
