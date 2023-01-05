package kr.or.ddit.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.Payment;
import kr.or.ddit.mapper.PaymentMapper;
import kr.or.ddit.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper paymentMapper;

	@Override
	public List<Department> collegeFeeList() {
		return this.paymentMapper.collegeFeeList();
	}

	@Override
	public List<Payment> adminBillList() {
		return this.paymentMapper.adminBillList();
	}

	@Override
	public int adminBillCount() {
		return this.paymentMapper.adminBillCount();
	}
	
	@Override
	public int insert(Payment payment) {
		return this.paymentMapper.insert(payment);
	}

	@Override
	public Payment sumFee() {
		return this.paymentMapper.sumFee();
	}

	@Override
	public List<Payment> adminPaymentList() {
		return this.paymentMapper.adminPaymentList();
	}

	@Override
	public List<Payment> stuPaymentList(int stuNo) {
		return this.paymentMapper.stuPaymentList(stuNo);
	}

	@Override
	public int billCount(int stuNo) {
		return this.paymentMapper.billCount(stuNo);
	}

	@Override
	public HashMap<String, Object> payMentDetail(HashMap<String, Integer> map) {
		return this.paymentMapper.payMentDetail(map);
	}

	@Override
	public HashMap<String, Object> payingTuition(int stuNo) {
		return this.paymentMapper.payingTuition(stuNo);
	}

	@Override
	public int pay(Map<String, Object> map) {
		return this.paymentMapper.pay(map);
	}
}
