package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.AllTimeLectures;

public interface AllTimeLecturesMapper {
	
	//역대 전체 강의 조회
	public List<AllTimeLectures> AllTimeLectrueList(AllTimeLectures atls);
}
