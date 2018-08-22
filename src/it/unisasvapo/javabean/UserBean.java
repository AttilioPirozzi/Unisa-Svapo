package it.unisasvapo.javabean;

public class UserBean {
	private String codice, nome, cognome, via, cap,codfiscale,
	email, telefono;
	private int nCivico;
	private String tipo,citta;
	public UserBean(String codice, String nome, String cognome,String citta, String via, String cap, String CodFiscale, String email,
			int nCivico, String telefono, String tipo) {
		this.codice = codice;
		this.nome = nome;
		this.citta=citta;
		this.cognome = cognome;
		this.via = via;
		this.cap = cap;
		this.codfiscale = CodFiscale;
		this.email = email;
		this.nCivico = nCivico;
		this.telefono=telefono;
		this.tipo=tipo;
	}
	public String getCodice() {
		return codice;
	}
	public String getNome() {
		return nome;
	}
	public String getCognome() {
		return cognome;
	}
	public String getVia() {
		return via;
	}
	public String getCap() {
		return cap;
	}
	public String getCodFiscale() {
		return codfiscale;
	}
	public String getEmail() {
		return email;
	}
	public int getnCivico() {
		return nCivico;
	}
	public String getTelefono() {
		return telefono;
	}
	public String getTipo() {
		return tipo;
	}
	public String getCitta() {
		return citta;
	}
}