package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Division;
import model.employee.Education;
import model.employee.Employee;
import model.employee.Position;
import service.IEmployeeService;
import service.impl.DivisionService;
import service.impl.EducationService;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeServlet",urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeService();
    DivisionService divisionService = new DivisionService();
    EducationService educationService = new EducationService();
    PositionService positionService = new PositionService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                break;
            case "edit":

                break;
            default:
                listEmployee(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
            switch (action) {
                case "create":

                    break;
                case "deleteCustomer":
                    deleteEmployee(request, response);
                    break;
                case "edit":

                    break;
                default:
                    listEmployee(request, response);
                    break;
            }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {

    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = employeeService.findAllEmployee();
//        List<Division> divisionList = divisionService.getDivision();
//        List<Education> educationList = educationService.getEducation();
//        List<Position> positionList = positionService.getPosition();
        request.setAttribute("employeeList", employeeList);
//        request.setAttribute("divisionList", divisionList);
//        request.setAttribute("educationList", educationList);
//        request.setAttribute("positionList", positionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/emp-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
