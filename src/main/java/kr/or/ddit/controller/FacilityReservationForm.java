package kr.or.ddit.controller;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class FacilityReservationForm {

    private int memNo; // 유저번호
    private Date startdt; //예약 시작 일자
    private Date enddt; //예약 종료 일자
    private String backgroundColor;

    @Override
    public String toString() {
        return "FacilityReservationForm{" +
                "memNo=" + memNo +
                ", startdt=" + startdt +
                ", enddt=" + enddt +
                ", backgroundColor='" + backgroundColor + '\'' +
                '}';
    }
}
