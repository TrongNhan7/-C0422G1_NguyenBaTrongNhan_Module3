package controller;

import model.customer.Customer;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.IFacilityService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;
import service.impl.RentTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {

    IFacilityService facilityService = new FacilityService();
    FacilityTypeService facilityTypeService = new FacilityTypeService();
    RentTypeService rentTypeService = new RentTypeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateFacility(request, response);
                break;
            case "edit":
                showEditFacility(request, response);
                break;
            default:
                listFacility(request, response);
                break;
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFacility(request, response);
                break;
            case "deleteFacility":
                deleteFacility(request, response);
                break;
            case "editFacility":
                EditFacility(request, response);
                break;
            case "findByName":
                findFacilityByName(request, response);
                break;
            default:
                listFacility(request, response);
                break;
        }
    }

    private void findFacilityByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Facility> facilities = facilityService.findFacilityByName(name);
        List<FacilityType> facilityTypes = facilityTypeService.selectFacilityTypeList();
        List<RentType> rentTypeServices = rentTypeService.selectRentTypeList();

        RequestDispatcher dispatcher = null;
        if (facilities.size() == 0) {
            String mess = "Không tìm thấy";
            request.setAttribute("mess", mess);
        } else {
            request.setAttribute("facilityList", facilities);
            request.setAttribute("facilityTypes", facilityTypes);
            request.setAttribute("rentTypeServices", rentTypeServices);
        }
        dispatcher = request.getRequestDispatcher("view/facility/fac-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void EditFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String name = request.getParameter("nameFacility");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        String standardRoom = request.getParameter("standard_room");
        String convenience = request.getParameter("description_other_convenience");
        Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        double poolArea = Double.parseDouble(request.getParameter("pool_area"));
        int number_of_floors = Integer.parseInt(request.getParameter("number_of_floors"));
        String facilityFree = request.getParameter("facility_free");
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));

        Facility facility = new Facility(id, name, area, cost, maxPeople, standardRoom,
                convenience, poolArea, number_of_floors, facilityFree, rentTypeId, serviceTypeId);
        boolean check = facilityService.editFacility(facility);
        String mess = null;
        if (check) {
            mess = ("Edit thành công");
        } else {
            mess = ("Edit thất bại");
        }
        request.setAttribute("mess", mess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idFacility"));
        boolean check = facilityService.deleteFacility(id);
        String mess = null;
        if (!check) {
            mess = ("Delete thành công");
        } else {
            mess = ("Delete thất bại");
        }
        request.setAttribute("mess", mess);
        List<Facility> facilityList = facilityService.findAllFacility();
        List<FacilityType> facilityTypes = facilityTypeService.selectFacilityTypeList();
        List<RentType> rentTypeServices = rentTypeService.selectRentTypeList();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypes", facilityTypes);
        request.setAttribute("rentTypeServices", rentTypeServices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameFacility");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        String standardRoom = request.getParameter("standard_room");
        String convenience = request.getParameter("description_other_convenience");
        double areaPool = Double.parseDouble(request.getParameter("pool_area"));
        int numberOfFloors = Integer.parseInt(request.getParameter("number_of_floors"));
        String serviceFree = request.getParameter("facility_free");
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        Facility facility = new Facility(name, area, cost, maxPeople, standardRoom, convenience,
                areaPool, numberOfFloors, serviceFree, rentTypeId, serviceTypeId);
        boolean check = facilityService.createFacility(facility);
        String mess = null;
        if (check) {
            mess = ("Thêm mới thành công");
        } else {
            mess = ("Thêm mới thất bại");
        }
        request.setAttribute("mess", mess);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findByIdFacility(id);
        request.setAttribute("facility", facility);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void listFacility(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = facilityService.findAllFacility();
        List<FacilityType> facilityTypes = facilityTypeService.selectFacilityTypeList();
        List<RentType> rentTypeServices = rentTypeService.selectRentTypeList();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypes", facilityTypes);
        request.setAttribute("rentTypeServices", rentTypeServices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/fac-list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
