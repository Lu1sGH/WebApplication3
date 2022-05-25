<%-- 
    Document   : UnoForm
    Created on : 13/05/2022, 01:34:33 AM
    Author     : gerdoc
--%>
<%@page import="org.gerdoc.helper.ProveedorHelper"%>
<%@page import="org.gerdoc.dao.Proveedor"%>
<%
    Proveedor proveedor = new ProveedorHelper( ).getProveedorById(request);
    if( proveedor == null)
    {
        proveedor = new Proveedor( );
        proveedor.setNombre("");
    }
    
%>
<form action="ProveedorList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="proveedor">Proveedor:</label>
                <input type="text" class="form-contproveedor" id="nombre" placeholder="Escribe un nombre" name="nombre" value="<%=proveedor.getNombre()%>">
            </div>
        </div>
    </div>
        <%
            if(proveedor.getId() != null && proveedor.getId() > 0 )
            {
        %>
                <input type="hidden" id="action" name="action" value="actualizar" />
                <input type="hidden" id="id" name="id" value="<%=proveedor.getId()%>" />
        <%
            }
            else
            {
        %>
                <input type="hidden" id="action" name="action" value="send" />
        <%
            }
        %>
    <div class="row mt-4 grey">
        <div class=""input-group mb-3">
            <button type="submit" class="btn btn-primary">Enviar</button>
            <button type="reset" class="btn btn-primary">Borrar</button>
        </div>
    </div>
</form>
<br/>
<div class="row mt-6">
    <a href="?">
        <button type="button" class="btn btn-outline-primary" >Regresar</button>
    </a>
</div>
