package kr.or.ddit.domain.qna;

import com.fasterxml.jackson.annotation.JsonFormat;
import kr.or.ddit.domain.Member;
import kr.or.ddit.domain.qna.qnareply.QnaReply;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.validator.GenericValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;

@Getter @Setter
public class Qna {

    private Long qnaCd;
    private Long memNo;
    private String qnaTtl;
    private String qnaCon;
    @DateTimeFormat(pattern = "yyyymmdd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date qnaDt;
    private String qnaYn;

    private int rnum;

    private Long qnaHit;

    private QnaReply qnaReplyVO;

    private Member memberVO;

    public Qna() {
    }

    public Qna(Long memNo, String qnaTtl, String qnaCon, String qnaYn) {
        this.memNo = memNo;
        this.qnaTtl = qnaTtl;
        this.qnaCon = qnaCon;
        this.qnaYn = qnaYn;
    }

    public String getqnaConDisplay() {
        String result = null;
        if(!GenericValidator.isBlankOrNull(this.qnaCon)) {
            result = HtmlUtils.htmlUnescape(this.qnaCon);
        }
        return result;
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
                ", qnaReplyVO=" + qnaReplyVO +
                '}';
    }
}
