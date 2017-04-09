package Model;

import java.util.Date;

public class Order {
	private int ID;
	private Date data_trans;
	private long totail;
	private boolean Status;
	private String method;
	private String customername;
	private String sdt;
	private String email;
	private String Address;
	private String tx;
	

	public String getTx() {
		return tx;
	}

	public void setTx(String tx) {
		this.tx = tx;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public Date getData_trans() {
		return data_trans;
	}

	public void setData_trans(Date data_trans) {
		this.data_trans = data_trans;
	}

	public long getTotail() {
		return totail;
	}

	public void setTotail(long totail) {
		this.totail = totail;
	}

	public boolean isStatus() {
		return Status;
	}

	public void setStatus(boolean status) {
		Status = status;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String Address) {
		this.Address = Address;
	}

	public Order(int iD, Date data_trans, long totail, boolean status, String method, String customername, String sdt,
			String email, String Address,String tx) {
		super();
		ID = iD;
		this.data_trans = data_trans;
		this.totail = totail;
		Status = status;
		this.method = method;
		this.customername = customername;
		this.sdt = sdt;
		this.email = email;
		this.Address = Address;
		this.tx=tx;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
