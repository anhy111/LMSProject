package kr.or.ddit.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Portlet;
import kr.or.ddit.mapper.PortletMapper;
import kr.or.ddit.service.PortletService;

@Service
public class PortletServiceImpl implements PortletService{

	@Autowired
	PortletMapper portletMapper;
	
	@Override
	public int updatePortlet(Map<String, String> map) {
		return this.portletMapper.updatePortlet(map);
	}
	
	@Override
	public Portlet memPortlet(int memNo) {
		return this.portletMapper.memPortlet(memNo);
	}
	
}
