package com.twic.twic2_client.Servlets;

import com.twic.twic2_client.Beans.Ville;
import com.twic.twic2_client.Forms.VilleAPI;

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
        VilleAPI api = new VilleAPI();
        ArrayList<Ville> selectVille = null;
        try {
            selectVille = api.getAllVilles();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        request.setAttribute("selectVille", selectVille);

        //Calculating distance

        System.out.println("Index 1");
        System.out.println(request.getParameter("indexV1"));
        Double distance = 35.78;


//        HttpSession session = request.getSession();
//        Ville ville1 = (Ville) session.getAttribute("ville1");
//        Ville ville2 = (Ville) session.getAttribute("ville2");
//        double distance = ville1.getDistance(ville2);
//        session.setAttribute("distance",distance);

        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/pageDistance.jsp").forward(request, response);
    }
}
