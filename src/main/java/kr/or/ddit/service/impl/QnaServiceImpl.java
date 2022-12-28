package kr.or.ddit.service.impl;

import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.qnareply.QnaReply;
import kr.or.ddit.mapper.QnaMapper;
import kr.or.ddit.service.QnaService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

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

    //게시글 조회
    @Override
    public Qna findOne(Long qnaCd) {
        return this.qnaMapper.findOne(qnaCd);
    }

    //게시글 수정
    @Override
    public void update(Qna qna) {
        this.qnaMapper.update(qna);
    }

    //게시글 삭제
    @Override
    public void delete(Long qnaCd) {
        this.qnaMapper.delete(qnaCd);
    }

    @Override
    public void updateViewCount(Long qnaCd) {
        this.qnaMapper.updateViewCount(qnaCd);
    }

    @Override
    public void qnaReplySave(QnaReply qnaReply) {
        this.qnaMapper.qnaReplySave(qnaReply);
    }

    @Override
    public QnaReply findReplyOne(Long qnaCd) {
       return this.qnaMapper.qnaReplyFindOne(qnaCd);
    }
}
