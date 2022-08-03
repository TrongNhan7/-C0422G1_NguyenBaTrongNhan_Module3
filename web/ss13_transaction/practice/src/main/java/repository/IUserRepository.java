package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public void insertUserStore(User user) throws SQLException;

    public List<User> selectAllUsers();

    public List<User> selectAllUsersBySP();

    public boolean deleteUser(int id) throws SQLException;

    public boolean deleteUserBySP(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public boolean updateUserBySP(User user) throws SQLException;

    public User selectUserById(int id);

    public User getUserById(int id);

    public List<User> selectUserByCountry(String country);

    public void addUserTransaction(User user, int[] permisions);

    public void insertUpdateWithoutTransaction();

    public void insertUpdateUseTransaction();






}
