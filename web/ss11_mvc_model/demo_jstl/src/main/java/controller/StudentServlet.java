package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = {"/student"})
public class StudentServlet extends HttpServlet {
    private IStudentService studentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                save(request,response);
                break;
            case "delete":
                break;
            case "edit":
                break;
            default:
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender =Boolean.parseBoolean(request.getParameter("gender"));
        String birthday =request.getParameter("birthday");
        int point =Integer.parseInt(request.getParameter("point"));
        int classId=Integer.parseInt(request.getParameter("classId"));
        String email = request.getParameter("email");
        String account = request.getParameter("account");
        Student student = new Student(id,name,gender,birthday,point,account,classId,email);
        studentService.add(student);
        request.setAttribute("mess", "Them moi thanh cong");
        showCreateStudent(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        switch (action){
            case "add":
                showCreateStudent(request,response);
                break;
            case "delete":
                break;
            case "edit":
                break;
            default:
                // trả về trang list
                showListStudent(request,response);
        }
    }

    private void showCreateStudent(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/add.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        List<Student> studentList = studentService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
        request.setAttribute("studentList",studentList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
