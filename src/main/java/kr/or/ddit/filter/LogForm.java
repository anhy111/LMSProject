package kr.or.ddit.filter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LogForm {
    private String id;
    private String attachNumber;

    public LogForm(String id, String attachNumber) {
        this.id = id;
        this.attachNumber = attachNumber;
    }
}
