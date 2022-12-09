package kr.or.ddit.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Credit;
import kr.or.ddit.mapper.CreditMapper;
import kr.or.ddit.service.CreditService;

@Service
public class CreditServiceImpl  implements CreditService{
	
	@Autowired
	CreditMapper creditMapper;
	
	@Override
	public List<Credit> list() {
		return this.creditMapper.list();
	}
}
