package kr.or.ddit.domain.qna;

import com.fasterxml.jackson.annotation.JsonFormat;
import kr.or.ddit.domain.qna.qnareply.QnaReply;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter @Setter
public class Qna {

    private Long qnaCd;
    private Long memNo;

    private String stuNm; // 학생이름
    private String qnaTtl;
    private String qnaCon;
    @DateTimeFormat(pattern = "yyyymmdd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date qnaDt;
    private String qnaYn;

    private Long qnaHit;

    private QnaReply qnaReplyVO; // 댓글 하나
    private int qnaReplyCount;
    private List<QnaReply> qnaReplyList; // 댓글 여러개

//    private Member memberVO;

    public Qna(Long memNo, String qnaTtl, String qnaCon, String qnaYn) {
        this.memNo = memNo;
        this.qnaTtl = qnaTtl;
        this.qnaCon = qnaCon;
        this.qnaYn = qnaYn;
    }
}
