package kr.or.ddit.domain.notice;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
public class NoticeBasic {

    private Long noticeCd; //강의 공지사항 코드
    private String noticeTtl; //강의 공지사항 제목
    private String noticeCon; //강의 공지사항 내용
    private Date noticeReg; // 작성일자
    private Date noticeUpd; //수정일자

    public NoticeBasic() {
    }

    public NoticeBasic(String noticeTtl, String noticeCon) {
        this.noticeTtl = noticeTtl;
        this.noticeCon = noticeCon;
    }

    @Override
    public String toString() {
        return "NoticeBasic{" +
                "noticeCd=" + noticeCd +
                ", noticeTtl='" + noticeTtl + '\'' +
                ", noticeCon='" + noticeCon + '\'' +
                ", noticeReg=" + noticeReg +
                ", noticeUpd=" + noticeUpd +
                '}';
    }
}
