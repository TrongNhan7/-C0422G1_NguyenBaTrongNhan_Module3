package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


public class UserRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER_BY_COUNTRY = "select id,name,email,country from users where country =?";
    private static final String SELECT_USER_BY_ID_SP = "call get_user_by_id(?)";
    private static final String INSERT_USERS_SQL_SP = "call insert_user(?,?,?)";
    private static final String SQL_INSERT = "INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE) VALUES (?,?,?)";
    private static final String SQL_UPDATE = "UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?";
    private static final String SQL_TABLE_CREATE = "CREATE TABLE EMPLOYEE"
            + "("
            + " ID serial,"
            + " NAME varchar(100) NOT NULL,"
            + " SALARY numeric(15, 2) NOT NULL,"
            + " CREATED_DATE timestamp,"
            + " PRIMARY KEY (ID)"
            + ");";
    private static final String SQL_TABLE_DROP = "DROP TABLE IF EXISTS EMPLOYEE";

    private static final String SELECT_ALL_USER_BY_SP = "call get_list_users()";

    private static final String UPDATE_USERS_SQL_BY_SP = "call edit_user(?,?,?,?);";

    private static final String DELETE_USERS_SQL_BY_SP = "call delete_By_SP(?);";

    public UserRepository() {
    }


    public void insertUser(User user) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        System.out.println(INSERT_USERS_SQL);
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(INSERT_USERS_SQL_SP);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public List<User> selectAllUsers() {
        Connection connection = BaseRepository.getConnectDB();
        List<User> users = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public List<User> selectAllUsersBySP() {
        Connection connection = BaseRepository.getConnectDB();
        List<User> users = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_USER_BY_SP);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException();
        }
        return rowUpdated;
    }

    @Override
    public boolean updateUserBySP(User user) throws SQLException {
        boolean rowUpdated;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_USERS_SQL_BY_SP);
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());


            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException();
        }
        return rowUpdated;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException();
        }
        return rowDeleted;
    }

    @Override
    public boolean deleteUserBySP(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USERS_SQL_BY_SP);
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException();
        }
        return rowDeleted;
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1, country);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public User selectUserById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public User getUserById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        User user = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_USER_BY_ID_SP);
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) {
        Connection connection = BaseRepository.getConnectDB();
        // for insert a new user
        PreparedStatement pstmt = null;
        // for assign permision to user
        PreparedStatement pstmtAssignment = null;
        // for getting user id
        ResultSet rs = null;
        try {
            connection.setAutoCommit(false);
            pstmt = connection.prepareStatement(INSERT_USERS_SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getCountry());
            int rowAffected = pstmt.executeUpdate();
            // get user id
            rs = pstmt.getGeneratedKeys();
            int userId = 0;
            if (rs.next())
                userId = rs.getInt(1);

            if (rowAffected == 1) {
                String sqlPivot = "INSERT INTO user_permision(user_id,permision_id) "
                        + "VALUES(?,?)";
                pstmtAssignment = connection.prepareStatement(sqlPivot);
                for (int permisionId : permisions) {
                    if (permisionId > 0 && permisionId < 5) {
                        pstmtAssignment.setInt(1, userId);
                        pstmtAssignment.setInt(2, permisionId);
                        pstmtAssignment.executeUpdate();
                    }else {
                        connection.rollback();
                    }
                }
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException ex) {
            // roll back the transaction
            try {
                if (connection != null)
                    connection.rollback();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (pstmtAssignment != null) pstmtAssignment.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        Connection connection = BaseRepository.getConnectDB();
        try {
            Statement statement = connection.createStatement();
            PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
            PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE);
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);

            // Run list of insert commands
            psInsert.setString(1, "Quynh");
            psInsert.setBigDecimal(2, new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psInsert.setString(1, "Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            // Run list of update commands
            // below line caused error, test transaction
            // org.postgresql.util.PSQLException: No value specified for parameter 1.
            psUpdate.setBigDecimal(2, new BigDecimal(999.99));
            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));
            psUpdate.setString(2, "Quynh");
            psUpdate.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertUpdateUseTransaction() {
        Connection connection = BaseRepository.getConnectDB();
        try {
            Statement statement = connection.createStatement();
            PreparedStatement psInsert = connection.prepareStatement(SQL_INSERT);
            PreparedStatement psUpdate = connection.prepareStatement(SQL_UPDATE);
            statement.execute(SQL_TABLE_DROP);
            statement.execute(SQL_TABLE_CREATE);
            // start transaction block
            connection.setAutoCommit(false); // default true
            // Run list of insert commands
            psInsert.setString(1, "Quynh");
            psInsert.setBigDecimal(2, new BigDecimal(10));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();

            psInsert.setString(1, "Ngan");
            psInsert.setBigDecimal(2, new BigDecimal(20));
            psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
            psInsert.execute();
            // Run list of update commands
            // below line caused error, test transaction
            // org.postgresql.util.PSQLException: No value specified for parameter 1.
            psUpdate.setBigDecimal(2, new BigDecimal(999.99));
            //psUpdate.setBigDecimal(1, new BigDecimal(999.99));
            psUpdate.setString(2, "Quynh");
            psUpdate.execute();
            // end transaction block, commit changes
            connection.commit();
            // good practice to set it back to default true
            connection.setAutoCommit(true);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    List<Integer> list= new ArrayList();

}
