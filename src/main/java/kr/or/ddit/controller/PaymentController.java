package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.domain.Department;
import kr.or.ddit.domain.LecApply;
import kr.or.ddit.domain.Payment;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;
import kr.or.ddit.domain.Weekplan;
import kr.or.ddit.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService paymentService;
	
	//등록금 목록 조회
	@GetMapping("/collegeFeeList")
	public String collegeFeeList(Model model){
		List<Department> collegeFeeList = this.paymentService.collegeFeeList();
		
		log.info("등록금 목록 : " + collegeFeeList);
		
		model.addAttribute("collegeFeeList", collegeFeeList);
		
		return "payment/collegeFeeList";
	}
	
	//등록금 고지 관리
	@GetMapping("/adminBill")
	public String adminBill() {
		
		return "payment/adminBill";
	}
	
	//등록금 고지 관리 리스트
	@ResponseBody
	@PostMapping("/adminBillList")
	public List<Payment> adminBillList() {
		List<Payment> adminBillList = this.paymentService.adminBillList();
		
		log.info("등록금 고지 목록 : " + adminBillList);
		
		return adminBillList;
	}
	
	//등록금 고지 관리 리스트 개수
	@ResponseBody
	@PostMapping("/adminBillCount")
	public int adminBillCount() {
		int result = this.paymentService.adminBillCount();
		
		log.info("등록금 고지 리스트 개수 : " + result);
		
		return result;
	}

	//등록금 납부 관리
	@GetMapping("/adminPayment")
	public String adminPayment(Model model) {
		Payment payment = this.paymentService.sumFee();
		
		log.info("납부 payment : " + payment);
		
		model.addAttribute("payment", payment);
		
		return "payment/adminPayment";
	}
	
	//등록금 납부 관리 리스트
	@ResponseBody
	@PostMapping("/adminPaymentList")
	public List<Payment> adminPaymentList() {
		List<Payment> adminPaymentList = this.paymentService.adminPaymentList();
		
		log.info("등록금 납부 관리 리스트 : " + adminPaymentList);
		
		return adminPaymentList;
	}
	
	//학생 등록금 납부내역 시작페이지
	@GetMapping("/stuPaymentDetail")
	public String stuPaymentDetail(Model model) {
		
		model.addAttribute("bodyTitle", "등록금 납부 내역");
		
		return "payment/stuPaymentDetail";
	}
	
	//학생 등록금 납부내역 리스트
	@ResponseBody
	@PostMapping("stuPaymentList")
	public List<Payment> stuPaymentList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		
		List<Payment> stuPaymentList = this.paymentService.stuPaymentList(stuNo);
		
		log.info("학생 등록금 납부내역 리스트 : " + stuPaymentList);
		
		return stuPaymentList;
	}

	//학생 등록금 납부내역 미납금 확인
	@ResponseBody
	@PostMapping("billCount")
	public int billCount(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		
		int cnt = this.paymentService.billCount(stuNo);
		
		log.info("학생 등록금 납부내역 미납자 : " + cnt);
		
		return cnt;
	}
	
	//납부확인서 이동(관련 파라미터 넘긱기)
	@GetMapping("/paymentConfirmation")
	public String paymentConfirmation(HttpServletRequest request, Model model, int payCd) {
		
		HttpSession session = request.getSession();
		int stuNo = (int)session.getAttribute("no");
		
		Student student = this.paymentService.paymentFormStuInfo(stuNo);
		List<Payment> paymentList = this.paymentService.paymentFormInfo(payCd);
		List<Department> departmentList = this.paymentService.paymentFormDepInfo(payCd);
		
		model.addAttribute("student", student);
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("departmentList", departmentList);
		
		return "payment/paymentConfirmation";
	}
	
}
