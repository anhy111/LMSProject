package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;

public interface BuildingMapper {

	public List<Building> buildingByLectureList(int lecaCd);
	
	public List<Building> buildingByProfessorList(int proNo);
}
