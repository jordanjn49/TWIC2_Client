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


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Printing all different cities
        VilleAPI v_api = new VilleAPI();
        WeatherAPI w_api = new WeatherAPI();

        //Initiating variables
        ArrayList<Ville> selectVille = null;
        Ville V1 = new Ville(); //TODO
        Ville V2 = new Ville(); //TODO
        int tempV1 = 0;
        int tempV2 = 0;
        String iconV1 = "";
        String iconV2 = "";
//        String latV1 = V1.getLatitude();
//        String lonV1 = V1.getLongitude();
//        String latV2 = V2.getLatitude();
//        String lonV2 = V2.getLongitude();
        String latV1 = "47.47438064337268";
        String lonV1 = "-0.5533994607037108";
        String latV2 = "46.2468792013";
        String lonV2= "5.65226081977";


        try {
            selectVille = v_api.getAllVilles();
            tempV1 = w_api.getTemperature(latV1, lonV1);
            tempV2 = w_api.getTemperature(latV2, lonV2);
            iconV1 = w_api.getWeatherIcon(latV1, lonV1);
            iconV2 = w_api.getWeatherIcon(latV2, lonV2);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        request.getSession().setAttribute("selectVille", selectVille);
        request.getSession().setAttribute("tempV1", tempV1);
        request.getSession().setAttribute("tempV2", tempV2);
        request.getSession().setAttribute("iconV1", iconV1);
        request.getSession().setAttribute("iconV2", iconV2);

        //Calculating distance
//        double distance = V1.getDistance(V2);
        double distance = 56.15;
        request.getSession().setAttribute("distance",distance);


        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }
}
