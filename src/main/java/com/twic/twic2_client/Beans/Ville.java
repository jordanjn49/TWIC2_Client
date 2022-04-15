package com.twic.twic2_client.Beans;

public class Ville {

    private String id;
    private String nomCommune;
    private String codePostal;
    private String libelle;
    private String ligne;
    private String latitude;
    private String longitude;

    public Ville() {
    }

    public Ville(String code_commune_INSEE, String nom_commune, String code_postal, String libelle_acheminement, String ligne_5, String latitude, String longitude) {
        id = code_commune_INSEE;
        nomCommune = nom_commune;
        codePostal = code_postal;
        libelle = libelle_acheminement;
        ligne = ligne_5;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public double getDistance(Ville ville2) {
        double lat1 = Double.parseDouble(this.getLatitude());
        double lon1 = Double.parseDouble(this.getLongitude());
        double lat2 = Double.parseDouble(ville2.getLatitude());
        double lon2 = Double.parseDouble(ville2.getLongitude());
        double theta = lon1 - lon2;
        double dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515 * 1.609344;
        return (dist);
    }

    private double deg2rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    private double rad2deg(double rad) {
        return (rad * 180.0 / Math.PI);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNomCommune() {
        return nomCommune;
    }

    public void setNomCommune(String nomCommune) {
        this.nomCommune = nomCommune;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getLigne() {
        return ligne;
    }

    public void setLigne(String ligne) {
        this.ligne = ligne;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    @Override
    public String toString() {
        return "--------------------------" + "\n" +
                "id = " + id + "\n" +
                "Nom commune = " + nomCommune + "\n" +
                "Code postal = " + codePostal + "\n" +
                "Libelle acheminement = " + libelle + "\n" +
                "Ligne5 = " + ligne + "\n" +
                "Latitude = " + latitude + "\n" +
                "Longitude = " + longitude + "\n" +
                "--------------------------";
    }
}
