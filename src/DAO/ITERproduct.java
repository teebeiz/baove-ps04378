package DAO;

import java.util.List;

import Model.Product;

public interface ITERproduct {

	public List<Product> fillall();
	public List<Product> fillallpr();
	public List<Product> fillallpr1();
	public List<Product> fillallpr2();
	public List<Product> fillallprca(int cate_id);
	public Product fillpr(int pr_id);
	public List<Product> fillallprrela(int cate_id,int pr_id);
	public void createpr(Product pr);
	public void detelepr(int pr_id);
	public void updatepr(Product pr);
	public List<Product> getlist(List<Product> listpr,int start,int end);
	public List<Product> search(String pr_name);
}
