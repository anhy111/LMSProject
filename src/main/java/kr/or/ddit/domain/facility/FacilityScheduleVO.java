package kr.or.ddit.domain.facility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FacilityScheduleVO {


	private int memNo; // 유저번호
	private int rsvCd; //시퀀스) 시설예약 코드
	private int facCd; //시설 코드
	private String rsvSt; //예약 시작 일자
	private String rsvEn; //예약 종료 일자
	private String backgroundColor;

	public FacilityScheduleVO() {
	}

	@Override
	public String toString() {
		return "FacilityScheduleVO{" +
				"memNo=" + memNo +
				", rsvCd=" + rsvCd +
				", facCd=" + facCd +
				", rsvSt=" + rsvSt +
				", rsvEn=" + rsvEn +
				", backgroundColor='" + backgroundColor + '\'' +
				'}';
	}
}
