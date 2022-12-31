package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.BuildingMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.BuildingService;

@Service
public class BuildingServiceImpl implements BuildingService{
	
	@Autowired
	BuildingMapper buildingMapper;
	
	@Override
	public List<Building> buildingByLectureList(int lecaCd) {
		return this.buildingMapper.buildingByLectureList(lecaCd);
	}
	
	@Override
	public List<Building> buildingByProfessorList(int proNo) {
		return this.buildingMapper.buildingByProfessorList(proNo);
	}
}
