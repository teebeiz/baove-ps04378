package DAO;

import java.util.List;

import Model.Order;
import Model.Order_details;

public interface IEorder {
    public void create(Order or);
    public void createde(Order_details od);
    public Order find();
    public List<Order> listfind();
    public List<Order_details> findllde();
}
