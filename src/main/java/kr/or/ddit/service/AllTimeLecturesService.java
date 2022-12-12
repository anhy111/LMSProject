package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.AllTimeLectures;

public interface AllTimeLecturesService {
	
	//역대 전체 강의 조회
	public List<AllTimeLectures> AllTimeLectrueList(AllTimeLectures atls);

}
