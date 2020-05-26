package boardmysql;

import javax.naming.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;

public class BoardDAO {

    // DB변수
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Context cont = null;
    DataSource ds = null;

    public BoardDAO() {
        try {
            cont = new InitialContext();
            ds = (DataSource) cont.lookup("java:comp/env/jdbc/mysql");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    } // cons end

    // 메소드에
    // 1+2
    // con=ds.getConnection();

    // close 1
    static final void close(Connection con, PreparedStatement pstmt, ResultSet rs) throws Exception {
        close(con, pstmt);
        if (rs != null) {
            rs.close();
        }
    } // close () end

    // close 2
    static final void close(Connection con, PreparedStatement pstmt) throws Exception {
        if (con != null) {
            con.close();
        }
        if (pstmt != null) {
            pstmt.close();
        }
    } // close () end

    // insertArticle_start-----------------------------------------------------------------------------
    public void insertArticle(BoardDTO dto) throws Exception {
        System.out.println("---BoardDAO insertArticle");

        int no = dto.getNo();
        int ref = dto.getRef(); // 글 그룹
        int re_step = dto.getRe_step(); // 글 순서
        int re_level = dto.getRe_level(); // 글 깊이

        int number = 0;

        try {
            // 1+2
            con = ds.getConnection();
            // 3. sql
            String sql = "select MAX(no) from board";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            try {
                number = rs.getInt(1) + 1;
            } catch (Exception e) {
            }

            if (no != 0) {// 답글일때
                sql = "update board set re_step = re_step + 1  where ref = ? and re_step > ?";
                pstmt = con.prepareStatement(sql);
                pstmt.executeUpdate();
            } else {
                ref = number;
                re_step = 0;
                re_level = 0;
            }

            sql = "insert into board(writer, email, title, password, regdate, ref, re_step, re_level, content, ip) "
                    + "values(?,?,?,?,now(),?,?,?,?,? )";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getWriter());
            pstmt.setString(2, dto.getEmail());
            pstmt.setString(3, dto.getTitle());
            pstmt.setString(4, dto.getPassword());
            pstmt.setInt(5, ref);
            pstmt.setInt(6, re_step);
            pstmt.setInt(7, re_level);
            pstmt.setString(8, dto.getContent());
            pstmt.setString(9, dto.getIp());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" insertArticle() 예외  ");
        } finally {
            close(con, pstmt, rs);
        }
    }
    // insertArticle_end-----------------------------------------------------------------------------

    // getList_start-----------------------------------------------------------------------------
    public List<BoardDTO> getList() throws Exception {
        // 출력객체
        List<BoardDTO> list = new ArrayList<>();
        System.out.println("---BoardDAO getList");

        try {
            // 1+2
            con = ds.getConnection();
            // 3. sql
            String sql = "select * from board  order by no desc";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    BoardDTO dto = new BoardDTO();
                    dto.setContent(rs.getString("content"));
                    dto.setEmail(rs.getString("email"));
                    dto.setIp(rs.getString("ip"));
                    dto.setNo(rs.getInt("no"));
                    dto.setPassword(rs.getString("password"));
                    dto.setRe_level(rs.getInt("re_level"));
                    dto.setRe_step(rs.getInt("re_level"));
                    dto.setReadcount(rs.getInt("readcount"));
                    dto.setRegdate(rs.getDate("regdate"));
                    dto.setTitle(rs.getString("title"));
                    dto.setWriter(rs.getString("writer"));
                    list.add(dto);
                    System.out.println(dto.toString());
                }
            }
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" getList() 예외  ");
        } finally {
            close(con, pstmt, rs);
        }
        return list;
    }
    // getList_end-----------------------------------------------------------------------------

}
