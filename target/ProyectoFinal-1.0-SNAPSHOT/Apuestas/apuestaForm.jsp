<%-- 
    Document   : apuestaForm
    Created on : 21 ene 2021, 0:55:05
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
                <a href="ApuestaServlet?accion=listaDeApuestas">
                    <i class="fa fa-arrow-left"></i>
                    Regresar
                </a>
            </div>
            <div class="mt-3">
                <h1>
                    <c:if test = "${dto.entidad.idApuesta != null}">
                        Actualizar Apuesta
                    </c:if>
                    <c:if test = "${dto.entidad.idApuesta == null}">
                        Crear Apuesta
                    </c:if>
                </h1>
            </div>
            <div class="row align-items-center">
                <div class="col-5">
                    <img src="./assets/Registrar.jpg" alt="apuesta" class="w-100" />
                </div>
                <div class="col-7">
                    <div class="card bg-light">
                        <div class="card-header" style="background: #216ed4;">
                            <div class="row">
                                <div class="col-6">
                                    Datos de la nueva Apuesta
                                </div>
                                <div class="col-6 text-right">
                                    <c:out value="${dto.entidad.idApuesta}" />
                                </div>
                            </div>
                        </div>
                        <div class="card-body">


                            <form method="POST" action="ApuestaServlet?accion=guardar" >
                                <input name="idApuesta" id="idApuesta" type="hidden" value="<c:out value="${dto.entidad.idApuesta}" />" />
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Nombre de Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="nombreApuesta" 
                                        name="nombreApuesta"
                                        placeholder="Nombre nueva Apuesta"
                                        required
                                        value="<c:out value="${dto.entidad.nombreApuesta}" />"
                                        >
                                </div>

                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Descripción de Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="descripcionApuesta" 
                                        name="descripcionApuesta"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${dto.entidad.descripcionApuesta}" />"
                                        >
                                </div>
                                <div class="mb-2">
                                    <c:if test="${dto.entidad.idCategoria == null}">
                                        <label class="form-label mini">
                                            Categoría
                                        </label>
                                        <select
                                            class="form-select"
                                            id="idCategoria"
                                            name="idCategoria"
                                            placeholder="Selecciona..."
                                            value="<c:out value="${dto.entidad.idCategoria}" />"
                                            aria-label="Default select example">
                                            <c:forEach var="option" items="${categorias}">
                                                <option
                                                    selected="<c:if test="${ option.entidad.idCategoria == dto.entidad.idCategoria }">"true"</c:if>"
                                                    value="<c:out value="${option.entidad.idCategoria}" />">
                                                    <c:out value="${option.entidad.nombreCategoria}" />
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                    <c:if test="${dto.entidad.idCategoria != null}">
                                        <label class="form-label mini">
                                            Categoría- Actualizar
                                        </label>
                                        <input disabled
                                            
                                            class="form-select"
                                            id="idCategoria"
                                            name="idCategoria"
                                            placeholder="Selecciona..."
                                            value="<c:out value="${dto.entidad.idCategoria}" />"
                                            >
                                            
                                    </c:if>
                                </div>
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Status Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="status" 
                                        name="status"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${dto.entidad.status}" />"
                                        >
                                </div>                  
                                <div class="mt-3">
                                    <button type="submit" class="login-btn">
                                        <c:if test="${dto.entidad.idApuesta != null}">
                                            Actualizar Apuesta
                                        </c:if>
                                        <c:if test="${dto.entidad.idApuesta == null}">
                                            Agregar Apuesta
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