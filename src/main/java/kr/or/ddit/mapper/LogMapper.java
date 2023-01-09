package kr.or.ddit.mapper;

import kr.or.ddit.filter.LogForm;
import org.apache.ibatis.annotations.Select;

public interface LogMapper {

    @Select("INSERT INTO QNA_LOG VALUES (#{id}, #{attachNumber}, SYSDATE)")
    void logSave(LogForm logForm);
}
