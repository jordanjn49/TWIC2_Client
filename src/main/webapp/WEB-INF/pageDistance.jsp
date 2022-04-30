<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <jsp:include page="header.jsp"/>
        <title></title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
    </head>

    <body class="pt-3">
        <jsp:include page="navBar.jsp"/>
        <br><br>

        <form id="formV1" method="post" action="/Distance">
            <div class="container px-4 pt-4" id="choix">
                <h2 class="pb-2 border-bottom">Outil : Calcul de distance entre deux villes </h2>
                <div class="row g-4 pt-3 row-cols-1 row-cols-lg-3">

                    <div class="feature col text-center">
                        <div class="feature-icon pb-3">
                            <img src="https://freepikpsd.com/file/2019/10/logo-location-png-3-Transparent-Images-Free.png"
                                 class="" style="max-width:20%;" alt="Responsive image">
                        </div>
                        <h2>1ère Ville : </h2>
                        <p>Veuillez choisir une ville de France parmis les villes représentées dans la liste ci-dessous.</p>


                        <select class="form-select" data-live-search="true" aria-label="Default select example" id="id1"
                                name="id1">
                            <optgroup label="Code postal - Nom de commune">
                                <c:forEach items="${ sessionScope.selectVille }" var="ville" varStatus="index">
                                    <option value="${ ville.id }"><c:out
                                            value="${ ville.codePostal } - ${ ville.nomCommune }"/></option>
                                </c:forEach>
                            </optgroup>
                        </select>

                        <br>
                        <c:if test="${ !empty sessionScope.tempV1 }">
                            <h5 style="color: slategrey"><c:out value="Dernière ville selectionnée : ${ sessionScope.nameV1 }"/></h5>
                            <h5 style="color: goldenrod"><c:out value="Température actuelle : ${ sessionScope.tempV1 }°C"/></h5>
                            <div class="feature-icon pb-3">
                                <img src="${ iconV1 }" class="" style="max-width:20%;" alt="Responsive image">
                            </div>
                        </c:if>
                    </div>


                    <div class="feature col mt-5 text-center">
                        <br><br><br>
                        <input type="submit" class="btn btn-outline-warning" value="GO"/>
                    </div>


                    <div class="feature col text-center">
                        <div class="feature-icon pb-3">
                            <img src="https://freepikpsd.com/file/2019/10/logo-location-png-3-Transparent-Images-Free.png"
                                 class="" style="max-width:20%;" alt="Responsive image">
                        </div>
                        <h2>2ème Ville : </h2>
                        <p>Veuillez choisir une deuxième ville parmis les villes représentées dans la liste ci-dessous.</p>
                        <select class="form-select" data-live-search="true" aria-label="Default select example" id="id2"
                                name="id2">
                            <optgroup label="Code postal - Nom de commune">
                                <c:forEach items="${ sessionScope.selectVille }" var="ville" varStatus="index">
                                    <option value="${ ville.id }"><c:out
                                            value="${ ville.codePostal } - ${ ville.nomCommune }"/></option>
                                </c:forEach>
                            </optgroup>
                        </select>

                        <br>
                        <c:if test="${ !empty sessionScope.tempV2 }">
                            <h5 style="color: slategrey"><c:out value="Dernière ville selectionnée : ${ sessionScope.nameV2 }"/></h5>
                            <h5 style="color: goldenrod"><c:out value="Température actuelle : ${ sessionScope.tempV2 }°C"/></h5>
                            <div class="feature-icon pb-3">
                                <img src="${ sessionScope.iconV2 }" class="" style="max-width:20%;" alt="Responsive image">
                            </div>
                        </c:if>
                    </div>


                </div>
            </div>
        </form>

        <div class="container px-4 pb-1" id="distance">
            <div class="row g-4 row-cols-1 row-cols-lg-3">
                <div class="feature col"></div>

                <div class="feature col mt-5 text-center">
                    <div class="feature-icon pb-3">
                        <img src="http://cdn.onlinewebfonts.com/svg/img_466583.png" class="" style="max-width:20%;"
                             alt="Responsive image">
                    </div>
                    <h2>Distance</h2>
                    <p>La distance estimée entre les deux villes vaut</p>
                    <c:if test="${ !empty sessionScope.tempV1 }">
                        <h4 style="color: goldenrod"><c:out value="${ sessionScope.distance } km(s)."/></h4>
                    </c:if>
                </div>
                <div class="feature col"></div>
            </div>
        </div>

    </body>
</html>