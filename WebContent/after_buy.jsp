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
	String state=(String)request.getAttribute("state");

	String codP=(String) request.getAttribute("prod");
%>
<%
UserBean user = (UserBean) session.getAttribute("user");
if (user==null || !user.getTipo().equals("user"))
{	
    response.sendRedirect("pagecomposer?responsepage=login");
    return;
}
if(state== null){	
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
				<h1 id="title">Acquisto <%=state%></h1>
				<%if(state.equals("confermato")){ %>
					<h2>ORDINE EFFETTUATO, ENTRO 24H VI CONTATTEREMO VIA EMAIL PER COMPLETARE IL PAGAMENTO!</h2>
					<p><a href="pagecomposer?responsepage=userpage">Clicca qui per tornare al Profilo</a> </p>
				<%} else{%>
					<p><a href="pagecomposer?responsepage=carrello">Clicca qui per tornare al Carrello</a> </p>
				<%} %>
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