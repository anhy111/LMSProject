package kr.or.ddit.service;

import java.util.Map;

import kr.or.ddit.domain.Portlet;

public interface PortletService {

	public int updatePortlet(Map<String, String> map);

	public Portlet memPortlet(int memNo);


}
