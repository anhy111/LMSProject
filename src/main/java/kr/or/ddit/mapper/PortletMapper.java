package kr.or.ddit.mapper;

import java.util.Map;

import kr.or.ddit.domain.Portlet;

public interface PortletMapper  {

	public int updatePortlet(Map<String, String> map);
	
	public Portlet memPortlet(int memNo);

}
