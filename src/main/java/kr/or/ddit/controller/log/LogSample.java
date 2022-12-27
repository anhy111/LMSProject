package kr.or.ddit.controller.log;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class LogSample {

    private Long id;
    private String ip;
    private String method;
    private Date regdate;

    @Override
    public String toString() {
        return "LogSample{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", method='" + method + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}
