package it.unisasvapo.javabean;

public class ProductBean {
	private String codiceProdotto;
	private float prezzoA,prezzoV;
	private String aliquota;
	private String unitaDiMisura, categoria, descrione;
	private float quantita;
	
	public ProductBean(){
		aliquota=unitaDiMisura=codiceProdotto=descrione="";
		quantita=prezzoA=prezzoV=0;
		categoria="Senza categoria";
	}
	 public ProductBean(String cod, float prezzoA, float prezzoV, String aliquota,
			 String unitaDiMisura, String categoria, String descrizione, float quantita){
		 this.aliquota=aliquota;
		 this.codiceProdotto=cod;
		 this.categoria=categoria;
		 this.quantita=quantita;
		 this.prezzoA=prezzoA;
		 this.prezzoV=prezzoV;
		 this.descrione=descrizione;
		 this.unitaDiMisura=unitaDiMisura;
	 }
	
	public float getQuantita() {
		return quantita;
	}

	public void setQuantita(float quantita) {
		this.quantita = quantita;
	}
	public String getCodiceProdotto() {
		return codiceProdotto;
	}

	public float getPrezzoA() {
		return prezzoA;
	}
	public float getPrezzoV() {
		return prezzoV;
	}
	public String getAliquota() {
		return aliquota;
	}

	public String getUnitaDiMisura() {
		return unitaDiMisura;
	}
	public String getCategoria() {
		return categoria;
	}

	public String getDescrione() {
		return descrione;
	}

	
	
}