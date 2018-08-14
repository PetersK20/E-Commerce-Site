package CustomerServerSideData;
import ProductPackage.PlantProduct;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet("/WareHouse")
public class WareHouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static SqlConnection sqlConnectionInstance;
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		if(sqlConnectionInstance==null) {
			sqlConnectionInstance=new SqlConnection();
		}
		String query=request.getParameter("search");
		String type=request.getParameter("type");
		String textValue=request.getParameter("textBoxValue");
			try {
				//user used the top text bar
				if(type.equals("byName")) {
					request.setAttribute("textSearch",query);
					returnResults(sqlConnectionInstance.getNameConnection(query),query,request,response);
				//user used the custom search
				}else if(type.equals("customSearch")){
					request.setAttribute("textSearch",textValue);
					returnResults(sqlConnectionInstance.getCustomConnection(query),textValue,request,response);
				//user used the home tabs
				}else {	
					request.setAttribute("textSearch","");
					returnResults(sqlConnectionInstance.getTypeConnection(type),type,request,response);
				}
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "Connection interupted, unable to return search results","Error",JOptionPane.ERROR_MESSAGE);
			}
			
	}
	private void returnResults(ArrayList<PlantProduct> searchResults,String query,HttpServletRequest request, HttpServletResponse response) throws SQLException {
		request.setAttribute("queryResults", searchResults);
		request.setAttribute("pageNumber",1);
		if(query=="") {
			request.setAttribute("name","All");
		}else{
			request.setAttribute("name",query);
		}
		try {
			request.getRequestDispatcher("/SearchPage.jsp").forward(request, response);
		} catch (ServletException|IOException e) {
			JOptionPane.showMessageDialog(null, "Connection interupted, unable to return search results","Error",JOptionPane.ERROR_MESSAGE);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(sqlConnectionInstance==null) {
			sqlConnectionInstance=new SqlConnection();
		}
		String fullName=request.getParameter("fullName");
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String emailAddress=request.getParameter("emailAddress");
		String phoneNumber=request.getParameter("phoneNumber");
		String cardNumber=request.getParameter("cardNumber");
		String plantItems=request.getParameter("plantItems");
		String price=request.getParameter("plantPrice");
		String shipping=request.getParameter("plantShipping");
		String total=Double.toString(Double.parseDouble(price)+Double.parseDouble(shipping));
		sqlConnectionInstance.addOrder(fullName,address,city,state,emailAddress,phoneNumber,cardNumber,plantItems,price,shipping,total);
		request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
	}

}
