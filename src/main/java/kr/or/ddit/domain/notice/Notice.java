//package kr.or.ddit.domain.notice;
//
//import kr.or.ddit.domain.Category;
//import kr.or.ddit.exception.NotEnoughStockException;
//import lombok.Getter;
//import lombok.Setter;
//
//import javax.persistence.*;
//import java.util.ArrayList;
//import java.util.List;
//
//@Entity
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
//@DiscriminatorColumn(name = "dtype")
//@Getter @Setter
//public abstract class Notice {
//
//    @Id
//    @GeneratedValue
//    @Column(name = "notice_id")
//    private Long id;
//
//    private String name;
//
//    private int price;
//
//    private int stockQuantity;
//
//    @ManyToMany(mappedBy = "notices")
//    private List<Category> categories = new ArrayList<>();
//
//
////데이터를 가지고 있는 클래스 -> 비즈니스 로직 응집도 높아짐.
//    //==비즈니스 로직==//
//    /**
//     * stock 증가
//     */
//    public void addStock(int quantity) {
//
//        this.stockQuantity += quantity;
//    }
//
//
//    /**
//     * stock 감소
//     */
//    public void removeStock(int quantity) {
//        int restStock = this.stockQuantity - quantity;
//        if (restStock < 0) {
//            throw new NotEnoughStockException("need more stock");
//        }
//        this.stockQuantity = restStock;
//    }
//
//    public void change(String name, int price, int stockQuantity) {
//        this.name = name;
//        this.price = price;
//        this.stockQuantity = stockQuantity;
//    }
//}
