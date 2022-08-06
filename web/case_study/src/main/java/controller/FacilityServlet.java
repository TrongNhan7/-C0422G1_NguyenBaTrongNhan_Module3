package controller;

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
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {

    IFacilityService facilityService = new FacilityService();
    FacilityTypeService facilityTypeService = new FacilityTypeService();
    RentTypeService rentTypeService = new RentTypeService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
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

    }

    private void showEditFacility(HttpServletRequest request, HttpServletResponse response) {


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
