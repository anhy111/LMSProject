package kr.or.ddit.domain.qna;

import com.fasterxml.jackson.annotation.JsonFormat;
import kr.or.ddit.domain.facility.MemberVO;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.HtmlUtils;

import java.util.Date;

@Getter @Setter
public class QnaVO {

    private int qnaCd;

    private int memCd;

    private String qnaTtl;

    private String qnaCon;

    private int qnaYn;

    @DateTimeFormat(pattern = "yyyymmdd")

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")

    private Date qnaDt;

    private int qnaHit;

    private int rnum;

    private QnaReplyVO qnaReplyVO;

    private MemberVO memberVO;


    public String getqnaConDisplay() {
        String result = null;
        if (!GenericValidator.isBlankOrNull(this.qnaCon)) {
            result = HtmlUtils.htmlUnescape(this.qnaCon);
        }
        return result;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
    }

}
