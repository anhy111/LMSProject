package kr.or.ddit.domain;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Member implements Serializable {

    private int memNo;
    private String memMl;
    private String memPass;
    //1:N
    private List<MemberAuth> memberAuthList;

    public Member() {
    }

    @Override
    public String toString() {
        return "MemberVO [memNo=" + memNo + ", memMl=" + memMl + ", memPass=" + memPass + ", memberAuthList="
                + memberAuthList + "]";
    }


}
