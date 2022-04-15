<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="header.jsp" />
    </head>
    <body>
        <jsp:include page="navBar.jsp" />
        <div class="px-5 pt-5">
            <br><br>
            <h1>Projet TWIC</h1>
            <br>
            <h3>Partie Server</h3>
            <br>
            <p> Il peut être nécessaire de changer les valeurs des fichiers suivants :
            <ul>
                <li>
                    <a>Dans « src\main\resources » : application.properties</a>
                </li>
                <li>
                    <a>logback.xml (propriété du répertoire de log)</a>
                </li>
            </ul>
                A partir des sources, développer l’ensemble des fonctionnalités GET, POST, PUT et DELETE pour la table de la BDD (ville_france).
                <br>Attention, pour le cas du GET penser deux cas, à savoir :
                <ul>
                    <li>
                        <a>Récupérer l’ensemble des données de la table</a>
                    </li>
                    <li>
                        <a>Récupérer en fonction du filtre (ou plusieurs filtres)</a>
                    </li>
                </ul>
            <p style="color: royalblue">Pour aller plus loin : la possibilité d’inhiber une valeur (comme si elle était supprimée), mais il
            vous faudra une modification de la BDD avec un flag).</p>
        </div>
        <div class="px-5 pb-3">
            <br>
            <h3>Partie Client</h3>
            <br>

            <p class="font-weight-bold">Faire un projet J2EE qui affichera deux listes déroulantes avec la liste de l’ensemble des villes et calculer la distance entre deux villes sélectionnées.</p>
            <p> Sur une deuxième page/onglet, il faudra afficher le contenu de la table BDD « ville_france » de façon
                paginée par 50 résultats. </p>
            <p>Lors d’un clic sur une ligne d’une ville, une nouvelle page permettra d’éditer les données.</p>
            <br><br>
            <div style="color: royalblue">
            <p>
                Pour aller plus loin : La possibilité de supprimer la donnée d’une ville (ou plus simple de l’inhiber, mais il vous faudra une modification de la BDD avec un flag).
                <br> Bonus :
                <ul>
                    <li>
                        <a>Récupérer les informations de météo</a>
                    </li>
                    <li>
                        <a>Pour chaque information de ville destinations, il faudra afficher la température.</a>
                    </li>
                    <li>
                        <a>Afficher une image de la météo en plus de la température.</a>
                    </li>
                </ul>
                <br>Vous pouvez utiliser une API de « openweathermap », cependant il faudra faire la demande de « key » <a href="https://openweathermap.org/appid">(Demander)</a>
                <br>Pour récupérer les informations de météo sur le lien suivant : <a href="https://api.openweathermap.org">OpenWeatherMap</a> et aller dans l’API qui permet de récupérer les données météo actuelles.
                <br>L’API est assez flexible, mais dans notre cas nous allons utiliser les positions GPS dans l’appel et de plus il faut la température en °C.
            </div>
        </div>
    </body>
</html>
