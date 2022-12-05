package kr.or.ddit.domain.notice;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;

@Entity
@DiscriminatorValue("B")
@Getter
@Setter
public class Book extends Notice {

    private String author;
    private String isbn;


    public Book(String author, String isbn) {
        this.author = author;
        this.isbn = isbn;
    }

    public Book() {
    }
}
