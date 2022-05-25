<%-- 
    Document   : UnoForm
    Created on : 13/05/2022, 01:34:33 AM
    Author     : gerdoc
--%>
<%@page import="org.gerdoc.helper.ProductoHelper"%>
<%@page import="org.gerdoc.dao.Producto"%>
<%@page import="org.gerdoc.helper.MarcaHelper"%>
<%@page import="org.gerdoc.dao.Marca"%>
<%@page import="org.gerdoc.helper.ProveedorHelper"%>
<%@page import="org.gerdoc.dao.Proveedor"%>
<%@page import="java.util.List"%>
<%
    Producto producto = new ProductoHelper( ).getProductoById(request);
    if( producto == null)
    {
        producto = new Producto( new Marca(), new Proveedor());
        producto.setNombre("");
        producto.setDescripcion("");
        producto.setUrl("");
    }
    
%>
<form action="ProductoList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Nombre:</label>
                <input type="text" class="form-contproducto" id="nombre" placeholder="Escribe una producto" name="nombre" value="<%=producto.getNombre()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Descripción:</label>
                <input type="text" class="form-contproducto" id="descripcion" placeholder="Escribe una producto" name="descripcion" value="<%=producto.getDescripcion()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Foto:</label>
                <input type="text" class="form-contproducto" id="url" placeholder="Escribe una producto" name="url" value="<%=producto.getUrl()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Precio:</label>
                <input type="text" class="form-contproducto" id="precio" placeholder="Escribe una producto" name="precio" value="<%=producto.getPrecio()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Costo:</label>
                <input type="text" class="form-contproducto" id="costo" placeholder="Escribe una producto" name="costo" value="<%=producto.getCosto()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Proveedor:</label>
                <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" id="id_catprov" placeholder="Escribe un proveedor" name="id_catprov">
                    <option selected>Elige un proveedor</option>
                    <%
                        List<Proveedor>proveedorLit = new ProveedorHelper( ).getList( );
                        if( proveedorList != null && proveedorList.size() > 0 )
                        {
                           for( Proveedor proveedor : proveedorList )
                           {
                    %>
                            <option value="<%=proveedor.getId()%>"><%=proveedor.getNombre()%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="producto">Marca:</label>
                <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" id="id_catmarca" placeholder="Escribe una marca" name="id_catmarca">
                    <option selected>Elige un proveedor</option>
                    <%
                        List<Marca>marcaList = new MarcaHelper( ).getList( );
                        if( marcaList != null && marcaList.size() > 0 )
                        {
                           for( Marca marca : marcaList )
                           {
                    %>
                            <option value="<%=marca.getId_CatMarca()%>"><%=marca.getMarca()%></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
        </div>
    </div>
        <%
            if(producto.getId() != null && producto.getId() > 0 )
            {
        %>
                <input type="hidden" id="action" name="action" value="actualizar" />
                <input type="hidden" id="id" name="id" value="<%=producto.getId()%>" />
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
