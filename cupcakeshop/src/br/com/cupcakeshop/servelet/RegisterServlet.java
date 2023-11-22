package br.com.cupcakeshop.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.cupcakeshop.Dao.UserDao;
import br.com.cupcakeshop.connection.DbCon;
import br.com.cupcakeshop.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// Verificação da senha
        if (password.length() < 4) {
            String errorMessage = "A senha deve ter pelo menos 4 caracteres.";
            HttpSession regSession = request.getSession();
            regSession.setAttribute("RegError", errorMessage);
            response.sendRedirect("registration.jsp");
            return; // Não prosseguir com o registro
        }

        // Continue com o código de registro se a senha atender aos requisitos
        User userModel = new User(0, name, email, password);
        UserDao regUser = null;
        try {
            regUser = new UserDao(DbCon.getConnetion());
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        if (regUser.saveUser(userModel)) {
            response.sendRedirect("login.jsp");
        } else {
        	
            String errorMessage = "Usuário inválido ou já existe.";
            HttpSession regSession = request.getSession();
            regSession.setAttribute("RegError", errorMessage);
            response.sendRedirect("registration.jsp");
        }
    }
}
