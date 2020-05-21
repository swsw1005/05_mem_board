package member;

import lombok.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
public class MemberDTO {

    private String id;
    private String passwd;
    private String name;
    private String jumin1;
    private String jumin2;
    private String email;
    private String zipcode;
    private String addr;
    private String job;
    private Timestamp regdate;

    public static void main(String[] args) {
        Timestamp ts1 = Timestamp.valueOf("2020-05-20 10:08:55");
        Timestamp ts2 = Timestamp.valueOf(LocalDateTime.now());

        System.out.println(ts1);
        System.out.println(ts1.toString());

        System.out.println(ts2);
        System.out.println(ts2.toString());

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss.S");

        System.out.println(sdf.format(ts1.getTime()));
        System.out.println(sdf.format(ts2.getTime()));
    }

}