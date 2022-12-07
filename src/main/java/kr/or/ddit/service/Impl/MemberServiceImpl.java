package kr.or.ddit.service.Impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
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

import kr.or.ddit.domain.Employee;
import kr.or.ddit.domain.Manager;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.Professor;
import kr.or.ddit.domain.Student;
import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	@Override
	public Member read(int memNo) {
		return this.memberMapper.read(memNo);
	}

	@Override
	public Student readStudent(int memNo) {
		return this.memberMapper.readStudent(memNo);
	}

	@Override
	public Employee readEmployee(int memNo) {
		return this.memberMapper.readEmployee(memNo);
	}

	@Override
	public Manager readManager(int memNo) {
		return this.memberMapper.readManager(memNo);
	}

	@Override
	public Professor readProfessor(int memNo) {
		return this.memberMapper.readProfessor(memNo);
	}

	@Override
	public String searchId(HashMap<String, String> map) {
		return this.memberMapper.searchId(map);
	}

	// 임시비밀번호로 수정
	public String changePw(Map<String, String> map) {

		// 전달된 휴대폰 번호로 문자 전송(content : 임시비밀번호)
		String temp = sendSMS(map);

		map.put("memPass", temp);
		map.put("memTel", map.get("tel"));
		map.put("memNo", map.get("memNo"));
		log.info("map(완료) : " + map);

		this.memberMapper.changePw(map);

		return temp;
	}

	// 전달된 휴대폰 번호로 문자 전송(content : 임시비밀번호)
	public String sendSMS(Map<String, String> map) {

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

		String tel = map.get("tel");

//			    toJson.put("subject","");				// 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
		toJson.put("content", "<연수대>임시비밀번호[" + temp + "]로 비밀번호가 변경되었습니다."); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte/ LMS: 2000byte
		toJson.put("to", tel.replace("-", "")); // 수신번호 목록 * 최대 50개까지 한번에 전송할 수 있습니다.
		toArr.add(toJson);

		bodyJson.put("type", "sms"); // 메시지 Type (sms | lms)
		bodyJson.put("contentType", "COMM"); // 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
		bodyJson.put("countryCode", "82"); // 국가 전화번호
		bodyJson.put("from", "01055395081"); // 발신번호 * 사전에 인증/등록된 번호만 사용할 수 있습니다.
//			    bodyJson.put("subject","");				// 메시지 제목 * LMS Type에서만 사용할 수 있습니다.
		bodyJson.put("content", "<연수대>임시비밀번호[" + temp + "]로 비밀번호가 변경되었습니다."); // 메시지 내용 * Type별로 최대 byte 제한이 다릅니다.* SMS: 80byte / LMS: 2000byte
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

			System.out.println(response.toString());

			return temp;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	// encodeBase64String 생성
	public static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey)
			throws NoSuchAlgorithmException, InvalidKeyException {
		String space = " "; // one space
		String newLine = "\n"; // new line

		String message = new StringBuilder().append(method).append(space).append(url).append(newLine).append(timestamp)
				.append(newLine).append(accessKey).toString();

		SecretKeySpec signingKey;
		String encodeBase64String;
		try {

			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			encodeBase64String = e.toString();
		}

		return encodeBase64String;
	}

}
