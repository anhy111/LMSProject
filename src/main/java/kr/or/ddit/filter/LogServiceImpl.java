package kr.or.ddit.filter;

import kr.or.ddit.mapper.LogMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LogServiceImpl implements LogCreateService {

    private final LogMapper logMapper;

    @Override
    public void logPush(LogForm logForm) {
        logMapper.logSave(logForm);
    }
}
