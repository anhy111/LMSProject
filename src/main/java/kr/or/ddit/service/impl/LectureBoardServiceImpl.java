package kr.or.ddit.service.impl;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.LecData;
import kr.or.ddit.domain.Lecture;
import kr.or.ddit.mapper.LectureBoardMapper;
import kr.or.ddit.service.LectureBoardService;

@Service
public class LectureBoardServiceImpl implements LectureBoardService{
	@Inject
	LectureBoardMapper lectureBoardMapper;
	
	//자료실 리스트
	@Override
	public Lecture dataList(String keyWord, String category,String lecaCd){
		return this.lectureBoardMapper.dataList(keyWord, category, lecaCd);
	}
	//자료실 상세
	@Override
	public LecData dataDetail(String ldtCd) {
		return this.lectureBoardMapper.dataDetail(ldtCd);
	}
	
	//자료 수정
	@Override
	public int dataUpdate(HashMap<String, Object> map) {
		return this.lectureBoardMapper.dataUpdate(map);
	}
	//자료 삭제
	@Override
	public int dataDelete(String ldtCd) {
		return this.lectureBoardMapper.dataDelete(ldtCd);
	}
	
	//자료 등록
	@Override
	public int dataInsert1(Map<String, Object> map) {
		return this.lectureBoardMapper.dataInsert1(map);
	}
	@Override
	public int dataInsert2(Map<String, Object> map) {
		return this.lectureBoardMapper.dataInsert2(map);
	}
	
}
