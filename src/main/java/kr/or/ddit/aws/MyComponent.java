package kr.or.ddit.aws;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import org.springframework.stereotype.Component;

@Component
public class MyComponent {

    private final AmazonS3 s3Client;

    public MyComponent(AmazonS3 s3Client) {
        this.s3Client = s3Client;
    }

    public void doSomething() {
        // Use the s3Client to interact with S3

        TransferManager tm = TransferManagerBuilder.standard()
                .withS3Client(s3Client)
                .withMultipartUploadThreshold((long) ( 5 * 1024 * 1025))
                .build();

//        String bucketName = "baeldung-bucket";
//        String keyName = "my-picture.jpg";
//        String file = new File("documents/my-picture.jpg");
//        Upload upload = tm.upload(bucketName, keyName, file);


    }
}