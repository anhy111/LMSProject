package kr.or.ddit.aws;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class MyComponent {

    private final AmazonS3 s3Client;

    @Autowired
    public MyComponent(AmazonS3 s3Client) {
        this.s3Client = s3Client;
    }

    public void doSomething() {
        // Use the s3Client to interact with S3

        TransferManager tm = TransferManagerBuilder.standard()
                .withS3Client(s3Client)
                .withMultipartUploadThreshold((long) ( 5 * 1024 * 1025))
                .build();

        List<Bucket> buckets = s3Client.listBuckets();
        for (Bucket bucket : buckets) {
            System.out.println("**************************************" + bucket.getName());
        }
    }
}