package controller;

import model.contract.Contract;
import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Employee;
import model.facility.Facility;
import service.*;
import service.impl.CustomerService;
import service.impl.EmployeeService;
import service.impl.FacilityService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    IContractService contractService = new ContractService();
    IEmployeeService employeeService = new EmployeeService();
    IFacilityService facilityService = new FacilityService();
    ICustomerService customerService = new CustomerService();

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
                listContract(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "createContract":
                createContract(request, response);
                break;
            case "edit":

                break;
            default:
                listContract(request, response);
                break;
        }
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        String facilityId = request.getParameter("facility");
        String customerId = request.getParameter("customers");
        String employeeId = request.getParameter("employees");
        double totalMoney = Double.parseDouble(request.getParameter("total"));
        Contract contract = new Contract(startDate,endDate,deposit,employeeId,customerId,facilityId,totalMoney);
        boolean check = contractService.createContract(contract);
        String mess = null;
        if (check) {
            mess = ("Thêm mới thành công");
        } else {
            mess = ("Thêm mới thất bại");
        }
        request.setAttribute("mess", mess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/cont-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response) {
        List<Contract> contractList = contractService.findAllContract();
        List<Employee> employeeList = employeeService.findAllEmployee();
        List<Facility> facilityList = facilityService.findAllFacility();
        List<Customer> customerList = customerService.findAllCustomer();
        request.setAttribute("contractList", contractList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("customerList", customerList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/cont-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
