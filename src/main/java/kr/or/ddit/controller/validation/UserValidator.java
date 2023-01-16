package kr.or.ddit.controller.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserValidator implements Validator{

    @Override
    public boolean supports(Class<?> clazz) {
        // TODO Auto-generated method stub
        return User.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        String userId = user.getId();
        String userPw = user.getPw();
        if(userId == null || userId.trim().isEmpty()) {
            errors.rejectValue("id", "null or empty id value"); // 문제가 있는 프로퍼티와 에러 메시지를 함께 등록
        }
        if(userPw == null || userPw.trim().isEmpty()) {
            errors.rejectValue("pw", "null or empty pw value");
        }
    }

}