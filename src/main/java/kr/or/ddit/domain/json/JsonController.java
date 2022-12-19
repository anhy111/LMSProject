package kr.or.ddit.domain.json;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class JsonController {

    @PostMapping("/json01")
    public HttpEntity<String> requestBody(HttpEntity<String> httpEntity) {
        String messageBody = httpEntity.getBody();
        log.info("message body: " + messageBody);

        return new HttpEntity<>("ok");
    }

    @ResponseBody
    @PostMapping("/requestBodyV4")
    public String requestBodyV4(@RequestBody String messageBody) {
        log.info("message body: " + messageBody);
        return "ok";
    }

}

