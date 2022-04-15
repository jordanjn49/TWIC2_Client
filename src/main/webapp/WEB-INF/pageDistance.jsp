<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="selectVille" scope="request" type="java.util.ArrayList"/>
<html>
<head>
    <jsp:include page="header.jsp" />
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
    <script type="text/javascript">
        function getIndexes() {
            var indexV1 = document.getElementById("ville1").selectedIndex;
            var indexV2 = document.getElementById("ville2").selectedIndex;
            alert('Selected Indexes are : ' + indexV1 + ' ' + indexV2);
        }
    </script>
</head>

<body class="pt-3">
    <jsp:include page="navBar.jsp" />
    <br><br>

    <div class="container px-4 pt-5" id="choix">
        <h2 class="pb-2 border-bottom">Outil : Calcul de distance entre deux villes </h2>
        <div class="row g-4 pt-5 row-cols-1 row-cols-lg-3">

            <div class="feature col text-center">
                <div class="feature-icon pb-3">
                    <img src="https://freepikpsd.com/file/2019/10/logo-location-png-3-Transparent-Images-Free.png" class="" style="max-width:20%;" alt="Responsive image">
                </div>
                <h2>1ère Ville : </h2>
                <p>Veuillez choisir une ville de France parmis les villes représentées dans la liste ci-dessous.</p>



                <select class="form-select" data-live-search="true" aria-label="Default select example" id="ville1">
                    <optgroup label="Code postal - Nom de commune">
                        <c:forEach items="${ selectVille }" var="ville" varStatus="index">
                            <option value="${ index.count }"><c:out value="${ ville.codePostal } - ${ ville.nomCommune }" /></option>
                        </c:forEach>
                    </optgroup>
                </select>
            </div>







            <div class="feature col mt-5 text-center">
                <br><br><br>
                <button type="button" class="btn btn-outline-warning" onclick="getIndexes()" value="Click">
                    GO
                </button>
            </div>

            <div class="feature col text-center">
                <div class="feature-icon pb-3">
                    <img src="https://freepikpsd.com/file/2019/10/logo-location-png-3-Transparent-Images-Free.png" class="" style="max-width:20%;" alt="Responsive image">
                </div>
                <h2>2ème Ville : </h2>
                <p>Veuillez choisir une deuxième ville parmis les villes représentées dans la liste ci-dessous.</p>
                <select class="form-select" data-live-search="true" aria-label="Default select example" id="ville2">
                    <optgroup label="Code postal - Nom de commune">
                         <c:forEach items="${ selectVille }" var="ville" varStatus="index">
                             <option value="${ index.count }"><c:out value="${ ville.codePostal } - ${ ville.nomCommune }" /></option>
                         </c:forEach>
                    </optgroup>
                </select>
            </div>


        </div>
    </div>


    <div class="container px-4 pb-5" id="distance">
        <div class="row g-4 row-cols-1 row-cols-lg-3">
            <div class="feature col"></div>

            <div class="feature col mt-5 text-center">
                <div class="feature-icon pb-3">
                    <img src="http://cdn.onlinewebfonts.com/svg/img_466583.png" class="" style="max-width:20%;" alt="Responsive image">
                </div>
                <h2>Distance</h2>
                <p>La distance estimée entre les deux villes vaut</p>
                <h4 style="color: goldenrod"><c:out value="${ distance } km(s)."/></h4>
            </div>
            <div class="feature col"></div>
        </div>
    </div>

    </body>
</html>