<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ page import="java.util.ArrayList,it.unisasvapo.javabean.CartBean,it.unisasvapo.javabean.ProductBean,it.unisasvapo.javabean.UserBean,it.unisasvapo.javabean.ComposizioneVenditaBean,it.unisasvapo.javabean.OrderBean"%>
<%
	ArrayList<String> categories=(ArrayList<String>)request.getAttribute("categories");
	if(categories==null){
		categories=new ArrayList<String>();
		categories.add("Senza categoria");
	}
	ArrayList<OrderBean>orders=(ArrayList<OrderBean>)session.getAttribute("orders");
	CartBean cart=(CartBean)session.getAttribute("cart");
	if(cart==null)
		cart=new CartBean();
		
%>
<%
UserBean user = (UserBean) session.getAttribute("user");
if (user==null || !user.getTipo().equals("user"))
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
<link href="resource/css/carrello.css" rel="stylesheet" type="text/css">
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

		<div class="mainContent">
			<div class="dynamic_content"> 
				<%if(cart.getDimension()<=0){ %>
				<h1>Carrello vuoto</h1>
				<p><a href="pagecomposer?responsepage=prodotti&searchcat=all" style="color:#ED1C24;">Clicca qui</a> per accedere ai prodotti</p>
				<%
				}
				else{
					ArrayList<ProductBean>products=cart.getList();
					for(ProductBean product:products){
				%>
				<h1>Carrello</h1>				
	       <table>
      <thead>
        <tr>
          <td class="image">Image</td>
          <td class="name">Nome Prodotto</td>
          <td class="model">Modello e Descrizione</td>
          <td class="quantity">Quantità </td>
          <td class="price">Prezzo Singolo</td>
      </thead>
      
      <tbody>
        <tr>
          <td class="image"><img src="img/prodotti/<%=product.getCodiceProdotto()%>/prodotto.jpg" alt="Immagine non Disponibile" height="47" width="47" onerror="this.src='notfound.jpg';" /></td>
          <td class="name"><a href="pagecomposer?responsepage=prodotto&id=<%=product.getCodiceProdotto() %>"><%= product.getDescrione() %></a><div></div></td>
          <td class="model"><%=product.getCodiceProdotto() %></td>
          <td class="quantity"><%=cart.getQuantityOf(product)+" "+product.getUnitaDiMisura()%></td>
          <td class="price"><%=product.getPrezzoV() %></td>
         
        </tr>
      </tbody>
      </table>
      <form method="get" action="deleteFromCart">
	       <input type="hidden" name="id" value="<%=product.getCodiceProdotto()%>">
	       <input type="submit" value="Rimuovi">
      </form>
				<%} %>
				<div id="proceed">
					<form action="buyall" method="get">
						<input type="submit" value="Procedi all'acquisto">
					</form>
		       </div>
		<%} %>	
	 </div>
   </div>
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