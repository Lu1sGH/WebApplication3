<%-- 
    Document   : productoList
    Created on : 12/05/2022, 01:56:02 PM
    Author     : Alumno
--%>

<%@page import="org.gerdoc.helper.ProductoHelper"%>
<%@page import="org.gerdoc.dao.Producto"%> 
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>producto List</title>
    </head>
    
        <div class="container-fluid p-5 bg-primary text-white text-center">
            Lista producto
        </div>
        <div class="container mt-4"> 
            <%
                if( request == null )
                {
                    return;
                }
                String action = request.getParameter( "action" );
                if( action == null )
                {
                    action = "";
                }
                switch( action )
                {
                    case "nuevo":
                    case "editar":
            %>
                        <jsp:include page="ProductoForm.jsp" />
            <%
                        break;
                    case "send":
                        if( new ProductoHelper( ).addProducto(request) )
                        {
                            response.sendRedirect("ProductoList.jsp");
                        }
                        break;
                    case "delete":
                        if( new ProductoHelper( ).deleteProducto(request) )
                        {
                            response.sendRedirect("ProductoList.jsp");
                        }
                        break;
                    case "actualizar":
                        if( new ProductoHelper( ).updateProducto(request) )
                        {
                            response.sendRedirect("ProductoList.jsp");
                        }
                        break;
                    default:
            %>
                        <jsp:include page="ProductoTable.jsp" />
            <%
                }
            %>
        
        </div>
</html>
