package kr.or.ddit.domain.qna.qnareply;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@Setter
public class QnaReply {

    private Long qnaCd;

    private String qnarCon;

    @DateTimeFormat(pattern = "yyyymmdd")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private Date qnarDt;


    public QnaReply(Long parentId, String content) {
        this.qnaCd = parentId;
        this.qnarCon = content;
    }
}
