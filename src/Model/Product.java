package Model;

public class Product {
    private int pr_id;
    private String pr_name;
    private long price;
    private int quantity;
    private String comment;
    private boolean Status;
    private String  images;
    private int  cate_id;
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public boolean isStatus() {
		return Status;
	}
	public void setStatus(boolean status) {
		Status = status;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int pr_id, String pr_name, long price, int quantity,
			String comment, boolean status, String images, int cate_id) {
		super();
		this.pr_id = pr_id;
		this.pr_name = pr_name;
		this.price = price;
		this.quantity = quantity;
		this.comment = comment;
		Status = status;
		this.images = images;
		this.cate_id = cate_id;
	}
    
    
    
    
    
}
