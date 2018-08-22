package it.unisasvapo.javabean;

import java.sql.Date;
import java.util.ArrayList;

public class OrderBean {
	private int codice;
	private Date data;
	private float totale;
	private int idCliente;
	private float sconto;
	private ArrayList<ComposizioneVenditaBean> products;
	private String status;
	public int getCodice() {
		return codice;
	}
	public Date getData() {
		return data;
	}
	public float getTotale() {
		return totale;
	}
	public int getIdCliente() {
		return idCliente;
	}
	public float getSconto() {
		return sconto;
	}
	public OrderBean(int codice, Date data, float totale, int idCliente, float sconto,
			ArrayList<ComposizioneVenditaBean> products, String status) {
		this.codice = codice;
		this.data = data;
		this.totale = totale;
		this.idCliente = idCliente;
		this.sconto = sconto;
		this.products = products;
		this.status = status;
	}
	public ArrayList<ComposizioneVenditaBean> getProducts() {
		return products;
	}
	public String getStatus(){
		return status;
	}	
}
