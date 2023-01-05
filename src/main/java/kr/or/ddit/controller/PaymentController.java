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
import kr.or.ddit.service.PaymentService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private PaymentService paymentService;

	// 등록금 목록 조회
	@GetMapping("/admin/collegeFeeList")
	public String collegeFeeList(Model model) {
		List<Department> collegeFeeList = this.paymentService.collegeFeeList();

		log.info("등록금 목록 : " + collegeFeeList);

		model.addAttribute("collegeFeeList", collegeFeeList);

		return "payment/admin/collegeFeeList";
	}

	// 등록금 고지 관리
	@GetMapping("/admin/adminBill")
	public String adminBill(Model model) {
		
		model.addAttribute("bodyTitle", "등록금 고지");
		
		return "payment/admin/adminBill";
	}

	// 등록금 고지 관리 리스트
	@ResponseBody
	@PostMapping("/admin/adminBillList")
	public List<Payment> adminBillList() {
		List<Payment> adminBillList = this.paymentService.adminBillList();

		log.info("등록금 고지 목록 : " + adminBillList);

		return adminBillList;
	}

	// 등록금 고지 관리 리스트 개수
	@ResponseBody
	@PostMapping("/admin/adminBillCount")
	public int adminBillCount() {
		int result = this.paymentService.adminBillCount();

		log.info("등록금 고지 리스트 개수 : " + result);

		return result;
	}
	
	// 등록금 고지 관리 고지서 발송
	@ResponseBody
	@PostMapping("/admin/insert")
	public int insert(@RequestBody Payment payment) {
		
		int cnt = this.paymentService.insert(payment);
		
		return cnt;
	}

	// 등록금 납부 관리
	@GetMapping("/admin/adminPayment")
	public String adminPayment(Model model) {
		Payment payment = this.paymentService.sumFee();

		log.info("납부 payment : " + payment);

		model.addAttribute("payment", payment);
		model.addAttribute("bodyTitle", "등록금 납부");

		return "payment/admin/adminPayment";
	}

	// 등록금 납부 관리 리스트
	@ResponseBody
	@PostMapping("/admin/adminPaymentList")
	public List<Payment> adminPaymentList() {
		List<Payment> adminPaymentList = this.paymentService.adminPaymentList();

		log.info("등록금 납부 관리 리스트 : " + adminPaymentList);

		return adminPaymentList;
	}

	// 학생 등록금 납부내역 시작페이지
	@GetMapping("/stu/stuPaymentDetail")
	public String stuPaymentDetail(Model model) {

		model.addAttribute("bodyTitle", "등록금 납부 내역");

		return "payment/stu/stuPaymentDetail";
	}

	// 학생 등록금 납부내역 리스트
	@ResponseBody
	@PostMapping("/stu/stuPaymentList")
	public List<Payment> stuPaymentList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");

		List<Payment> stuPaymentList = this.paymentService.stuPaymentList(stuNo);

		log.info("학생 등록금 납부내역 리스트 : " + stuPaymentList);

		return stuPaymentList;
	}

	// 학생 등록금 납부내역 미납금 확인
	@ResponseBody
	@PostMapping("/stu/billCount")
	public int billCount(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");

		int cnt = this.paymentService.billCount(stuNo);

		log.info("학생 등록금 납부내역 미납자 : " + cnt);

		return cnt;
	}

	// 학생 납부확인서 펼쳐라
	@GetMapping("/stuForm/paymentConfirmation")
	public String paymentConfirmation(HttpServletRequest request, Model model, int payCd) {

		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("stuNo", stuNo);
		map.put("payCd", payCd);

		HashMap<String, Object> detail = this.paymentService.payMentDetail(map);

		model.addAttribute("detail", detail);

		return "payment/stuForm/paymentConfirmation";
	}

	// 학생 등록금 고지서 펼치기
	@GetMapping("/stuForm/payingTuition")
	public String payingTuition(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");

		HashMap<String, Object> map = this.paymentService.payingTuition(stuNo);
		map.put("stuNo", stuNo);

		model.addAttribute("map", map);

		return "payment/stuForm/payingTuition";
	}

	// 학생 등록금 납부하기
	@ResponseBody
	@PostMapping("/stuForm/pay")
	public int pay(HttpServletRequest request, int payAmt) {

		HttpSession session = request.getSession();
		int stuNo = (int) session.getAttribute("no");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stuNo", stuNo);
		map.put("payAmt", payAmt);

		int result = this.paymentService.pay(map);

		return result;
	}
	
}
