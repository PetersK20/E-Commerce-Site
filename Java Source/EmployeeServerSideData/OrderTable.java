package EmployeeServerSideData;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.table.*;

public class OrderTable{
	private static JFrame frame=new JFrame();
	private static Object[] columnArray= {"Items","full_name","address","city","state","email_address","Phone","Card Number","Plant Cost","Shipping","Total"};
	private static Object[][] tableData;
	private static DefaultTableModel orderTableModel=new DefaultTableModel(tableData,columnArray);
	private static JTable orderTable=new JTable(orderTableModel);
	
	private static JScrollPane scrollPane = new JScrollPane(orderTable);
	private static JPanel topPanel=new JPanel();
	private static JPanel additionPanel=new JPanel();
	private static SqlOrdersConnection orderConnection=new SqlOrdersConnection(orderTable,orderTableModel);
	private static JTextField items,name,address,city,state,email,phone,card,plantCost,shipping;
	private static JScrollPane addScrollPane=new JScrollPane(additionPanel,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
	public static void main(String[] args) {
		frameStartUp();
	}
	private static void frameStartUp(){
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(1800,870);
		frame.setTitle("Order Information");
		
		createTopPanel();
		createTable();
		createAdditionPanel();

		frame.add(topPanel, BorderLayout.NORTH);
		frame.add(scrollPane,BorderLayout.CENTER);
		frame.add(addScrollPane,BorderLayout.SOUTH);
	
		frame.setVisible(true);
	}
	private static void createAdditionPanel() {
		createAddition();
		createDelete();
		createInputs();
	}	
	private static void createInputs() {
		 items=createInputBoxes(15,"Items : ");
		 name=createInputBoxes(10,"Name : ");
		 address=createInputBoxes(10,"Address : ");
		 city=createInputBoxes(10,"City : ");
		 state=createInputBoxes(2,"State : ");
		 email=createInputBoxes(15,"Email : ");
		 phone=createInputBoxes(15,"Phone : ");
		 card=createInputBoxes(15,"Card : ");
		 plantCost=createInputBoxes(10,"Plant Cost : ");
		 shipping=createInputBoxes(10,"Shipping : ");
		
	}
	private static JTextField createInputBoxes(int textBoxLength,String labelName) {
		JTextField field=new JTextField(textBoxLength);
		JLabel label=new JLabel(labelName);
		
		Box inputBox=Box.createVerticalBox();
		inputBox.add(label);
		inputBox.add(field);
		additionPanel.add(inputBox);
		
		return field;
	}
	private static void createAddition() {
		JButton add=new JButton("Add Order");
		additionPanel.add(add);
		add.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				orderConnection.addOrder(items.getText(),name.getText(),address.getText(),city.getText(),state.getText(),email.getText(),phone.getText(),card.getText(),plantCost.getText(),shipping.getText());
			}		
		});
		
	}
	private static void createDelete() {
		JButton delete=new JButton("Remove Order");
		additionPanel.add(delete);
		delete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				int check=JOptionPane.showConfirmDialog(null, "Are you sure you want to remove this order");
				if(check==0)orderConnection.deleteOrder();
			}		
		});
	}
	private static void createTopPanel(){
		JLabel topLabel=new JLabel("Customer Shipments");
		topLabel.setFont(new Font("Serif",Font.BOLD,30));
		topPanel.add(topLabel);
		topPanel.setBackground(new Color(51,153,255));
	}
	
	
	
	private static void createTable() {
		createDefaultTable();
		customizeTable();
	}
	private static void createDefaultTable() {
		orderConnection.addAllElements();
		
		orderTable.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				if(SwingUtilities.isRightMouseButton(e)){
					orderConnection.changeData();		
				}
			}		
		});
	}
	private static void customizeTable() {
		orderTable.setRowHeight(35);	
		orderTable.setAutoCreateRowSorter(true);
	}
}