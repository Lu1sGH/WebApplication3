<%-- 
    Document   : UnoForm
    Created on : 13/05/2022, 01:34:33 AM
    Author     : gerdoc
--%>
<%@page import="org.gerdoc.helper.MarcaHelper"%>
<%@page import="org.gerdoc.dao.Marca"%>
<%
    Marca marca = new MarcaHelper( ).getMarcaById(request);
    if( marca == null)
    {
        marca = new Marca( );
        marca.setMarca("");
    }
    
%>
<form action="MarcaList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="marca">Marca:</label>
                <input type="text" class="form-contmarca" id="marca" placeholder="Escribe una marca" name="marca" value="<%=marca.getMarca()%>">
            </div>
        </div>
    </div>
        <%
            if(marca.getId_CatMarca() != null && marca.getId_CatMarca() > 0 )
            {
        %>
                <input type="hidden" id="action" name="action" value="actualizar" />
                <input type="hidden" id="id" name="id" value="<%=marca.getId_CatMarca()%>" />
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
