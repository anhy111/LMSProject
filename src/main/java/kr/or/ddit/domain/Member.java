package kr.or.ddit.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Member implements Serializable {

    private int memNo;
    private String memTel;
    private String memPass;
    private String depCd;
    //1:N
    private List<MemberAuth> memberAuthList;


    @Override
    public String toString() {
        return "MemberVO [memNo=" + memNo + ", memTel=" + memTel + ", memPass=" + memPass + ", memberAuthList="
                + memberAuthList + "]";
    }


}
