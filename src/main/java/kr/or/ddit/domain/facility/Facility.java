package kr.or.ddit.domain.facility;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Facility {

    private int facCd;
    private String facNm;

    @Override
    public String toString() {
        return "Facility{" +
                "facCd=" + facCd +
                ", facNm='" + facNm + '\'' +
                '}';
    }
}
