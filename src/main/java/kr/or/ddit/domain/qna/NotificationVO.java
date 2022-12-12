package kr.or.ddit.domain.qna;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import java.util.Date;

@Getter @Setter
public class NotificationVO {

    private int ntfCd;

    private int memCd;

    private String ntfCon;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")

    private Date ntfTm;

    private int ntfYn;

    private String ntfUrl;


    @Override
    public String toString() {

        return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
    }
}
