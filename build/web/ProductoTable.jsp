<%-- 
    Document   : ProductoTable
    Created on : 13/05/2022, 01:13:16 AM
    Author     : gerdoc
--%>

<%@page import="org.gerdoc.dao.Producto"%>
<%@page import="org.gerdoc.helper.ProductoHelper"%>
<%@page import="java.util.List"%>
<div class="row">
    <a href="?action=nuevo">
        <button type="button" class="btn btn-outline-primary" >Nuevo</button>
    </a>
    <br/><br/>
</div>
<%
    List<Producto>productoList = null;
    productoList = new ProductoHelper( ).getList( );
    if( productoList == null || productoList.size() == 0 )
    {
%>
        <div class="row mt-4">
            <p>Lista producto sin datos</p>
        </div>
<%            
        return;
    }
%>
        <div class="table-responsive">
            <table class="table align-middle">
                <thead class="table-Light">
                    <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>DESCRIPCIÓN</th>
                        <th>FOTO</th>
                        <th>PRECIO($)</th>
                        <th>COSTO($)</th>
                        <th>PROVEEDOR</th>
                        <th>MARCA</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
<%
    for( Producto producto : productoList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <%=producto.getId()%>
                        </td>
                        <td>
                            <%=producto.getNombre()%>
                        </td>
                        <td>
                            <%=producto.getDescripcion()%>
                        </td>
                        <td>
                            <img src="<%=producto.getUrl()%>" class="img-thumbnail" alt="Foto de un/una <%=producto.getNombre()%>">
                        </td>
                        <td>
                            <%=producto.getPrecio()%>
                        </td>
                        <td>
                            <%=producto.getCosto()%>
                        </td>
                        <td>
                            <%=producto.getProveedor().getNombre()%>
                        </td>
                        <td>
                            <%=producto.getMarca().getMarca()%>
                        </td>
                        <td>
                            <a href="?action=delete&id=<%=producto.getId()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                            <a href="?action=editar&id=<%=producto.getId()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-edit"></i>
                                </button>
                            </a>
                        </td>
                    </tr>
                </tbody>
<%
    }
%>
            </table>
        </div>