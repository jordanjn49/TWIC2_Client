package com.twic.twic2_client.Forms;


import com.twic.twic2_client.Beans.Ville;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;

public class VilleAPI {

    private final HttpClient httpClient = HttpClient.newBuilder()
            .version(HttpClient.Version.HTTP_2)
            .build();


    private String[] getHttpRequest() throws IOException, InterruptedException {
        // Requesting connection with API
        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create("http://localhost:8181/villes/all"))
                .build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Request status : " + response.statusCode());
        return response.body().split("[,{}:]");
    }

    private String[] getByIdHttpRequest(String id) throws IOException, InterruptedException {
        // Requesting connection with API
        HttpRequest request = HttpRequest.newBuilder()
                .GET()
                .uri(URI.create("http://localhost:8181/villes/find/"+id))
                .build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Request status : " + response.statusCode());
        return response.body().split("[,{}:]");
    }

    public ArrayList<Ville> getAllVilles() throws IOException, InterruptedException {
        String[] json = this.getHttpRequest();
        //Parsing the result into ArrayList objects
        ArrayList<Ville> listVille = new ArrayList<>();
        for (int i=0; i < json.length/16; i++) {
            Ville villeSelected = new Ville();
            villeSelected.setId(json[2+(16*i)].replaceAll("\"",""));
            villeSelected.setNomCommune(json[4+(16*i)].replaceAll("\"",""));
            villeSelected.setCodePostal(json[6+(16*i)].replaceAll("\"",""));
            villeSelected.setLibelle(json[8+(16*i)].replaceAll("\"",""));
            villeSelected.setLigne(json[10+(16*i)].replaceAll("\"",""));
            villeSelected.setLatitude(json[12+(16*i)].replaceAll("\"",""));
            villeSelected.setLongitude(json[14+(16*i)].replaceAll("\"",""));
            listVille.add(villeSelected);
        }
        return listVille;
    }

    public Ville getVilleById(String id) throws IOException, InterruptedException {
        String[] json = this.getByIdHttpRequest(id);
            Ville villeSelected = new Ville();
            villeSelected.setId(json[2].replaceAll("\"",""));
            villeSelected.setNomCommune(json[4].replaceAll("\"",""));
            villeSelected.setCodePostal(json[6].replaceAll("\"",""));
            villeSelected.setLibelle(json[8].replaceAll("\"",""));
            villeSelected.setLigne(json[10].replaceAll("\"",""));
            villeSelected.setLatitude(json[12].replaceAll("\"",""));
            villeSelected.setLongitude(json[14].replaceAll("\"",""));
        return villeSelected;
    }

    public void deleteVilleById(String id) throws IOException, InterruptedException {
        // Requesting connection with API
        HttpRequest request = HttpRequest.newBuilder()
                .DELETE()
                .uri(URI.create("http://localhost:8181/villes/delete/"+id))
                .build();
        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
        System.out.println("Request status : " + response.statusCode());
    }

}
