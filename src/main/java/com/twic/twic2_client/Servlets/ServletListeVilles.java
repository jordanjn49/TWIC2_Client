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

@WebServlet("/ServletListeVilles")
public class ServletListeVilles extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VilleAPI api = new VilleAPI();
        ArrayList<Ville> listVilles = null;
        try {
            listVilles = api.getAllVilles();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        request.setAttribute("listVilles", listVilles);

        this.getServletContext().getRequestDispatcher("/WEB-INF/pageListeVilles.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/pageListeVilles.jsp").forward(request, response);
    }
}
