package kr.or.ddit.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class MemberAuth implements Serializable {
    private int memNo;
    private String auth;

    public MemberAuth() {
    }

    @Override
    public String toString() {
        return "MemberAuthVO [memNo=" + memNo + ", auth=" + auth + "]";
    }


}
