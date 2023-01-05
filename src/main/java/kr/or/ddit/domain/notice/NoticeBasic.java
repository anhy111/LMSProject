package kr.or.ddit.domain.notice;


import kr.or.ddit.domain.Attach;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter @Setter
public class NoticeBasic {

    private Long noticeCd; //공지사항 코드
    private String noticeTtl; //공지사항 제목
    private String noticeCon; //공지사항 내용
    private Date noticeReg; // 작성일자
    private Date noticeUpd; //수정일자

    private Long noticeHit; // 조회수

    private int atchFileId; //첨부파일 아이디

    private List<Attach> attachList; //첨부파일 리스트


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
                ", noticeHit=" + noticeHit +
                '}';
    }
}
