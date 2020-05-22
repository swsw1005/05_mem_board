package boardmysql;

import java.sql.*;

public class BoardDAO {

    Connection con = null;
    PreparedStatement pstme = null;
    ResultSet rs = null;

    private static BoardDAO dao = new BoardDAO();

    public static BoardDAO getDao() {
        return dao;
    }

    private BoardDAO() {
    }

}