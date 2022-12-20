package kr.or.ddit.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QnaForm {

    private Long memberNumber;

    private String title;
    private String content;
    private String accessType;

    public QnaForm() {
    }

    public QnaForm(Long memberNumber, String title, String content, String accessType) {
        this.memberNumber = memberNumber;
        this.title = title;
        this.content = content;
        this.accessType = accessType;
    }
}
