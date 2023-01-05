//import kr.or.ddit.aws.MyComponent;
//import kr.or.ddit.aws.S3Config;
//import org.junit.Test;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//import org.springframework.context.annotation.ComponentScan;
//
//@ComponentScan
//public class MyComponentTest {
//
//    @Test
//    public void s3ClientTest() {
//
//        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
//        if (!context.isActive()) {
//            context.register(S3Config.class);
//            context.refresh();
//        }
//        MyComponent myComponent = context.getBean(MyComponent.class);
//        myComponent.doSomething();
//    }
//}
