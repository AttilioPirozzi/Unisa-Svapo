<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ page import="java.util.ArrayList,it.unisasvapo.javabean.UserBean"%>
<%
	ArrayList<String> categories=(ArrayList<String>)request.getAttribute("categories");
	if(categories==null){
		categories=new ArrayList<String>();
		categories.add("Senza categoria");
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UnisaSvapo</title>
<link href="resource/css/login.css" rel="stylesheet" type="text/css">
<link href="resource/css/users.css" rel="stylesheet" type="text/css">
<link href="resource/css/prodotti.css" rel="stylesheet" type="text/css">
<script src="resource/js/jquery-3.0.0.min.js"></script>
</head>
<body>
<div id="mainWrapper">
<header> 
    <div class="menu-wrap">
    <nav class="menu">
        <ul class="clearfix">
            <li><a href="index.html">Home</a></li>
            <li><a href="index.html#about">About</a></li>
            <li><a href="index.html#contact">Contact</a></li>
            <li><a href="./pagecomposer?responsepage=prodotti&searchcat=all">Prodotti</a></li>
            <li>
                  <% String userPage;
                    if(session.getAttribute("user")!=null)
                     userPage="PROFILO";
                    else
                     userPage="LOGIN";
                   %>
                       <a href="./pagecomposer?responsepage=login"><%=userPage%></a>
                       <%if(session.getAttribute("user")==null) {%>

                <ul class="sub-menu">
                    <li><a href="./pagecomposer?responsepage=login">Accedi</a></li>
                    <li><a href="./pagecomposer?responsepage=registrazione">Registrati</a></li>
                </ul>
               <%} %>
            </li>
        		
                  <%if( session.getAttribute("user")!=null){%>
                  <%if(((UserBean)session.getAttribute("user")).getTipo().equals("user")){ %>
                
                  <li><a href="./pagecomposer?responsepage=carrello">CARRELLO</a></li>
                  <%}} %>
                
      </ul>           
    </nav>
</div>
</header>
  
  <section id="offer"> 
   
    <h2>UnisaSvapo</h2>
    <p>Il miglior negozio online dello svapo!!!</p>
  </section>
  
  <div id="content">
    <section class="sidebar"> 
      <form id="search" action="pagecomposer" method="get">
						<input type="hidden" name="responsepage" value="prodotti">
						<label>Inserisci una parola chiave: </label><input type="text" placeholder="Ricerca" value="" name="searchcat">
						<input type="submit" value="Cerca"> 
					</form>
	<aside class="left_bar" >
			<h3>Prodotti</h3>
			<hr>
			<ul id="left_bar_list">
				<% 
					for(String cat: categories){ 
				%>
				<li><a href="pagecomposer?responsepage=prodotti&searchcat=<%=cat%>"><%=cat %></a></li>
				<%}%>
			</ul>
			</aside>
    </section>

		<section class="mainContent">
			<div class="dynamic_content"> 
				<h1>Registrazione</h1>
				<p id="description">Completa tutti i campi per registrarti</p>
				<form id="registration_form" action="createnewuser" method="post" autocomplete="off">
					<p><label>Nome: </label><input type="text" name="nome" placeholder="Nome" required="required"></p>
					<p><label>Cognome: </label><input type="text" name="cognome" placeholder="Cognome"required="required"></p>
					<p><label>Città: </label><input type="text" name="città" placeholder="Città" required="required"></p>
					<p><label>Via: </label><input type="text" name="via" placeholder="Via" required="required"></p>
					<p><label>N°Civico: </label><input type="number" min="0" required="required" placeholder="N° Civico" name="ncivico"></p>
					<p><label>CAP: </label><input type="text" name="cap" placeholder="CAP" required="required" pattern=".{5,5}"
					maxlength="5" required title="Il campo deve essere formato da 5 numeri"></p>
					<p><label>Codice Fiscale: </label><input type="text" name="codfiscale" placeholder="Codice Fiscale" pattern=".{16,16}" maxlength="16" required="required"></p>
					<p><label>E-mail: </label><input type="email" name="email" placeholder="Email" required="required"></p>
					<p><label>Telefono: </label><input type="tel" name="telefono" placeholder="Telefono" pattern=".{10,10}" maxlength="10" ></p>
					<p><label>Password: </label><input type="password" name="password" placeholder="Password" required="required" pattern=".{8,11}" maxlength="20"
					required title="Il campo deve essere formato da un minimo di 8, fino ad un massimo di 20 caratteri"></p>
					<p><input type="submit" value="Registrati"></p>
					<p><input type="reset" value="Azzera"></p>
					</form>
			</div>
    </section>	
   </div>
  <footer> 
    <div>
      <p>Via Giovanni Paolo II, 132,84084 Fisciano SA Tel. 089 961111 Email: info@unisasvapo.it</p>
    </div>
    <div class="footerlinks">
      <p><a href="index.html" title="Link">HOME</a></p>
      <p><a href="index.html#contact" title="Link">CONTATTI</a></p>
      <p><a href="index.html#about" title="Link">INFO</a></p>
    </div>
  </footer>
</div>
</body>
</html>