/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.gerdoc.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.gerdoc.dao.Marca;

/**
 *
 * @author gerdoc
 */
public class MarcaService 
{
    
    public List<Marca> getMarcaList( )
    {
        List<Marca>marcaList = null;
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Marca marca = null;
        
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            statement = connection.createStatement( );
            if( statement == null )
            {
                return null;
            }
            resultSet = statement.executeQuery( "SELECT * FROM TBL_MARCA" );
            if( resultSet == null )
            {
                return null;
            }
            marcaList = new ArrayList<>();
            while( resultSet.next() )
            {
                marca = new Marca();
                marca.setId_CatMarca(resultSet.getInt(1) );
                marca.setMarca(resultSet.getString(2) );
                marcaList.add(marca);
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return marcaList;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean addMarca( Marca marca )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "INSERT INTO TBL_MARCA(MARCA) VALUES(?)";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, marca.getMarca());
            
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteMarca( Marca marca )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "DELETE FROM TBL_MARCA WHERE ID_CATMARCA = ?";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setInt(1, marca.getId_CatMarca());
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
    public Marca getMarcaById( Integer id )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String sql = "SELECT * FROM TBL_MARCA WHERE ID_CATMARCA= ?";
        Marca marca = null;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return null;
            }
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id );
            resultSet = preparedStatement.executeQuery( );
            if( resultSet == null )
            {
                return null;
            }
            while( resultSet.next() )
            {
                marca = new Marca();
                marca.setId_CatMarca(resultSet.getInt(1) );
                marca.setMarca(resultSet.getString(2) );
                
            }
            resultSet.close();
            MySqlConnection.closeConnection(connection);
            return marca;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean updateMarca( Marca marca )
    {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String sql = "update TBL_MARCA SET MARCA=? WHERE ID_CATMARCA= ?";
        int row = 0;
        try 
        {
            connection = MySqlConnection.getConnection( );
            if( connection == null )
            {
                return false;
            }
            preparedStatement = connection.prepareStatement(sql);
            if( preparedStatement == null )
            {
                return false;
            }
            preparedStatement.setString(1, marca.getMarca());
            preparedStatement.setInt(2, marca.getId_CatMarca());
            row = preparedStatement.executeUpdate();
            MySqlConnection.closeConnection(connection);
            return row == 1;
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        }
        return false;
    }
    
}
