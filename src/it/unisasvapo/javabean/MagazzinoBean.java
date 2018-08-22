package it.unisasvapo.javabean;

import java.util.ArrayList;

public class MagazzinoBean {
	private String codice,via,nCivico,CAP;
	ArrayList<ProductBean> products;
	public MagazzinoBean(String codice, String via, String nCivico, String CAP,ArrayList<ProductBean> products) {
		this.codice = codice;
		this.via = via;
		this.nCivico = nCivico;
		this.CAP = CAP;
		this.products=products;
	}
	public ArrayList<ProductBean> getProducts() {
		return products;
	}
	public String getCodice() {
		return codice;
	}
	
	public String getVia() {
		return via;
	}
	public String getnCivico() {
		return nCivico;
	}
	public String getCAP() {
		return CAP;
	}
	
}
