package member;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;

public class MemberDAO {

    // DB변수
    Connection con = null;
    Statement stmt = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

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

    // 싱글톤 객체 = 객체 하나만 사용 = 메모리 절약
    private static MemberDAO instance = new MemberDAO();

    public static MemberDAO getInstance() {
        return instance;
    }

    // 기본생성자 private = 외부에서 생성자로 사용 불가
    // getInstance 메소드로만 사용가능 = javaBean 사용 불가
    private MemberDAO() {
    }

    // 커넥션 풀
    private Connection getConnection() throws Exception {
        Context ct = new InitialContext();
        DataSource ds = (DataSource) ct.lookup("java:comp/env/jdbc/mysql");
        return ds.getConnection();
    }

    // confirmId()_start-----------------------------------------------------------------------------
    public int confirmId(String id) throws Exception {
        // 출력객체
        int result = 0;

        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "select id from member where id = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs.next()) {
                result = 1;
            } else {
                result = -1;
            }
        } catch (Exception e) {
            System.out.println("id 조회 에러");
            e.getStackTrace();
        } finally {
            close(con, pstmt, rs);
        }
        return result;

    }

    // confirmId(String
    // id)_end-----------------------------------------------------------------------------

    // insertMember(MemberDTO dto
    // )_start-----------------------------------------------------------------------------
    public void insertMember(MemberDTO dto) throws Exception {
        System.out.println("insertMember()");
        System.out.println("dao-" + dto.toString());
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "insert into member values(?,?,?,?,?, ?,?,?,?,?)";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());
            pstmt.setString(3, dto.getName());
            pstmt.setString(4, dto.getJumin1());
            pstmt.setString(5, dto.getJumin2());

            pstmt.setString(6, dto.getEmail());
            pstmt.setString(7, dto.getZipcode());
            pstmt.setString(8, dto.getAddr());
            pstmt.setString(9, dto.getJob());
            pstmt.setTimestamp(10, dto.getRegdate());
            // 5. 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
        } finally {
            close(con, pstmt, rs);
        }
    }
    // insertMember(MemberDTO dto
    // )_end-----------------------------------------------------------------------------

    // login(String id, String
    // pw)_start-----------------------------------------------------------------------------
    public int login(String id, String passwd) {
        // 출력객체
        int result = -1;
        // id못찾음 -1
        // 로그인 성공 1
        // 비번 틀림 0
        System.out.println("login()");
        System.out.println(id + "+" + passwd);

        try {
            // 1+2
            con = getConnection();
            // con=ds.getConnection();
            // 3. sql
            String sql = "select * from member where id=? ";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs.next()) {
                String dbPasswd = rs.getString("passwd");
                if (passwd.equals(dbPasswd)) {
                    result = 1;
                } else {
                    result = 0;
                } // else end
            } else {
                result = -1;
            }
        } catch (Exception e) {
            System.out.println("조회 에러");
            e.getStackTrace();
        } finally {
            try {
                close(con, pstmt, rs);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    // login(String id, String
    // pw)_end-----------------------------------------------------------------------------

    // getMember(String
    // id)_start-----------------------------------------------------------------------------
    public MemberDTO getMember(String id) throws Exception {
        // 출력객체
        MemberDTO dto = new MemberDTO();

        try {
            // 1+2
            con = getConnection();
            // con=ds.getConnection();
            // 3. sql
            String sql = "select * from member where id = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            // 5. 실행
            rs = pstmt.executeQuery();
            // 6. 표시 --- select 때만 표시
            if (rs != null) {
                while (rs.next()) {
                    dto.setId(rs.getString("id"));
                    dto.setPasswd(rs.getString("passwd"));
                    dto.setName(rs.getString("name"));
                    dto.setJumin1(rs.getString("jumin1"));
                    dto.setJumin2(rs.getString("jumin2"));
                    dto.setEmail(rs.getString("email"));
                    dto.setJob(rs.getString("job"));
                    dto.setRegdate(rs.getTimestamp("regdate"));
                    dto.setZipcode(rs.getString("zipcode"));
                    dto.setAddr(rs.getString("addr"));
                }
            }
            System.out.println(dto.toString());

        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception("  ");
        } finally {
            close(con, pstmt, rs);
        }
        return dto;
    }
    // getMember(String
    // id)_end-----------------------------------------------------------------------------

    // updateMember(MemberDTO
    // dto)_start-----------------------------------------------------------------------------
    public void updateMember(MemberDTO dto) throws Exception {
        try {
            // 1+2
            con = getConnection();
            // 3. sql
            String sql = "update member set passwd = ?, name = ?, jumin1 = ?, jumin2 = ?, email = ?, zipcode = ?, addr = ?, job = ? "
                    + " where id = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getPasswd());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getJumin1());
            pstmt.setString(4, dto.getJumin2());
            pstmt.setString(5, dto.getEmail());
            pstmt.setString(6, dto.getZipcode());
            pstmt.setString(7, dto.getAddr());
            pstmt.setString(8, dto.getJob());
            pstmt.setString(9, dto.getId());
            // 5. 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception("updateMember예외  ");
        } finally {
            close(con, pstmt, rs);
        }
    }
    // updateMember(MemberDTO
    // dto)_end-----------------------------------------------------------------------------

    // deleteMember(MemberDTO)_start-----------------------------------------------------------------------------
    public int deleteMember(MemberDTO dto) throws Exception {
        // 출력객체
        int result = 0;

        try {
            // 1+2
            con = getConnection();
            // con=ds.getConnection();
            // 3. sql
            String sql = "delete from member where id = ? and passwd = ?";
            // 4. 실행객체
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getPasswd());
            // 5. 실행
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.getStackTrace();
            throw new Exception(" deleteMember() 예외  ");
        } finally {
            close(con, pstmt, rs);
        }
        return result;

    }
    // deleteMember(MemberDTO)_end-----------------------------------------------------------------------------

}
