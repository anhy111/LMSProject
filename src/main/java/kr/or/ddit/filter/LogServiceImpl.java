package kr.or.ddit.filter;

import kr.or.ddit.mapper.LogMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogServiceImpl implements LogCreateService {

//    private static LogServiceImpl instance = new LogServiceImpl();
//    private LogServiceImpl() {
//
//    }
//    public static LogServiceImpl getInstance() {
//        return instance;
//    }

    @Autowired
    private final LogMapper logMapper;

    public LogServiceImpl(LogMapper logMapper) {
        this.logMapper = logMapper;
    }

    @Override
    public void logPush(LogForm logForm) {
        logMapper.logSave(logForm);
    }
}
