package EmployeeServerSideData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class SqlInventoryConnection {
	private static DefaultTableModel inventoryTableModel;
	private static JTable inventoryTable;
	private static Connection inventoryConnection;
	private static ResultSet inventoryResultSet;
	public SqlInventoryConnection(JTable inventoryTable,DefaultTableModel inventoryTableModel) {
		SqlInventoryConnection.inventoryTable=inventoryTable;
		SqlInventoryConnection.inventoryTableModel=inventoryTableModel;
		createConnection();
	}
	private void createConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			inventoryConnection=DriverManager.getConnection("jdbc:mysql://localhost:3306/plant_ecommerce","root","Coke6008337");
			Statement orderStatement=inventoryConnection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			inventoryResultSet=orderStatement.executeQuery("Select * from inventory limit 1000");
		} catch (ClassNotFoundException | SQLException e) {
			JOptionPane.showMessageDialog(null, "An Error has occured connecting to the database");
		}		
	}
	public void addAllElements(){
		try {
			inventoryResultSet.absolute(0);
			while(inventoryResultSet.next()) {
				String plantId=inventoryResultSet.getString(1);
				String name=inventoryResultSet.getString(2);
				String type=inventoryResultSet.getString(3);
				String color=inventoryResultSet.getString(4);
				String heightNow=inventoryResultSet.getString(5);
				String fullHeight=inventoryResultSet.getString(6);
				String image1=inventoryResultSet.getString(7);
				String image2=inventoryResultSet.getString(8);
				String image3=inventoryResultSet.getString(9);
				String price=inventoryResultSet.getString(10);
				String discount=inventoryResultSet.getString(11);
				String description=inventoryResultSet.getString(13);
				String stock=inventoryResultSet.getString(14);
				Object[] rowData={plantId,name,type,color,heightNow,fullHeight,image1,image2,image3,price,discount,description,stock};
				inventoryTableModel.addRow(rowData);
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "An Error has occured adding values to the table");
		}
	}
	public void addOrder(String plantId,String plantName,String plantType,String color,String heightNow,String fullHeight,String image1,String image2,
		String image3,String price,String discount,String description,String stock) {
		boolean dataValid=checkValues(plantId,plantName,plantType,color,heightNow,fullHeight,image1,image2,image3,price,discount,description,stock);
		if(dataValid) {
			String[] heightNowArray=heightNow.split("\\.");
			int heightNowInInches=Integer.parseInt(heightNowArray[0])*12+Integer.parseInt(heightNowArray[1]);
			String[]fullHeightArray=fullHeight.split("\\.");
			int fullHeightInInches=Integer.parseInt(fullHeightArray[0])*12+Integer.parseInt(fullHeightArray[1]);
			Object[] newRow={plantId,plantName,plantType,color,heightNowInInches,fullHeightInInches,image1,image2,image3,price,discount,description,stock};
			try {
				inventoryResultSet.moveToInsertRow();
				inventoryResultSet.updateString(1, plantId);
				inventoryResultSet.updateString(2, plantName);
				inventoryResultSet.updateString(3, plantType);
				inventoryResultSet.updateString(4, color);
				inventoryResultSet.updateDouble(5, heightNowInInches);
				inventoryResultSet.updateDouble(6, fullHeightInInches);
				inventoryResultSet.updateString(7, image1);
				inventoryResultSet.updateString(8, image2);
				inventoryResultSet.updateString(9, image3);
				inventoryResultSet.updateDouble(10, Double.parseDouble(price));
				inventoryResultSet.updateDouble(11, Double.parseDouble(discount));
				inventoryResultSet.updateDouble(12, 5.0);
				inventoryResultSet.updateString(13, description);
				inventoryResultSet.updateInt(14, Integer.parseInt(stock));
				inventoryResultSet.updateInt(15, 0);
				inventoryResultSet.insertRow();
				inventoryTableModel.addRow(newRow);
			} catch (SQLException e) {
				e.printStackTrace();
				JOptionPane.showMessageDialog(null, "An Error has occured while adding the order to the dataBase");
			}catch(NumberFormatException e) {
				JOptionPane.showMessageDialog(null, "You didn't enter proper number values");
			}
		}
	}
	private boolean checkValues(String plantId,String plantName,String plantType,String color,String heightNow,String fullHeight,String image1,String image2,
			String image3,String price,String discount,String description,String stock) {
		Pattern heightPattern=Pattern.compile("^[0-9]+\\.[0-9]+$"); //heights
		Pattern idPattern=Pattern.compile("[a-zA-Z0-9]{2,}");
		Pattern stockPattern=Pattern.compile("[0-9,]+");
		if(matchValues(idPattern,plantId) && boxesEmpty(plantType) && boxesEmpty(plantType) && boxesEmpty(color) && matchValues(heightPattern,heightNow) && matchValues(heightPattern,fullHeight) && boxesEmpty(image1) && 
				boxesEmpty(image2) && boxesEmpty(image3) && boxesEmpty(price) && boxesEmpty(discount) && boxesEmpty(description) && matchValues(stockPattern,stock)) {
			return true;
		}else {
			return false;
		}
	}
	private boolean boxesEmpty(String value) {
		if(value.equals("")||value==null) {
			JOptionPane.showMessageDialog(null, "The data is invalid :  "+value);
			return false;
		}
		return true;
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

	public void deleteOrder() {
		try {
			inventoryResultSet.absolute(inventoryTable.getSelectedRow()+1);
			inventoryResultSet.deleteRow();
			inventoryTableModel.removeRow(inventoryTable.getSelectedRow());
		} catch (SQLException e) {
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "An Error has occured while deleting the order");
		}
	}
	
	
	
	
	public void changeData() {
		String newInput=JOptionPane.showInputDialog(null,"Insert your new data");
		if(newInput!=null && !newInput.equals("")) {
			try {
				int columnNumber=inventoryTable.getSelectedColumn()+1;
				Pattern inputRegex=getCorrectPattern(columnNumber);
				Matcher match=inputRegex.matcher(newInput);
				if(match.matches()){
					newInput=convertHeightToInches(newInput,columnNumber);
					inventoryResultSet.absolute(inventoryTable.getSelectedRow()+1);
					inventoryResultSet.updateString(columnNumber, newInput);
					inventoryResultSet.updateRow();
					inventoryTableModel.setValueAt(newInput, inventoryTable.getSelectedRow(), inventoryTable.getSelectedColumn());
				}else {
					JOptionPane.showMessageDialog(null, "Invalid data");
				}
			} catch (SQLException e) {
				JOptionPane.showMessageDialog(null, "An Error has occured while changing the customer data");
			}
			
		}
	}
	private String convertHeightToInches(String newInput,int columnNumber) {
		if(columnNumber==5||columnNumber==6) {
			String[] heightNowArray=newInput.split("\\.");
			newInput=Integer.toString(Integer.parseInt(heightNowArray[0])*12+Integer.parseInt(heightNowArray[1]));
		}
		System.out.println(inventoryTable.getSelectedColumn());
		return newInput;
	}
	private Pattern getCorrectPattern(int columnNumber){
		Pattern inputRegex = null;
		if(columnNumber==5 || columnNumber==6) {inputRegex=Pattern.compile("^[0-9]+\\.[0-9]?+");}//heights
		else if(columnNumber==1){inputRegex=Pattern.compile("[a-zA-Z0-9]{2,}");
		}else{ inputRegex=Pattern.compile(".*?");}//card
		return inputRegex;
	}
	
}
