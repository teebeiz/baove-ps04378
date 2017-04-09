package Model;

public class Account {

	
	private String email;
	private String password;
	private String hoten;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Account(String email, String password, String hoten) {
		super();
		this.email = email;
		this.password = password;
		this.hoten = hoten;
	}
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
