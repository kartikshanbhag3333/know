<%@page import="java.io.FileReader"%> 
<%@page import="java.io.BufferedReader"%> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta charset="utf-8" />
    <title>HTML5 Presentation demo | Script tutorials</title>

    <!-- Linking styles -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<%
		String fileName=request.getParameter("type"); 
		int counter=2; %>

    <nav id="helpers"><!-- Defining the floating helpers of the page -->
      <button title="Previous" id="nav-prev" class="nav-prev">&lt;-</button> 
      <button title="Jump to slide" id="slide-no">3</button> 
      <button title="Next" id="nav-next" class="nav-next">-&gt;</button>
      
      
    </nav>

  
	<div class="presentation"><!-- Defining the main presentation -->
      <div id="presentation-counter">Loading...</div>

      <div class="slides"><!-- Defining slides -->

        <div class="slide" id="slide1"><!-- Defining single slide -->
          <section class="middle">
            <p><%out.println(fileName+" Presentation");%></p>
            <p>Slide <span id="left-init-key" class="key"></span>  to continue.</p>
          </section>
         
        </div>

        <% 
			try {
			BufferedReader br = new BufferedReader(new FileReader(getServletContext().getRealPath(fileName))); 
			StringBuilder sb = new StringBuilder(); 
			String line;
			while((line=br.readLine())!=null){
				%>
				<div class="slide" id=<%out.println("slide"+counter);%>>
				<% String[] x=line.split(","); counter++; %>
				 <section class="middle">
				<hgroup>
				<h1>
				<%out.println(x[0]);
				%>
				</h1>
				<h2>
				<%out.println(x[1]);%>
				</h2>
				</hgroup>
				<p><%out.println(x[2]);%></p>
				</section>
				</div>
				<%
			} } catch(Exception e) { out.println(e.toString()); }%>
		
     

      </div>

      <div id="hidden-note" class="invisible" style="display: none;">
      </div> <!-- hidden note -->

    

    </div>
     

    

    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>