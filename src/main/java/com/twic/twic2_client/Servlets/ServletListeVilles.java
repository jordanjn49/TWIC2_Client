package com.twic.twic2_client.Servlets;

import com.twic.twic2_client.Beans.Ville;
import com.twic.twic2_client.Forms.VilleAPI;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ServletListeVilles")
public class ServletListeVilles extends HttpServlet {

    VilleAPI v_api = new VilleAPI();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Ville> listVilles = null;
        try {
            listVilles = v_api.getAllVilles();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        request.setAttribute("listVilles", listVilles);

        this.getServletContext().getRequestDispatcher("/WEB-INF/pageListeVilles.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id1 = request.getParameter("id_to_delete");

        System.out.println(id1);
//        try {
//            v_api.deleteVilleById(id1);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }

        this.getServletContext().getRequestDispatcher("/WEB-INF/pageListeVilles.jsp").forward(request, response);
    }
}
