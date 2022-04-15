<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="header.jsp" />
        <script src="https://kit.fontawesome.com/5d604ee4ae.js" crossorigin="anonymous"></script>
        <title></title>
    </head>
    <body class="pt-5">
        <jsp:include page="navBar.jsp" />

        <div class="mx-5 my-5">
        <table id="table" class="table table-striped table-bordered table-sm">
            <thead class="thead-dark">
            <tr>
                <th class="th-sm"></th>
                <th class="th- col">Code INSEE</th>
                <th class="th-sm">Nom de commune</th>
                <th class="th-sm">CP</th>
                <th class="th-sm">Libelle d'acheminement</th>
                <th class="th-sm">Ligne 5</th>
                <th class="th-sm">Latitude</th>
                <th class="th-sm">Longitude</th>
            </tr>
            <jsp:useBean id="listVilles" scope="request" type="java.util.ArrayList"/>
            <c:forEach items="${ listVilles }" var="ville">
                <tr>
                    <td>
                        <button type="button" class="btn btn-outline-danger">
                            <i class="fa-solid fa-trash-can"></i>
                        </button>
                        <button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>
                    </td>
                    <td><c:out value="${ ville.id }" /></td>
                    <td><c:out value="${ ville.nomCommune }" /></td>
                    <td><c:out value="${ ville.codePostal }" /></td>
                    <td><c:out value="${ ville.libelle }" /></td>
                    <td><c:out value="${ ville.ligne }" /></td>
                    <td><c:out value="${ ville.latitude }" /></td>
                    <td><c:out value="${ ville.longitude }" /></td>
                </tr>
            </c:forEach>
            </thead>
        </table>
        </div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modification</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <h5>Modifier ci-dessous les attributs de la ville.</h5>
                            <div class="form-group">
                                <label for="id_input" class="col-form-label">Code INSEE:</label>
                                <input type="text" class="form-control" id="id_input">
                            </div>
                            <div class="form-group">
                                <label for="nomCommune_input" class="col-form-label">Nom commune :</label>
                                <input type="text" class="form-control" id="nomCommune_input">
                            </div>
                            <div class="form-group">
                                <label for="codePostal_input" class="col-form-label">Code Postal :</label>
                                <input type="text" class="form-control" id="codePostal_input">
                            </div>
                            <div class="form-group">
                                <label for="libelle_input" class="col-form-label">Libelle :</label>
                                <input type="text" class="form-control" id="libelle_input">
                            </div>
                            <div class="form-group">
                                <label for="ligne_input" class="col-form-label">Ligne 5 :</label>
                                <input type="text" class="form-control" id="ligne_input">
                            </div>
                            <div class="form-group">
                                <label for="latitude_input" class="col-form-label">Latitude :</label>
                                <input type="text" class="form-control" id="latitude_input">
                            </div>
                            <div class="form-group">
                                <label for="longitude_input" class="col-form-label">Longitude :</label>
                                <input type="text" class="form-control" id="longitude_input">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                        <button type="button" class="btn btn-primary">Enregistrer</button>
                    </div>
                </div>
            </div>
        </div>

        <nav aria-label="...">
            <ul class="pagination justify-content-center" >
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
