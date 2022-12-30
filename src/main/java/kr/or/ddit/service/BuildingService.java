package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;

public interface BuildingService {

	public List<Building> buildingByLectureList(int lecaCd);

	public List<Building> buildingByProfessorList(int proNo);
}
