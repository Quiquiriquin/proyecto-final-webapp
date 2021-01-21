<%-- 
    Document   : ver
    Created on : 21 ene 2021, 0:55:26
    Author     : Adrian
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container"> 
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <img src="imagenes/LogoEscom.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
                    Bienvenido [Nombre de Admin xD]
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../CategoriaServlet?accion=listaDeCategorias">Lista de Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CategoriaServlet?accion=nuevo">Lista de Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ProductoServlet?action=lista">Lista de Apuestas</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                MI perfil
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Configuración</a>
                                <a class="dropdown-item" href="#">Aviso de Privacidad</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Cerrar Sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="container">
                <div class="mt-3">
                    <a href="ApuestaServlet?accion=listaDeApuestas">
                        <i class="fa fa-arrow-left"></i>
                        Regresar
                    </a>
                </div>
                <div class="row align-items-center">
                    <div class="col-6">
                        <img src="./assets/categoria.jpg" alt="categoria" class="w-100" />
                    </div>
                    <div class="col-6">
                        <div class="card bg-light">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-6">
                                        Datos de Apuesta
                                    </div>
                                    <div class="col-6 text-right">
                                        <c:out value="${cat.entidad.idApuesta}" />
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Nombre Apuesta
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.nombreApuesta}" />
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Descripcion Apuesta
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.descripcionApuesta}" />
                                    </div>
                                </div>                        
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Categoria 
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.idCategoria}" />
                                    </div>
                                </div>                        
                                <div class="mb-3">
                                    <div class="categoria-label-desc">
                                        Status 
                                    </div>
                                    <div class="categoria-label">
                                        <c:out value="${cat.entidad.status}" />
                                    </div>
                                </div>                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
    </body>
</html>

