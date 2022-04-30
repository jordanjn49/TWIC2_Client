package com.twic.twic2_client.Servlets;

import com.twic.twic2_client.Beans.Ville;
import com.twic.twic2_client.Forms.VilleAPI;
import com.twic.twic2_client.Forms.WeatherAPI;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/Distance")
public class ServletDistance extends HttpServlet {

    VilleAPI v_api = new VilleAPI();
    WeatherAPI w_api = new WeatherAPI();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Initiating variables
        ArrayList<Ville> selectVille = null;

        try {
            selectVille = v_api.getAllVilles();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("selectVille", selectVille);
        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id1 = request.getParameter("id1");
        String id2 = request.getParameter("id2");
        System.out.println("Les IDs sont " + id1 + ' ' + id2);

        double distance = 0;
        int tempV1 = 0, tempV2 = 0;
        String iconV1 = "", iconV2 = "",latV1, lonV1, latV2, lonV2, nameV1 = "", nameV2 = "";

        try {
            Ville ville1 = v_api.getVilleById(id1);
            Ville ville2 = v_api.getVilleById(id2);
            latV1 = ville1.getLatitude();
            lonV1 = ville1.getLongitude();
            latV2 = ville2.getLatitude();
            lonV2 = ville2.getLongitude();
            tempV1 = w_api.getTemperature(latV1, lonV1);
            tempV2 = w_api.getTemperature(latV2, lonV2);
            iconV1 = w_api.getWeatherIcon(latV1, lonV1);
            iconV2 = w_api.getWeatherIcon(latV2, lonV2);
            distance = ville1.getDistance(ville2);
            nameV1 = ville1.getNomCommune();
            nameV2 = ville2.getNomCommune();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("nameV1", nameV1);
        request.getSession().setAttribute("nameV2", nameV2);
        request.getSession().setAttribute("tempV1", tempV1);
        request.getSession().setAttribute("tempV2", tempV2);
        request.getSession().setAttribute("iconV1", iconV1);
        request.getSession().setAttribute("iconV2", iconV2);
        request.getSession().setAttribute("distance", String.format("%.2f", distance));
        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }
}
