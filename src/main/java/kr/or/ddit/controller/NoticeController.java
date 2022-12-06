//package kr.or.ddit.controller;
//
////import kr.or.ddit.domain.notice.Book;
////import kr.or.ddit.domain.notice.Notice;
//import kr.or.ddit.service.NoticeService;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import java.util.List;
//
//@Controller
//@RequiredArgsConstructor
//@Slf4j
//public class NoticeController {
//
//
////    private final NoticeService noticeService;
//
//    @GetMapping("/notices/new")
//    public String createForm(Model model) {
//
//        model.addAttribute("form", new BookForm());
//
//        return "notices/createNoticeForm";
//    }
//
//    @PostMapping("/notices/new")
//    public String create(BookForm form) {
//        Book book = new Book(); //생성자로 Setter 삭제 ->
//
//        book.setName(form.getName());
//        book.setPrice(form.getPrice());
//        book.setStockQuantity(form.getStockQuantity());
//        book.setAuthor(form.getAuthor());
//        book.setIsbn(form.getIsbn());
//
//        log.info("Book set");
//        System.out.println(book.getName());
//        System.out.println(book.getPrice());
//        System.out.println(book.getStockQuantity());
//        System.out.println(book.getAuthor());
//        System.out.println(book.getIsbn());
//
//        noticeService.saveNotice(book);
//
//        log.info("???");
//
//        return "redirect:/home";
//    }
//
//    @GetMapping("/notices")
//    public String list(Model model) {
//
//        List<Notice> notices = noticeService.findNotices();
//        model.addAttribute("notices", notices);
//        return "notices/noticeList";
//    }
//
//    @GetMapping("notices/{noticeId}/edit")
//    public String updateNoticeForm(@PathVariable("noticeId") Long noticeId, Model model) {
//        Book notice = (Book) noticeService.findOne(noticeId);
//
//        BookForm form = new BookForm();
//
//        // 추후에 Setter 삭제하기.
//        form.setId(notice.getId());
//        form.setName(notice.getName());
//        form.setPrice(notice.getPrice());
//        form.setStockQuantity(notice.getStockQuantity());
//        form.setAuthor(notice.getAuthor());
//        form.setIsbn(notice.getIsbn());
//
//        model.addAttribute("form", form);
//        return "notices/updateNoticeForm";
//    }
//
//    @PostMapping("notices/{noticeId}/edit")
//    public String updateNotice(@PathVariable Long noticeId,
//                               @ModelAttribute("form") BookForm form) {
//
//        noticeService.updateNotice(noticeId, form.getName(), form.getPrice(), form.getStockQuantity());
//        return "redirect:/notices";
//    }
//
//}
