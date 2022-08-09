package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    ICustomerService customerService = new CustomerService();
    ICustomerTypeService customerTypeService = new CustomerTypeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request, response);
                break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    String name = request.getParameter("nameCustomer");
                    String birthday = request.getParameter("birthday");
                    String idCard = request.getParameter("idCard");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                    int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
                    Customer customer = new Customer(name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerService.createCustomer(customer);

                    Map<String, String> mapErrors = this.customerService.createCustomer(customer);
                    if (mapErrors.size() > 0) {
                        for (Map.Entry<String, String> entry : mapErrors.entrySet()) {
                            request.setAttribute(entry.getKey(), entry.getValue());
                        }

                        request.getRequestDispatcher("view/customer/cus-create.jsp")
                                .forward(request, response);
                    }
                    customerService.createCustomer(customer);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-create.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "deleteCustomer":
                    deleteCustomer(request, response);
                    break;
                case "edit":
                    EditCustomer(request, response);
                    break;
                case "findByKey":
                    findCustomerByKey(request, response);
                    break;
                default:
                    listCustomer(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void findCustomerByKey(HttpServletRequest request, HttpServletResponse response) {
        String key = request.getParameter("key");
        List<Customer> customers = customerService.findByCustomer(key);
        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();

        RequestDispatcher dispatcher = null;
        if (customers.size() == 0) {
            String mess = "Không tìm thấy";
            request.setAttribute("mess", mess);
        } else {
            request.setAttribute("customerList", customers);
            request.setAttribute("customerTypeList", customerTypeList);
        }
        dispatcher = request.getRequestDispatcher("view/customer/cus-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void EditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Boolean status = Boolean.valueOf(request.getParameter("status"));
        String name = request.getParameter("nameCustomer");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));

        Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId, status);
        customerService.editCustomer(customer);

        Map<String, String> mapErrors = this.customerService.editCustomer(customer);
        if (mapErrors.size() > 0) {
            for (Map.Entry<String, String> entry : mapErrors.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());
            }

            try {
                request.getRequestDispatcher("view/customer/cus-edit.jsp")
                        .forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Customer customerNew = customerService.findByIdCustomer(id);
        request.setAttribute("customer", customerNew);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = customerService.findAllCustomer();
        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();
        request.setAttribute("customerList", customers);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findByIdCustomer(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("nameCustomer");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, address, customerTypeId);

//        String mess = null;
//        if (check) {
//            mess = ("Thêm mới thành công");
//        } else {
//            mess = ("Thêm mới thất bại");
//        }
//        request.setAttribute("mess", mess);
        customerService.createCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-create.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idCustomer"));
        boolean check = customerService.deleteCustomer(id);
        String mess = null;
        if (check) {
            mess = ("Delete thành công");
        } else {
            mess = ("Delete thất bại");
        }
        request.setAttribute("mess", mess);

        List<Customer> customers = customerService.findAllCustomer();
        List<CustomerType> customerTypeList = customerTypeService.selectCustomerTypeList();
        request.setAttribute("customerList", customers);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/cus-list.jsp");
        dispatcher.forward(request, response);
    }
}
