package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.domain.Approval;
import kr.or.ddit.domain.Building;
import kr.or.ddit.domain.Room;

public interface RoomService {
	public List<Room> roomByBuildingList(int bldCd);
}
