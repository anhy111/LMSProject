//package kr.or.ddit.domain;
//
//import kr.or.ddit.domain.notice.Notice;
//import lombok.Getter;
//import lombok.Setter;
//
//import javax.persistence.*;
//import java.util.ArrayList;
//import java.util.List;
//
//@Entity
//@Getter @Setter
//public class Category {
//
//    @Id
//    @GeneratedValue
//    @Column(name = "category_id")
//    private Long id;
//
//    private String name;
//
//    @ManyToMany
//    @JoinColumn(name = "category_notice")
//    private List<Notice> notices = new ArrayList<>();
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "parent_id")
//    private Category parent;
//
//    @OneToMany(mappedBy = "parent")
//    private List<Category> child = new ArrayList<>();
//
//    public void addChildCategory(Category child) {
//        this.child.add(child);
//        child.setParent(this);
//    }
//
//}
