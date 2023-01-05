package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.ASchedule;
import kr.or.ddit.mapper.AScheduleMapper;
import kr.or.ddit.service.AScheduleService;

@Service
public class AScheduleServiceImpl implements AScheduleService {

	@Autowired
	AScheduleMapper aScheduleMapper;
	
	@Override
	public int register(ASchedule aSchedule) {
		return this.aScheduleMapper.register(aSchedule);
	}
	
	@Override
	public List<ASchedule> loadScheduleForMonth(ASchedule aSchedule) {
		return this.aScheduleMapper.loadScheduleForMonth(aSchedule);
	}
}
