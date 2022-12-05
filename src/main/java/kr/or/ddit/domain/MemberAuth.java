package kr.or.ddit.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MemberAuth {
    private int memNo;
    private String auth;

    public MemberAuth() {
    }

    @Override
    public String toString() {
        return "MemberAuthVO [memNo=" + memNo + ", auth=" + auth + "]";
    }


}
