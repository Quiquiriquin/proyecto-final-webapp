<%-- 
    Document   : verUsuario
    Created on : 22 ene 2021, 0:01:58
    Author     : frida
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hacer Apuesta</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container">
            <div class="mt-3">
                <a href="ApuestaServlet?accion=ApostarAqui">
                    <i class="fa fa-arrow-left"></i>
                    Regresar
                </a>
            </div>
            <div class="mt-3">
                <h1>
                    Ingresa Datos de Apuesta
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
                                    Datos de tu Apuesta
                                </div>
                                <div class="col-6 text-right">
                                    <c:out value="${ap.entidad.idApuesta}" />
                                </div>
                            </div>
                        </div>
                        <div class="card-body">


                            <form method="POST" action="ApuestaServlet?accion=apostar" >
                                <input name="idApuesta" id="idApuesta" type="hidden" value="<c:out value="${ap.entidad.idApuesta}" />" />
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
                                        value="<c:out value="${ap.entidad.nombreApuesta}" />"
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
                                        value="<c:out value="${ap.entidad.descripcionApuesta}" />"
                                        >
                                </div>
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Ganador de tu Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="ganador" 
                                        name="ganador"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${ap.entidad.descripcionApuesta}" />"
                                        >
                                </div>
                                <div class="mb-2">
                                    <label class="form-label mini">
                                        Monto de Apuesta
                                    </label>
                                    <input 
                                        type="text" 
                                        class="form-control" 
                                        id="montoApuesta" 
                                        name="montoApuesta"
                                        placeholder="Doe"
                                        required
                                        value="<c:out value="${ap.entidad.descripcionApuesta}" />"
                                        >
                                </div>                                                  
                                <div class="mt-3">
                                    <button type="submit" class="login-btn">
                                        Apostar
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

