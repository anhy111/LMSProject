package kr.or.ddit.controller.validation;

import java.util.Locale;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class ValidatorController {

    @RequestMapping(value = "/bind", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        return "validator/test/home";
    }

    @RequestMapping("/check")
    public String check(User user, BindingResult result) {

        UserValidator userValidator = new UserValidator();
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "validator/test/fail";
        }
        return "validator/test/success";
    }
}