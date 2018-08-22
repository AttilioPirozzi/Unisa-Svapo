package it.unisasvapo.javabean;

import java.util.ArrayList;

public class CartBean {
	private ArrayList<ProductBean> list;
	private ArrayList<Float> quantity;
	public CartBean(){
		list=new ArrayList<ProductBean>();
		quantity=new ArrayList<Float>();
	}
	public void addProduct(ProductBean product,Float quantity){
		int pos=list.indexOf(product);
		if(pos<0){
			list.add(product);
			this.quantity.add(quantity);
		}
		else{
			this.quantity.add(pos, this.quantity.get(pos)+quantity);
		}
		
		
	}
	public void remove(ProductBean product){
		int pos=list.indexOf(product);
		list.remove(product);
		quantity.remove(pos);
	}
	public void removeById(String id){
		int i=-1;
		for(ProductBean p:list){
			if(p.getCodiceProdotto().equals(id))
				i=list.indexOf(p);
		}
		if(i>=0){
			list.remove(i);quantity.remove(i);
		}
	}
	public ArrayList<ProductBean> getList(){
		return list;
	}
	public int getDimension(){
		return list.size();
	}
	public Float getQuantityOf(ProductBean product){
		return quantity.get(list.indexOf(product));
	}
}