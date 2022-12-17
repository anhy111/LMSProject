package kr.or.ddit.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QnaForm {

    private String title;
    private String content;
    private String accessType;

    public QnaForm() {
    }

    public QnaForm(String title, String content, String accessType) {
        this.title = title;
        this.content = content;
        this.accessType = accessType;
    }
}
