package kr.or.ddit.mapper;

import kr.or.ddit.domain.notice.NoticeBasic;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper // 생략 가능.
public interface NoticeBasicMapper {

    //공지사항 전체 글의 수 조회
    @Select("SELECT COUNT(*) FROM notice_basic")
    int getNoticeBasicTotalRow();

    //공지사항 목록 조회
    @Select("SELECT * FROM notice_basic ORDER BY notice_reg DESC")
    List<NoticeBasic> noticeBasicList();

    //공지사항 상세 조회
    @Select( "SELECT * FROM notice_basic WHERE notice_cd = #{noticeCd}")
    NoticeBasic noticeBasicFindNotice(@Param("noticeCd")Long noticeCd);

    //공지사항 저장
    void noticeBasicSave(NoticeBasic noticeBasic);

    //공지사항 수정
    void noticeBasicUpdate(NoticeBasic noticeBasic);

    //공지사항 삭제
    void noticeBasicDelete(Long noticeCd);

    @Select("UPDATE NOTICE_BASIC SET NOTICE_HIT = NOTICE_HIT + 1 WHERE NOTICE_CD = #{noticeCd}")
    void noticeBasicUpdateViewCount(Long noticeCd);
}
