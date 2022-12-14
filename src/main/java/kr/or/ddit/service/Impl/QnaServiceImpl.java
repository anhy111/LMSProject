package kr.or.ddit.service.Impl;

import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.QnaVO;
import kr.or.ddit.mapper.QnaMapper;
import kr.or.ddit.service.QnaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {

    private final QnaMapper qnaMapper;

    @Override
    public int getQnaTotalRow() {
        return this.qnaMapper.getQnaTotalRow();
    }

    @Override
    public void qnaSave(Qna qna) {

        this.qnaMapper.qnaSave(qna);
    }

    //문의게시판/검색결과 리스트 출력
    @Override
    public List<Qna> showList() {
        return this.qnaMapper.showList();
    }

    @Override
    public Qna findOne(Long qnaCd) {
        return this.qnaMapper.findOne(qnaCd);
    }

    //게시글 삭제
    @Override
    public int deleteQ(int qnaCd) {
        return this.qnaMapper.deleteQ(qnaCd);
    }
}
