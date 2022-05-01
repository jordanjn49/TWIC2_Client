<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="header.jsp" />
        <script src="https://kit.fontawesome.com/5d604ee4ae.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.js"></script>
        <script type='text/javascript' src='https://s3.amazonaws.com/dynatable-docs-assets/js/jquery.dynatable.js'></script>
        <link rel="stylesheet" media="all" href="https://s3.amazonaws.com/dynatable-docs-assets/css/jquery.dynatable.css" />
        <title></title>
    </head>

    <body class="pt-5">
        <jsp:include page="navBar.jsp" />

            <div class="mx-5 my-5">
                <table id="tableCommune" class="table">
                    <thead>
                        <tr class="table-dark">
                            <th scope="col"></th>
                            <th scope="col">Code INSEE</th>
                            <th scope="col">Nom de commune</th>
                            <th scope="col">CP</th>
                            <th scope="col">Libelle d'acheminement</th>
                            <th scope="col">Ligne 5</th>
                            <th scope="col">Latitude</th>
                            <th scope="col">Longitude</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ listVilles }" var="ville">
                            <tr>
                                <td>
                                    <button type="submit" class="btn btn-outline-danger">
                                        <i class="fa-solid fa-trash-can"></i>
                                    </button>
                                    <button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#editModal">
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
                    </tbody>
                </table>
            </div>

            <script>
                $(document).ready(function() {
                    $('#tableCommune').dynatable({
                        features: {
                            paginate: true,
                            sort: true,
                            pushState: true,
                            search: true,
                            recordCount: true,
                            perPageSelect: true
                        },
                        dataset: {
                            perPageDefault: 50,
                            perPageOptions: [5, 10, 25, 50, 100]
                        },
                        inputs: {
                            paginationNext: ">>",
                            paginationPrev: "<<",
                            pageText: "Page",
                            recordCountText: "Communes",
                            searchText: "Rechercher : ",
                            perPageText: "Pagination : ",
                            recordCountPageBoundTemplate: "{pageLowerBound} à {pageUpperBound} sur un total de"
                        },
                        params:{
                            records: "communes"
                        }
                    });
                    var styleSearch = "border: 2px solid goldenrod; border-radius: 3px;";
                    var styleActive = "background: goldenrod;";

                    document.getElementById('dynatable-query-search-tableCommune').setAttribute('style', styleSearch);
                    document.getElementsByClassName('dynatable-active-page').setAttribute('style',styleActive);
                    document.ge


                });
            </script>

        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modification</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formEdit" method="post" action="/ServletListeVilles">
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


<%--        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
