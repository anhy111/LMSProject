package kr.or.ddit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Allocation {

	private int roomCd;
	private int lecaCd;
	private String altDt;
	private Date altSt;
	private Date altEn;
}
