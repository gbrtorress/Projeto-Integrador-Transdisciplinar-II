package br.com.cupcakeshop.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cupcakeshop.Dao.OrderDao;
import br.com.cupcakeshop.connection.DbCon;
import br.com.cupcakeshop.model.Cart;
import br.com.cupcakeshop.model.Order;
import br.com.cupcakeshop.model.User;

/**
 * Servlet implementation class OrderNowServlet
 */
@WebServlet("/order-now")
public class OrderNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
			
			Date date = new Date();
			
			User auth = (User) request.getSession().getAttribute("auth");
			if(auth != null) {
				
				String productID = request.getParameter("id");
				int productQuantity = Integer.parseInt(request.getParameter("quantity"));
				if(productQuantity <=0) {
					productQuantity = 1;
				}
				
				Order orderModel = new Order();
				orderModel.setId((Integer.parseInt(productID)));
				orderModel.setUid(auth.getId());
				orderModel.setQuantity(productQuantity);
				orderModel.setDate(formatter.format(date));
				
				OrderDao orderDao = new OrderDao(DbCon.getConnetion());
				boolean result = orderDao.insertOrder(orderModel);
				
				if (result) {
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        for (Cart c : cart_list) {
                            if (c.getId() == Integer.parseInt(productID)) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    response.sendRedirect("orders.jsp");
                } else {
                    out.println("order failed");
                }
            } else {
                response.sendRedirect("login.jsp");
            }	
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
			
		}
		
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
