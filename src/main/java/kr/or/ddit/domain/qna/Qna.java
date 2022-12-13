package kr.or.ddit.domain.qna;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Qna {

    private Long qnaCd;
    private String qnaTitle;
    private String qnaContent;
    private Date noticeRegDate;
    private int accessNumber;

    public Qna() {
    }

    public Qna(String title, String content, int access) {
    }

}
