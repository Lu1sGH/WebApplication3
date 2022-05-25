/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gerdoc.helper;

import java.io.Serializable;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.gerdoc.dao.Proveedor;
import org.gerdoc.service.ProveedorService;


/**
 *
 * @author gerdoc
 */
public class ProveedorHelper implements Serializable
{
    private List<Proveedor>list;
    private Proveedor proveedor;

    public ProveedorHelper() 
    {
    }
    
    public boolean loadList( )
    {
        list = new ProveedorService().getProveedorList();
        return list != null && list.size() > 0;
    }
    
    public boolean addProveedor( HttpServletRequest request )
    {
        proveedor = new Proveedor( ); 
        proveedor.setNombre( request.getParameter( "nombre" ) );
        if( proveedor.getNombre() == null || proveedor.getNombre().length() == 0 )
        {
            return false;
        }
        return new ProveedorService().addProveedor(proveedor);
    }
    
    public Integer getInteger( String campo )
    {
        Integer val = 0;
        if( campo == null || campo.length() == 0 )
        {
            return null;
        }
        try
        {
            val = new Integer(campo);
            return val;
        }
        catch(NumberFormatException ex)
        {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean deleteProveedor( HttpServletRequest request )
    {
        proveedor = new Proveedor( ); 
        proveedor.setId( getInteger( request.getParameter( "id" )) );
        if( proveedor.getId( ) == null )
        {
            return false;
        }
        return new ProveedorService().deleteProveedor( proveedor );
    }
    
    public boolean updateProveedor( HttpServletRequest request )
    {
        proveedor = new Proveedor( ); 
        proveedor.setId( getInteger( request.getParameter( "id" )) );
        if( proveedor.getId( ) == null )
        {
            return false;
        }
        proveedor.setNombre( request.getParameter( "nombre" ) );
        if( proveedor.getNombre() == null || proveedor.getNombre().length() == 0 )
        {
            return false;
        }
        return new ProveedorService().updateProveedor( proveedor );
    }
    
    public Proveedor getProveedorById( HttpServletRequest request )
    {
        Proveedor proveedor = null;
        Integer id = null;
        id = getInteger( request.getParameter( "id" ) );
        if( id == null )
        {
            return null;
        }
        return new ProveedorService().getProveedorById( id );
    }
    
    public List<Proveedor> getList()
    {
        if( list == null || list.size( )== 0 )
        {
            if( !loadList( ) )
            {
                return null;
            }
        }
        return list;
    }

    public void setList(List<Proveedor> list) 
    {
        this.list = list;
    }

    public Proveedor getProveedor() 
    {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) 
    {
        this.proveedor = proveedor;
    }
    
}
