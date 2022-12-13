package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.AllTimeLectures;
import kr.or.ddit.mapper.AllTimeLecturesMapper;
import kr.or.ddit.service.AllTimeLecturesService;

@Service
public class AllTimeLecturesServiceImpl implements AllTimeLecturesService{
	@Autowired
	AllTimeLecturesMapper allTimeLecutresMapper;
	
	//역대 전체 강의 조회
	@Override
	public List<AllTimeLectures> AllTimeLectrueList(AllTimeLectures atls){
		return this.allTimeLecutresMapper.AllTimeLectrueList(atls);
	}
}
