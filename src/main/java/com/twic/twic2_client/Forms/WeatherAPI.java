package com.twic.twic2_client.Forms;

import com.twic.twic2_client.Beans.Ville;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Objects;

public class WeatherAPI {

    private final HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_2)
            .build();


    private String[] getHttpRequest(String lat, String lon) throws IOException, InterruptedException {
        // Requesting connection with API
        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create("https://api.openweathermap.org/data/2.5/onecall?lat=" + lat + "&lon=" + lon + "&appid=927f9a5e338297105acab2e41bee26ac"))
                .build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Request status : " + response.statusCode());
        return response.body().split("[,{}:]");
    }

    public int getTemperature(String lat, String lon) throws IOException, InterruptedException {
        String[] json = this.getHttpRequest(lat, lon);

        //Parsing the result into ArrayList objects
        String tempStr = json[18].replaceAll("\"","");
        double tempDb = Double.parseDouble(tempStr) - 273.15;
        return (int) tempDb;
    }

    public String getWeatherIcon(String lat, String lon) throws IOException, InterruptedException {
        String[] json = this.getHttpRequest(lat, lon);

        String ico = json[48].replaceAll("\"","");
        return "http://openweathermap.org/img/w/" + ico + ".png";
    }

    public double getDistance(Ville ville1, Ville ville2) {
        return ville1.getDistance(ville2);
    }

}
