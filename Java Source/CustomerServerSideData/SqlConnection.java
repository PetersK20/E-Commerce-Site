package CustomerServerSideData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import ProductPackage.PlantProduct;

public class SqlConnection {
	private static Connection sqlConnection;
	private static ResultSet allPlants;
	public SqlConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			sqlConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_ecommerce","root","Coke6008337");
			Statement state=sqlConnection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			allPlants=state.executeQuery("SELECT * from inventory");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
	}
	public ArrayList<PlantProduct> getNameConnection(String query) {
		ArrayList<PlantProduct> plantArray=new ArrayList<PlantProduct>();
		try {
			PreparedStatement searchStatement=sqlConnection.prepareStatement("SELECT * from inventory WHERE plant_name like '%"+query+"%'");
			ResultSet searchResults = searchStatement.executeQuery();
			addToList(plantArray,searchResults);
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
		return plantArray;
	}
	public ArrayList<PlantProduct> getTypeConnection(String query) {
		ArrayList<PlantProduct> plantArray=new ArrayList<PlantProduct>();
		try {
			PreparedStatement searchStatement=null;
			if(query.equals("all")) {
				searchStatement=sqlConnection.prepareStatement("SELECT * from inventory");
			}else {
				searchStatement=sqlConnection.prepareStatement("SELECT * from inventory WHERE plant_type='"+query+"'");
			}
			ResultSet searchResults = searchStatement.executeQuery();
			addToList(plantArray,searchResults);
		} catch (SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
		return plantArray;
	}
	public ArrayList<PlantProduct> getAllConnection() {
		ArrayList<PlantProduct> plantArray=new ArrayList<PlantProduct>();
		try {
			Statement searchStatement=sqlConnection.createStatement();
			ResultSet searchResults = searchStatement.executeQuery("SELECT * from inventory");
			addToList(plantArray,searchResults);
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
		return plantArray;
	}
	public ArrayList<PlantProduct> getCustomConnection(String query) {
		ArrayList<PlantProduct> plantArray=new ArrayList<PlantProduct>();
		try {
			Statement searchStatement=sqlConnection.createStatement();
			ResultSet searchResults = searchStatement.executeQuery(query);
			addToList(plantArray,searchResults);
		} catch (SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
		return plantArray;
	}
	
	private void addToList(ArrayList<PlantProduct> plantArray,ResultSet searchResults) throws SQLException {
		while(searchResults.next()) {
			plantArray.add(new PlantProduct(searchResults.getString(1), searchResults.getString(2), searchResults.getString(3),
			searchResults.getString(4),searchResults.getDouble(5), searchResults.getDouble(6), searchResults.getString(7),
			searchResults.getString(8),searchResults.getString(9),searchResults.getDouble(10),searchResults.getDouble(11),
			searchResults.getDouble(12),searchResults.getString(13),searchResults.getDouble(14),searchResults.getDouble(15)));
		}
	}
	public void addOrder(String fullName,String address,String city,String state,String emailAddress,String phoneNumber,
			String cardNumber,String plantItems,String price,String shipping,String total){
		try {
			updateInventory(plantItems);
			PreparedStatement searchStatement=sqlConnection.prepareStatement("INSERT INTO orders"
					+ "(item_list,full_name,address,city,state,email_address,phone_number,card_number,price,shipping,total)"
					+ "Values(?,?,?,?,?,?,?,?,?,?,?)");
			searchStatement.setString(1,plantItems);
			searchStatement.setString(2,fullName);
			searchStatement.setString(3,address);
			searchStatement.setString(4,city);
			searchStatement.setString(5,state);
			searchStatement.setString(6,emailAddress);
			searchStatement.setString(7,phoneNumber);
			searchStatement.setString(8,cardNumber);
			searchStatement.setString(9,price);
			searchStatement.setString(10,shipping);
			searchStatement.setString(11,total);
			searchStatement.executeUpdate();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "you were unable to connect to our database, check your connection and try agan later","Error",JOptionPane.ERROR_MESSAGE);
		}
	}
	private void updateInventory(String plantItems) throws SQLException {
		String[] indivdualPlants=plantItems.split(",");
		while(allPlants.next()) {
			for(String plant:indivdualPlants) {
				String[] plantSeperatedArray=plant.split(" ");
				if(allPlants.getString(1).equals(plantSeperatedArray[0])) {
					int quantity=Integer.parseInt(plantSeperatedArray[1]);
					allPlants.updateInt(14, allPlants.getInt(14)+quantity);
					allPlants.updateInt(15, allPlants.getInt(15)-quantity);
				}
			}
			allPlants.updateRow();
		}
		allPlants.absolute(0);
	}
}
