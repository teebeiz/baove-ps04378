package Model;

public class Customer {

	private String Email;
	private String password;
	private String hoten;
	public Customer(String Email, String password, String hoten) {
		super();
		this.Email = Email;
		this.password = password;
		this.hoten = hoten;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	
	
}
