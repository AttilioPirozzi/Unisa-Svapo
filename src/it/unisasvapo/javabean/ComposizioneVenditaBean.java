package it.unisasvapo.javabean;

import it.unisasvapo.javabean.ProductBean;

public class ComposizioneVenditaBean {
	private ProductBean product;
	private float quantita;
	private float prezzoEffettivo;
	public ProductBean getProduct() {
		return product;
	}
	public float getQuantita() {
		return quantita;
	}
	public float getPrezzoEffettivo() {
		return prezzoEffettivo;
	}
	public ComposizioneVenditaBean(ProductBean product, float quantita, float prezzoEffettivo) {
		this.product = product;
		this.quantita = quantita;
		this.prezzoEffettivo = prezzoEffettivo;
	}
}
