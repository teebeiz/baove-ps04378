package Model;

public class Order_details {

	
	private int Order_ID;
	private int product_ID;
	private long price;
	private int quantity;
	public int getOrder_ID() {
		return Order_ID;
	}
	public void setOrder_ID(int order_ID) {
		Order_ID = order_ID;
	}
	public int getProduct_ID() {
		return product_ID;
	}
	public void setProduct_ID(int product_ID) {
		this.product_ID = product_ID;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Order_details(int order_ID, int product_ID, long price, int quantity) {
		super();
		Order_ID = order_ID;
		this.product_ID = product_ID;
		this.price = price;
		this.quantity = quantity;
	}
	public Order_details() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
