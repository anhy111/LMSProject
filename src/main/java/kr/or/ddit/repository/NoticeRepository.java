package kr.or.ddit.repository;

import kr.or.ddit.domain.notice.Notice;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class NoticeRepository {

    private final EntityManager em;

    public void save(Notice notice) {

        if (notice.getId() == null) {
            em.persist(notice);
        } else {
            em.merge(notice);
        }
    }

    public Notice findOne(Long id) {
        return em.find(Notice.class, id);
    }

    public List<Notice> findAll() {
        return em.createQuery("select n from Notice n", Notice.class)
                .getResultList();
    }
}
