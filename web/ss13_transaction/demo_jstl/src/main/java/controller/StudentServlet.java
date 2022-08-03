package controller;

import model.ClassCG;
import model.Student;
import service.IClassService;
import service.IStudentService;
import service.impl.ClassService;
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
    private IClassService classService = new ClassService();

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
                delete(request,response);
                break;
            case "edit":
                break;
            default:
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        boolean flag =studentService.delete(id);
        String mess ="Xoa khong thanh cong";
        if (flag){
            mess ="Xoa thanh cong";
        }
        request.setAttribute("mess", mess);
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

    private void save(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender =Boolean.parseBoolean(request.getParameter("gender"));
        String birthday =request.getParameter("birthday");
        int point =Integer.parseInt(request.getParameter("point"));
        int classId=Integer.parseInt(request.getParameter("classId"));
        String email = request.getParameter("email");
//        String account = request.getParameter("account");
        Student student = new Student(name,gender,birthday,point,classId,email);
       boolean check = studentService.add(student);
       if (check){
           request.setAttribute("mess", "Them moi thanh cong");
       }else {
           request.setAttribute("mess", "Them moi thất bại");
       }
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
            case "transaction":
                goToTransaction(request,response);
                break;
            default:
                // trả về trang list
                showListStudent(request,response);
        }
    }

    private void goToTransaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String mess = studentService.transaction();
       request.setAttribute("mess",mess);
       request.getRequestDispatcher("view/result_transaction.jsp").forward(request,response);

    }

    private void showCreateStudent(HttpServletRequest request, HttpServletResponse response) {
        List<ClassCG> classCGList = classService.findAll();
        request.setAttribute("classList",classCGList);
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
        List<ClassCG> classCGList = classService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/student/list.jsp");
        request.setAttribute("studentList",studentList);
        request.setAttribute("classList",classCGList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
