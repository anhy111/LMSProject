package EvaluationServiceImpl.java;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.domain.Attach;
import kr.or.ddit.mapper.AttachMapper;
import kr.or.ddit.service.AttachService;

@Service
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	AttachMapper attachMapper;
	
	@Override
	public int insertAttch(List<Attach> attach) {
		return this.attachMapper.insertAttch(attach);
	}
}
