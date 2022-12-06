package kr.or.ddit.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class Member {

    private int memNo;
    private String memMl;
    private String memPass;
    //1:N
    private List<MemberAuth> memberAuthVOList;

    public Member() {
    }

    @Override
    public String toString() {
        return "MemberVO [memNo=" + memNo + ", memMl=" + memMl + ", memPass=" + memPass + ", memberAuthVOList="
                + memberAuthVOList + "]";
    }


}
