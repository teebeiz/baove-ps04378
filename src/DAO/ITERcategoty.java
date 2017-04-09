package DAO;

import java.util.List;

import Model.Category;

public interface ITERcategoty {

	public List<Category> findallca();
	public void createca(Category ca);
	public void deteles(int cate_id);
	public Category find(int cate_id);
    public void updataca(Category ca);
	
	
}
