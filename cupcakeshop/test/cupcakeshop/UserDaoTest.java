package cupcakeshop;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.junit.Before;
import org.junit.Test;

import br.com.cupcakeshop.Dao.UserDao;
import br.com.cupcakeshop.model.User;

public class UserDaoTest {

    private Connection mockConnection;
    private PreparedStatement mockPreparedStatement;
    private ResultSet mockResultSet;

    @Before
    public void setUp() throws Exception {
        mockConnection = mock(Connection.class);
        mockPreparedStatement = mock(PreparedStatement.class);
        mockResultSet = mock(ResultSet.class);

        when(mockConnection.prepareStatement(any(String.class))).thenReturn(mockPreparedStatement);
        when(mockPreparedStatement.executeUpdate()).thenReturn(1);
    }

    @Test
    public void testSaveUser() {
        UserDao userDao = new UserDao(mockConnection);
        User user = new User();
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPassword("password123");

        assertTrue(userDao.saveUser(user));

        // Verifica se o método executeUpdate foi chamado
        try {
			verify(mockPreparedStatement).executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    @Test
    public void testSaveUser_Failure() throws Exception {
        UserDao userDao = new UserDao(mockConnection);
        User user = new User();
        user.setName("John Doe");
        user.setEmail("john.doe@example.com");
        user.setPassword("password123");

        // Simula uma exceção durante a execução do SQL
        when(mockPreparedStatement.executeUpdate()).thenThrow(new RuntimeException("Test Exception"));

        assertFalse(userDao.saveUser(user));
    }

    @Test
    public void testSaveUser_NullUser() {
        UserDao userDao = new UserDao(mockConnection);

        assertFalse(userDao.saveUser(null));
    }

    // Teste para o método userLogin pode ser adicionado, semelhante ao teste para saveUser.

}
