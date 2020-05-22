package boardmysql;

import java.util.Date;

import lombok.*;

@Getter
@Setter
@ToString
public class BoardDTO {

    private int no;
    private String writer;
    private String email;
    private String title;
    private String content;
    private String pw;
    private Date regdate;
    private int readcount;
    private int ref; // 글 그룹
    private int re_step; // 글 순서
    private int re_level; // 글 깊이(답글 깊이)

    private String ip;

}