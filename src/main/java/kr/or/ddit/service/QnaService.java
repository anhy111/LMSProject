package kr.or.ddit.service;

import kr.or.ddit.domain.qna.Qna;
import kr.or.ddit.domain.qna.qnareply.QnaReply;

import java.util.List;

public interface QnaService {

    //문의게시판 행의 수 계산
    int getQnaTotalRow();

    //문의게시판 등록
    void qnaSave(Qna qna);

    //문의게시판/검색결과 리스트 출력
    List<Qna> showList(int viewPage);

    // 문의게시판 게시글 검색
    Qna findOne(Long qnaCd);

    void update(Qna qna);

    //게시글 삭제
    void delete(Long qnaCd);

    void updateViewCount(Long qnaCd);

    void qnaReplySave(QnaReply qnaReply);

    QnaReply findReplyOne(Long qnaCd);

    List<QnaReply> showReplyList();
}
