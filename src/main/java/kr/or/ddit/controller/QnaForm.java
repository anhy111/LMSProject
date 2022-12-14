package kr.or.ddit.controller;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class QnaForm {

    private String title;
    private String content;
    private int accessNumber;

    public QnaForm() {
    }

    public QnaForm(String title, String content, int accessNumber) {
        this.title = title;
        this.content = content;
        this.accessNumber = accessNumber;
    }
}
