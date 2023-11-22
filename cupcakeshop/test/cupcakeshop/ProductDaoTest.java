package cupcakeshop;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import br.com.cupcakeshop.Dao.ProductDao;
import br.com.cupcakeshop.model.Cart;
import br.com.cupcakeshop.model.Product;

public class ProductDaoTest {

    private Connection mockConnection;
    private PreparedStatement mockPreparedStatement;
    private ResultSet mockResultSet;

    @Before
    public void setUp() throws SQLException {
        mockConnection = mock(Connection.class);
        mockPreparedStatement = mock(PreparedStatement.class);
        mockResultSet = mock(ResultSet.class);

        when(mockConnection.prepareStatement(anyString())).thenReturn(mockPreparedStatement);
    }

    @Test
    public void testGetAllProducts() throws SQLException {
        // Cria��o de inst�ncia de ProductDao com a conex�o mockada
        ProductDao productDao = new ProductDao(mockConnection);

        // Criar dados fict�cios para o ResultSet mockado
        when(mockResultSet.next()).thenReturn(true).thenReturn(false);
        when(mockResultSet.getInt("id")).thenReturn(1);
        when(mockResultSet.getString("name")).thenReturn("TestProduct");
        when(mockResultSet.getString("category")).thenReturn("TestCategory");
        when(mockResultSet.getDouble("price")).thenReturn(10.0);
        when(mockResultSet.getString("image")).thenReturn("test_image.jpg");

        // Configurar o comportamento esperado para a execu��o da consulta
        when(mockPreparedStatement.executeQuery()).thenReturn(mockResultSet);

        // Executar o m�todo que ser� testado
        List<Product> products = productDao.getAllProducts();

        // Verificar se os resultados s�o os esperados
        assertEquals(1, products.size());
        Product product = products.get(0);
        assertEquals(1, product.getId());
        assertEquals("TestProduct", product.getName());
        assertEquals("TestCategory", product.getCategory());
        assertEquals(10.0, product.getPrice(), 0.01);
        assertEquals("test_image.jpg", product.getImage());
    }

    // Adicione outros testes para os m�todos getSingleProduct, getTotalCartPrice, getCartProducts, conforme necess�rio
}
