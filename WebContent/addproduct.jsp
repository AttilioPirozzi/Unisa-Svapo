<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="it.unisasvapo.javabean.UserBean"%>
    <%@ page import="java.util.ArrayList"%>
<%
	ArrayList<String> categories=(ArrayList<String>)request.getAttribute("categories");
	if(categories==null){
		categories=new ArrayList<String>();
		categories.add("Senza categoria");
	}
%>
<%
UserBean user = (UserBean) session.getAttribute("user");
if (user==null || !user.getTipo().equals("admin"))
{	
    response.sendRedirect("pagecomposer?responsepage=login");
    return;
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
				<h1 id="title">Inserisci un nuovo prodotto </h1>
				<form action="newproduct" method="post">
					<p class="form_element">
						<label>Codice Prodotto: </label>
						<input required="required" type="text" maxlength="10" name="codiceProdotto" placeholder="Codice prodotto">
					</p>		
					<p class="form_element">
						<label>Prezzo di acquisto: </label>
						<input required="required" type="number" min="0" name="prezzoacquisto" placeholder="Prezzo di acquisto">
					</p>
					<p class="form_element">
						<label>Aliquota: </label>
						<select name="aliquota" required="required">
							<option value="22.00">22%</option>
						</select>
					</p>
					<p class="form_element">
						<label>Prezzo di vendita: </label>
						<input required="required" type="number" min="0" name="prezzovendita" placeholder="Prezzo di vendita">
					</p>
					<p class="form_element">
						<label>Unità di misura: </label>
						<select name="misura" required="required">
							<option value="Pz">Pezzo</option>
							<option value="Ml">Millilitro</option>
							<option value="L">Litro</option>
						</select>
					</p>
					<p class="form_element" >
						<p>Descrizione: <p>
						<textarea required="required" rows="5" cols="35" name="descrizione" 
						placeholder="Inserisci una descrizione" maxlength="100"></textarea>
					</p>				
					<p class="form_element">
						<label>Categoria: </label>					
						<input required="required" type="text" name="categoria" maxlength="20" value="Senza Categoria">
					</p>
					<p class="form_element">
					<input type="submit" value="Inserisci">
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
