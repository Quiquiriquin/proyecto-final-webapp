<%-- 
    Document   : categoriaForm
    Created on : 20 ene 2021, 21:28:39
    Author     : Adrian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="mt-3">
                <a href="CategoriaServlet?accion=listaDeCategorias">
                    <i class="fa fa-arrow-left"></i>
                    Regresar
                </a>
            </div>
            <div class="mt-3">
                <h1>
                    <c:if test = "${dto.entidad.idCategoria != null}">
                        Actualizar Categoria
                    </c:if>
                    <c:if test = "${dto.entidad.idCategoria == null}">
                        Crear Categoria
                    </c:if>
                </h1>
            </div>
            <div class="row align-items-center">
                <div class="col-5">
                    <img src="./assets/Registrar.jpg" alt="categoria" class="w-100" />
                </div>
                <div class="col-7">
                    <div class="card bg-light">
                        <div class="card-header" style="background: #216ed4;">
                            <div class="row">
                                <div class="col-6">
                                    Datos de la nueva Categoria
                                </div>
                                <div class="col-6 text-right">
                                    <c:out value="${dto.entidad.idCategoria}" />
                                </div>
                            </div>
                        </div>
                        <div class="card-body">


                            <form method="POST" action="CategoriaServlet?accion=guardar" >
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
                                <div class="mt-3">
                                    <button type="submit" class="login-btn">
                                        <c:if test="${dto.entidad.idCategoria != null}">
                                            Actualizar Categoria
                                        </c:if>
                                        <c:if test="${dto.entidad.idCategoria == null}">
                                            Agregar Categoria
                                        </c:if>
                                    </button>
                                </div>
                            </form>
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
