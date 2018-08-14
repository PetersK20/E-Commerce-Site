package EmployeeServerSideData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;


public class SqlOrdersConnection {
	private static DefaultTableModel orderTableModel;
	private static JTable orderTable;
	private static Connection orderConnection;
	private static ResultSet orderResultSet;
	public SqlOrdersConnection(JTable orderTable,DefaultTableModel orderTableModel) {
		SqlOrdersConnection.orderTable=orderTable;
		SqlOrdersConnection.orderTableModel=orderTableModel;
		createConnection();
	}
	private void createConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			orderConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_ecommerce","root","Coke6008337");
			Statement orderStatement=orderConnection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			orderResultSet=orderStatement.executeQuery("Select * from orders limit 1000");
		} catch (ClassNotFoundException | SQLException e) {
			JOptionPane.showMessageDialog(null, "An Error has occured connecting to the database");
		}		
	}
	public void addAllElements(){
		try {
			orderResultSet.absolute(0);
			while(orderResultSet.next()) {
				String items=orderResultSet.getString(2);
				String fullName=orderResultSet.getString(3);
				String address=orderResultSet.getString(4);
				String city=orderResultSet.getString(5);
				String state=orderResultSet.getString(6);
				String email_address=orderResultSet.getString(7);
				String phoneNumber=orderResultSet.getString(8);
				String cardNumber=orderResultSet.getString(9);
				String plantCost=orderResultSet.getString(10);
				String shipping=orderResultSet.getString(11);
				String total=orderResultSet.getString(12);
				Object[] rowData={items,fullName,address,city,state,email_address,phoneNumber,cardNumber,plantCost,shipping,total};
				orderTableModel.addRow(rowData);
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "An Error has occured adding values to the table");
		}
	}
	public void addOrder(String items,String name,String address,String city,String state,String email,String phone,String card,String plantCost,String shipping) {
		boolean dataValid=checkValues(items,name,address,city,state,email,phone,card);
		Double total=0.0;
		try {
			total=Double.parseDouble(shipping)+Double.parseDouble(plantCost);
		}catch(NumberFormatException e) {
			JOptionPane.showMessageDialog(null, "The shipping or plantCost data is invalid");
		}
		if(dataValid) {
			Object[] newRow={items,name,address,city,state,email,phone,card,plantCost,shipping,total};
			orderTableModel.addRow(newRow);
			try {
				orderResultSet.moveToInsertRow();
				orderResultSet.updateString(2, items);
				orderResultSet.updateString(3, name);
				orderResultSet.updateString(4, address);
				orderResultSet.updateString(5, city);
				orderResultSet.updateString(6, state);
				orderResultSet.updateString(7, email);
				orderResultSet.updateString(8, phone);
				orderResultSet.updateString(9, card);
				orderResultSet.updateString(10, plantCost);
				orderResultSet.updateString(11, shipping);
				orderResultSet.updateString(12, Double.toString(total));
				orderResultSet.insertRow();
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "An Error has occured while adding the order to the dataBase");
			}
		}
	}
	private boolean checkValues(String items,String name,String address,String city,String state,String email,String phone,String card) {
		Pattern itemsPattern=Pattern.compile("^[a-zA-Z][0-9]\\s[0-9]+$"); //Item
		Pattern namePattern=Pattern.compile("^[a-zA-Z0-9]{2,}$"); //Name
		Pattern addressPattern=Pattern.compile("^[0-9]{4}[a-zA-Z]{4,}$");//Address
		Pattern cityPattern=Pattern.compile("^[a-zA-Z0-9]{2,}$");//city
		Pattern statePattern=Pattern.compile("(?i) A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY]$");//state
		Pattern emailPattern=Pattern.compile("^\\w+@\\w+\\.[a-zA-Z]{2,4}$");//email
		Pattern phonePattern=Pattern.compile("^([0-9]( |-)?)?((\\(?[0-9]{3}\\)?|[0-9]{3})( |-)?)?([0-9]{3}( |-)?[0-9]{4}|[0-9A-Za-z]{7})$");//phone
		Pattern cardPattern=Pattern.compile("^[0-9]{16}$");//card
		
		if(matchItems(itemsPattern,items) && matchValues(namePattern,name) && matchValues(addressPattern,address) && matchValues(cityPattern,city) && matchValues(statePattern,state) && matchValues(emailPattern,email) && 
		matchValues(phonePattern,phone) && matchValues(cardPattern,card)) {
			return true;
		}else {
			return false;
		}
	}
	private boolean matchValues(Pattern inputRegex,String newInput) {
		Matcher match = inputRegex.matcher(newInput);
		if(match.find()) {
			return true;
		}else {
			JOptionPane.showMessageDialog(null, "The data is invalid :  "+newInput);
			return false;
		}
	}
	private boolean matchItems(Pattern inputRegex,String newInput) {
		String[]items=newInput.split(",");
		Matcher match=null;
		boolean allMatch=true;
		for(String s:items) {
			match=inputRegex.matcher(s);
			if(!match.matches()) {
				allMatch=false;
				JOptionPane.showMessageDialog(null, "The data is invalid :  "+newInput);
				return false;
			}
		}
		return true;
	}
	
	
	
	public void deleteOrder() {
		try {
			orderResultSet.absolute(orderTable.getSelectedRow()+1);
			orderResultSet.deleteRow();
			orderTableModel.removeRow(orderTable.getSelectedRow());
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "An Error has occured while deleting the order");
		}
	}
	
	
	
	
	public void changeData() {
		String newInput=JOptionPane.showInputDialog(null,"Insert your new data");
		if(newInput!=null && !newInput.equals("")) {
			try {
				int columnNumber=orderTable.getSelectedColumn()+1;
				Pattern inputRegex=getCorrectPattern(columnNumber);
				if(columnNumber==1) {changeItems(inputRegex,newInput); return;}
				Matcher match=inputRegex.matcher(newInput);
				if(match.matches()){
					orderResultSet.absolute(orderTable.getSelectedRow()+1);
					//Have to add 2 because Id in not a column on the table and mysql starts at the index 1
					orderResultSet.updateString(orderTable.getSelectedColumn()+2, newInput);
					orderResultSet.updateRow();
					orderTableModel.setValueAt(newInput, orderTable.getSelectedRow(), orderTable.getSelectedColumn());
				}else {
					JOptionPane.showMessageDialog(null, "Invalid data");
				}
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "An Error has occured while changing the customer data");
			}
			
		}
	}
	private void changeItems(Pattern inputRegex,String newInput) throws SQLException {
		String[]items=newInput.split(",");
		Matcher match=null;
		boolean allMatch=true;
		for(String s:items) {
			match=inputRegex.matcher(s);
			if(!match.matches()) {
				allMatch=false;
			}
		}
		if(allMatch) {
			orderResultSet.absolute(orderTable.getSelectedRow()+1);
			//Have to add 2 because Id in not a column on the table and mysql starts at the index 1
			orderResultSet.updateString(orderTable.getSelectedColumn()+2, newInput);
			orderResultSet.updateRow();
			orderTableModel.setValueAt(newInput, orderTable.getSelectedRow(), orderTable.getSelectedColumn());
		}else {
			JOptionPane.showMessageDialog(null, "Invalid data");
		}
		
	}
	private Pattern getCorrectPattern(int columnNumber){
		Pattern inputRegex = null;
		if(columnNumber==1) inputRegex=Pattern.compile("^[a-zA-Z][0-9]\\s[0-9]+$"); //Item
		else if(columnNumber==2)  inputRegex=Pattern.compile("^[a-zA-Z0-9]{2,}$"); //Name
		else if(columnNumber==3) inputRegex=Pattern.compile("^[0-9]{4}[a-zA-Z]{4,}$");//Address
		else if(columnNumber==4) inputRegex=Pattern.compile("^[a-zA-Z0-9]{2,}$");//city
		else if(columnNumber==5) inputRegex=Pattern.compile("(?i) A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY]$");//state
		else if(columnNumber==6) inputRegex=Pattern.compile("^\\w+@\\w+\\.[a-zA-Z]{2,4}$");//email
		else if(columnNumber==7) inputRegex=Pattern.compile("^([0-9]( |-)?)?((\\(?[0-9]{3}\\)?|[0-9]{3})( |-)?)?([0-9]{3}( |-)?[0-9]{4}|[0-9A-Za-z]{7})$");//phone
		else if(columnNumber==0||columnNumber==10||columnNumber==11)inputRegex=Pattern.compile("^[0-9,.]+$");//cost
		else inputRegex=Pattern.compile("^[0-9]{16}$");//card
		return inputRegex;
	}
	
}
