package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.domain.Allocation;
import kr.or.ddit.domain.Room;
import kr.or.ddit.domain.StudentLecture;

public interface RoomMapper {

	public List<Room> roomByBuildingList(int bldCd);
}
