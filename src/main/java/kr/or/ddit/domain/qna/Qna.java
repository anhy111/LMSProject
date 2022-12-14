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

    public Qna(String qnaTtl, String qnaCon) {
        this.qnaTtl = qnaTtl;
        this.qnaCon = qnaCon;
    }

    @Override
    public String toString() {
        return "Qna{" +
                "qnaCd=" + qnaCd +
                ", memNo=" + memNo +
                ", qnaTtl='" + qnaTtl + '\'' +
                ", qnaCon='" + qnaCon + '\'' +
                ", qnaDt=" + qnaDt +
                ", qnaYn=" + qnaYn +
                '}';
    }
}
