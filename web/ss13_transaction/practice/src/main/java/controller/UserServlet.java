package controller;

import common.ComparatorName;
import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;

    public void init() {
        userService = new UserService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        String ac = Optional.ofNullable(request.getParameter("action")).orElse("");
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "create-user-transaction":
                showNewFormTransaction(request, response);
                break;
//                case "edit":
//                    showEditForm(request, response);
//                    break;
            case "edit-SP":
                showEditForm_SP(request, response);
                break;
//                case "delete":
//                    deleteUser(request, response);
//                    break;

            case "permision":
                addUserPermision(request, response);
                break;
            case "test-without-tran":
                testWithoutTran(request, response);
                break;
            case "add-users-Transaction":
//                    showAddUserTransaction(request, response);
                break;
//                default:
//                    listUser(request, response);
//                    break;
            default:
                listUseSP(request, response);
                break;
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "create-user-transaction":
                    addUserTransaction(request, response);
                    break;
//                case "edit":
//                    updateUser(request, response);
//                    break;
                case "edit-SP":
                    updateUser_SP(request, response);
                    break;
                case "findByCountry":
                    findByCountry(request, response);
                    break;
                case "selectUserSortName":
                    selectUserSortName(request, response);
                    break;
                case "delete-by-SP":
                    deleteUserBySP(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void showEditForm_SP(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        request.setAttribute("user", existingUser);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUseSP(HttpServletRequest request, HttpServletResponse response) {
        List<User> listUser = userService.selectAllUsersBySP();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void testWithoutTran(HttpServletRequest request, HttpServletResponse response) {
        userService.insertUpdateWithoutTransaction();
    }

    private void addUserPermision(HttpServletRequest request, HttpServletResponse response) {
        User user = new User("quan", "quan.nguyen@codegym.vn", "vn");
        int[] permision = {1, 2, 4};
        userService.addUserTransaction(user, permision);
    }

    private void addUserTransaction(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        String[] permision = request.getParameterValues("permision");
        int[] permisionInt ;
        if(permision == null){
            int[] testArr = {5,6,7};
            userService.addUserTransaction(newUser, testArr);
            request.setAttribute("mess", "Thêm mới thất bại");
        }else {
            permisionInt=new int[permision.length];
            for (int i = 0; i < permision.length; i++) {
                permisionInt[i] = Integer.parseInt(permision[i]);
            }
            userService.addUserTransaction(newUser, permisionInt);
            request.setAttribute("mess", "Thêm mới thành công");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create-transaction.jsp");
        dispatcher.forward(request, response);
    }


    private void updateUser_SP(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
        userService.updateUserBySP(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void findByCountry(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.selectUserByCountry(country);
        RequestDispatcher dispatcher;
        if (userList.size() == 0) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("listUser", userList);
            dispatcher = request.getRequestDispatcher("view/list.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void selectUserSortName(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAllUsers();
        ComparatorName comparator = new ComparatorName();
        Collections.sort(userList, comparator);
        request.setAttribute("listUser", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewFormTransaction(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create-transaction.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        User existingUser = userService.selectUserById(id);
        User existingUser = userService.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
//        userService.insertUser(newUser);
        userService.insertUserStore(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        dispatcher.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
        userService.updateUser(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUserBySP(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUserBySP(id);
        List<User> listUser = userService.selectAllUsersBySP();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        dispatcher.forward(request, response);
    }


}
