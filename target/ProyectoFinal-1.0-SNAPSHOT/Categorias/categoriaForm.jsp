<%-- 
    Document   : categoriaForm
    Created on : 20 ene 2021, 21:28:39
    Author     : Adrian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bet.io | Categoría</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <link href="./assets/Styles.css" rel="stylesheet">
        <link type="text/css" href="${pageContext.request.contextPath}/assets/Apuestas.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg custom-navbar">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Bet.io</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="ApuestaServlet?action=graficar">Inicio</a>
                        </li>
                        <c:if test="${sessionScope.nombreUsuario != null}">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="ApuestaServlet?action=lista">Apuestas</a>
                            </li>
                            <c:if test="${sessionScope.tipoUsuario == 'ADMIN'}">
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="TicketsServlet?action=lista">Tickets</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="CategoriaServlet?action=lista">Categorías</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="ApuestaServlet?action=verPDF">Reporte apuestas abiertas</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=lista">Usuarios</a>
                                </li>
                            </c:if>


                        </c:if>
                        <!--                        <li class="nav-item">
                                                    <a class="nav-link" href="#">Features</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Pricing</a>
                                                </li>-->
                    </ul>
                    <span class="navbar-text">
                        <ul class="navbar-nav mb-lg-0">
                            <c:if test="${sessionScope.nombreUsuario != null}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <c:out value="${sessionScope.nombreUsuario}"></c:out>
                                        </a>
                                        <ul class="dropdown-menu" style="left: -45px" aria-labelledby="navbarDropdownMenuLink">
                                            <li><a class="dropdown-item" href="UsuarioServlet?action=perfil">Perfil</a></li>
                                            <li><a class="dropdown-item" href="UsuarioServlet?action=logout">Cerrar sesión</a></li>
                                        </ul>
                                    </li>
                            </c:if>

                            <c:if test="${sessionScope.nombreUsuario == null}">
                                <li>
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=ingresar">Iniciar sesión</a>
                                </li>
                                <li>
                                    <a class="nav-link" aria-current="page" href="UsuarioServlet?action=registrar">Registrarme</a>
                                </li>
                            </c:if>
                        </ul>
                    </span>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="mt-3">
                <a href="CategoriaServlet?action=lista">
                    <i class="bi bi-arrow-left-circle-fill"></i>
                    Regresar
                </a>
            </div>

            <div class="row align-items-center justify-content-center">
                <div class="col-6">
                    <div class="mt-3 d-flex justify-content-between">
                        <div>
                            <h1>
                                <c:if test = "${dto.entidad.idCategoria != null}">
                                    Actualizar Categoria
                                </c:if>
                                <c:if test = "${dto.entidad.idCategoria == null}">
                                    Crear Categoria
                                </c:if>
                            </h1>
                        </div>
                        <a href="CategoriaServlet?action=eliminar&idCategoria=<c:out value="${dto.entidad.idCategoria}" />" class="delete-link">Eliminar</a>
                    </div>
                    <div class="card bg-light">
                        <div class="card-header" style="background: #dddddd;">
                            <div class="row justify-content-between">
                                <div class="col-6">
                                    Datos de categoría
                                </div>
                                <div class="col-6 text-end">
                                    ID: <c:out value="${dto.entidad.idCategoria}" />
                                </div>
                            </div>
                        </div>
                        <div class="card-body">


                            <form method="POST" action="CategoriaServlet?action=guardar" >
                                <input name="idCategoria" id="idCategoria" type="hidden" value="<c:out value="${dto.entidad.idCategoria}" />" />
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Nombre de Categoria
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="nombreCategoria" 
                                        name="nombreCategoria"
                                        placeholder="Nombre nueva Categoria"
                                        required
                                        value="<c:out value="${dto.entidad.nombreCategoria}" />"
                                        >
                                </div>

                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Descripción de Categoria
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="descripcionCategoria" 
                                        name="descripcionCategoria"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${dto.entidad.descripcionCategoria}" />"
                                        >
                                </div>

                                <div class="row mt-3">
                                    <div class="col-6">
                                        <a href="CategoriaServlet?action=lista">
                                            <button type="button" class="btn cancel-gray-button">
                                                Cancelar
                                            </button>
                                        </a>
                                    </div>
                                    <div class="col-6 text-end">
                                        <button type="submit" class="btn accept-button">
                                            <c:if test="${dto.entidad.idCategoria != null}">
                                                Actualizar categoría
                                            </c:if>
                                            <c:if test="${dto.entidad.idCategoria == null}">
                                                Agregar categoría
                                            </c:if>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.min.js"></script>
</body>
</html>
