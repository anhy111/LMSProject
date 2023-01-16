package kr.or.ddit.service.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public int insert(List<Integer> stuList) {
		
		sendSMS();
		
		return this.paymentMapper.insert(stuList);
	}
	
// 전달된 휴대폰 번호로 문자 전송(content : 임시비밀번호)
	public void sendSMS() {

		String temp = UUID.randomUUID().toString();
		temp = temp.substring(0, 8);
		// UUID로 임시 비밀번호 생성

		String hostNameUrl = "https://sens.apigw.ntruss.com"; // 호스트 URL
		String requestUrl = "/sms/v2/services/"; // 요청 URL
		String requestUrlType = "/messages"; // 요청 URL
		String accessKey = "PqJ487Ib8EveSOsF4gNC"; // 네이버 클라우드 플랫폼 회원에게 발급되는 개인 인증키
		String secretKey = "oECCMaoQHDHPD8lMWiIXBDc9TI4S8lIan2lkRO2z"; // 2차 인증을 위해 서비스마다 할당되는 service secret
		String serviceId = "ncp:sms:kr:297450079731:lmsproj"; // 프로젝트에 할당된 SMS 서비스 ID
		String method = "POST"; // 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); // current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		String apiUrl = hostNameUrl + requestUrl;

		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
		JSONArray toArr = new JSONArray();

		String tel = "01033157700";

//				    toJson.put("subject","");				// 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
		toJson.put("content", "2023학년도 1학기 연수대학교 본등록 1차 등록금 납부 안내\r\n" + 
				"\r\n" + 
				"1. 성             명 : 이승연\r\n" + 
				"2. 학             번 : 21715032\r\n" + 
				"3. 학 과  (전 공)  : 경제학과\r\n" + 
				"4. 등     록     금 : 2,500,000원\r\n" + 
				"5. 장     학     금 : 0원\r\n" + 
				"6. 실납부 등록금 : 2,500,000원(등록금-장학금)\r\n" + 
				"7. 기타납부금(선택) : 학생회비(0원), 교양필수교재비(0원)\r\n" + 
				"8. 등록기간 : 2023-01-13(금) ~ 2023-01-18(수)\r\n" + 
				"9. 납부방법 : 계좌이체(인터넷뱅킹, ATM, 텔레뱅킹) , 수납은행 창구납부\r\n" + 
				"10. 납부계좌 : 신한, 036190-73-374426, 이승연연수대학교\r\n" + 
				"\r\n" + 
				"■ 주의사항\r\n" + 
				" ▷ 납부계좌는 개인에게 부여된 가상계좌로 실납부 등록금과 계좌번호가 정확히 일치해야 납부 가능합니다.\r\n" + 
				" ▷ 본 알림문자는 등록금 납부 편의를 위한 약식안내로서 \r\n" + 
				"     정식 등록금고지서는 ‘연수대학교 등록/장학’-‘등록금 납부내역’"); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte/ LMS: 2000byte
		toJson.put("to", tel); // 수신번호 목록 * 최대 50개까지 한번에 전송할 수 있습니다.
		toArr.add(toJson);

		bodyJson.put("type", "lms"); // 메시지 Type (sms | lms)
		bodyJson.put("contentType", "COMM"); // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
		bodyJson.put("countryCode", "82"); // 국가 전화번호
		bodyJson.put("from", "01055395081"); // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
//				    bodyJson.put("subject","");				// 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
		bodyJson.put("content", "2023학년도 1학기 연수대학교 본등록 1차 등록금 납부 안내\r\n" + 
				"\r\n" + 
				"1. 성             명 : 이승연\r\n" + 
				"2. 학             번 : 20171532\r\n" + 
				"3. 학 과  (전 공)  : 경제학과\r\n" + 
				"4. 등     록     금 : 2,500,000원\r\n" + 
				"5. 장     학     금 : 0원\r\n" + 
				"6. 실납부 등록금 : 2,500,000원(등록금-장학금)\r\n" + 
				"7. 기타납부금(선택) : 학생회비(0원), 교양필수교재비(0원)\r\n" + 
				"8. 등록기간 : 2023-01-13(금) ~ 2023-01-18(수)\r\n" + 
				"9. 납부방법 : 계좌이체(인터넷뱅킹, ATM, 텔레뱅킹) , 수납은행 창구납부\r\n" + 
				"10. 납부계좌 : 신한, 036190-73-374426, 이승연연수대학교\r\n" + 
				"\r\n" + 
				"■ 주의사항\r\n" + 
				" ▷ 납부계좌는 개인에게 부여된 가상계좌로 실납부 등록금과 계좌번호가 정확히 일치해야 납부 가능합니다.\r\n" + 
				" ▷ 본 알림문자는 등록금 납부 편의를 위한 약식안내로서 \r\n" + 
				"     정식 등록금고지서는 ‘연수대학교 등록/장학’-‘등록금 납부내역’"); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
		bodyJson.put("messages", toArr);

		String body = bodyJson.toJSONString();

		System.out.println(body);

		try {

			URL url = new URL(apiUrl);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setUseCaches(false);
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setRequestProperty("content-type", "application/json");
			con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
			con.setRequestProperty("x-ncp-iam-access-key", accessKey);
			con.setRequestProperty("x-ncp-apigw-signature-v2", 
					makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
			con.setRequestMethod(method);
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());

			wr.write(body.getBytes());
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode" + " " + responseCode);
			if (responseCode == 202) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// encodeBase64String 생성
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey)
			throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " "; // one space
		String newLine = "\n"; // new line

		String message = method + space + url + newLine + timestamp +
                newLine + accessKey;

		SecretKeySpec signingKey;
		String encodeBase64String;

        signingKey = new SecretKeySpec(secretKey.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);
        byte[] rawHmac = mac.doFinal(message.getBytes(StandardCharsets.UTF_8));
        encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);

        return encodeBase64String;
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
