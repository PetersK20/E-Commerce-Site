package EmployeeServerSideData;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.*;
import javax.swing.table.*;

public class InventoryTable{
	private static JFrame frame=new JFrame();
	private static Object[] columnArray= {"plant_id","plant_name","plant_type","color","height_now","full_height","image_file","image2","image3","price","discount","description","stock"};
	private static Object[][] tableData;
	private static DefaultTableModel orderTableModel=new DefaultTableModel(tableData,columnArray);
	private static JTable inventoryTable=new JTable(orderTableModel);
	
	private static JScrollPane tableScrollPane = new JScrollPane(inventoryTable);
	private static JPanel topPanel=new JPanel();
	private static JPanel additionPanel=new JPanel();
	private static SqlInventoryConnection inventoryConnection=new SqlInventoryConnection(inventoryTable,orderTableModel);
	private static JTextField plantId,plantName,heightNow,fullHeight,image1,image2,image3,price,discount,description,stock;
	private static JComboBox<String> plantType,color;
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
		frame.add(tableScrollPane,BorderLayout.CENTER);
		frame.add(addScrollPane,BorderLayout.SOUTH);
		
		frame.setVisible(true);
	}
	private static void createAdditionPanel() {
		createAddition();
		createDelete();
		createInputs();
	}	
	private static void createInputs() {
		plantId=createInputBoxes(3,"Id : ");
		plantName=createInputBoxes(5,"Plant Name : ");
		plantType=new JComboBox<String>(new String[] {"crops","bushes","trees","flowers"});
		additionPanel.add(plantType);
		color=new JComboBox<String>(new String[] {"Blue","Green","Red","Pink","Yellow","Orange","Black","White","Gray","Purple"});
		additionPanel.add(color);
		heightNow=createInputBoxes(5,"Height Now : ");
		fullHeight=createInputBoxes(5,"Full Height : ");
		image1=createInputBoxes(10,"Image1 : ");
		image2=createInputBoxes(10,"Image2 : ");
		image3=createInputBoxes(10,"Image3 : ");
		price=createInputBoxes(3,"Price : ");
		discount=createInputBoxes(3,"Discount Price : ");
		description=createInputBoxes(11,"Description : ");
		stock=createInputBoxes(5,"Stock : ");
		
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
				inventoryConnection.addOrder(plantId.getText(),plantName.getText(),plantType.getSelectedItem().toString(),color.getSelectedItem().toString(),heightNow.getText(),fullHeight.getText(),image1.getText(),image2.getText(),image3.getText(),
						price.getText(),discount.getText(),description.getText(),stock.getText());
			}		
		});
		
	}
	private static void createDelete() {
		JButton delete=new JButton("Remove Order");
		additionPanel.add(delete);
		delete.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				int check=JOptionPane.showConfirmDialog(null, "Are you sure you want to remove this order");
				if(check==0)inventoryConnection.deleteOrder();
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
		inventoryConnection.addAllElements();
		
		inventoryTable.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent e) {
				if(SwingUtilities.isRightMouseButton(e)){
					inventoryConnection.changeData();	
				}
			}		
		});
	}
	private static void customizeTable() {
		inventoryTable.setRowHeight(35);
		inventoryTable.setAutoCreateRowSorter(true);
		inventoryTable.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		for(int x=0;x<inventoryTable.getColumnCount();x++) {
			if(x==6||x==7||x==8||x==11) {
				inventoryTable.getColumnModel().getColumn(x).setPreferredWidth(229);
			}else {
				inventoryTable.getColumnModel().getColumn(x).setPreferredWidth(74);
			}
		}		
	}
}
