package kr.or.ddit.domain.qna;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter @Setter
public class Qna {

    private Long qnaCd;
    private Long memNo;
    private String qnaTtl;
    private String qnaCon;
    private Date qnaDt;
    private int qnaYn;

    public Qna() {
    }

    public Qna(String qnaTtl, String qnaCon, int qnaYn) {
        this.qnaTtl = qnaTtl;
        this.qnaCon = qnaCon;
        this.qnaYn = qnaYn;
    }
}
