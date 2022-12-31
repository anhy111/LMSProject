package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.domain.Room;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.BuildingMapper;
import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.service.ApprovalService;
import kr.or.ddit.service.BuildingService;
import kr.or.ddit.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	RoomMapper roomMapper;
	
	@Override
	public List<Room> roomByBuildingList(int bldCd) {
		return this.roomMapper.roomByBuildingList(bldCd);
	}
}
