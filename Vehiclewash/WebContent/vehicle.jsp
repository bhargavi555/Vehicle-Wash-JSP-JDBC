<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="com.wash.vehicle.DBUtil"%>
<body >

<font size="20"><marquee behavior="alternate">USA VEHICLE WASH</marquee></font>
<br/>
<br/>
<br/>
  <h1>VEHICLE DETAILS</h1>

<form method="post">


<table border="3">
   <tr>
        <td>Vehicle ID</td>
        <td>Vehicle Type</td>
        <td>visits</td>
        
   </tr>

<%
ResultSet rs=null;
int carCount=0;
int TruckCount=0;
int carCost=5;
double disCarCost=2.5;
double disTruckCost=5;
int truckCost=10;
    String data="";
	String b = request.getParameter("vehicleId");
	//out.println(b);
    String vehicleType=request.getParameter("myradio");
    String c=request.getParameter("mybox");
    //String v=0;
	Connection con = DBUtil.getMySqlConnection();
	Statement st = con.createStatement();
	 if(b.equals("111111"))
	 {
		 response.sendRedirect("wash.jsp");
	 }
	 else{
	 rs=st.executeQuery("select * from carWash where vehicleid='"+b+"'");
	int count=0;
	while(rs.next())
	{
		
	count++;
    }
 if(count>0){
		//   out.println("Already existed");
		 
         st.executeUpdate(" update carwash set visits=visits+1 where vehicleid='"+b+"'");
			rs=st.executeQuery("select * from carWash where vehicleid='"+b+"'");
		   while(rs.next())
			{ 
			   out.println();
			   if(rs.getInt("visits")%2==0){
				   if(rs.getString("vehicletype").equals("car")){
						 out.println("<p>The cost for washing the your car  is "+disCarCost+"$ </p>");
					 }
				   if(rs.getString("vehicletype").equals("truck")){
						  if(c.equals("1"))
						 out.println("The cost for washing the your truck is "+disTruckCost+"$");
						 else if(c.equals("2")){
							 double t=2+disTruckCost;
							 out.println("The cost for washing the your truck with mud on the bed is "+t+"$");}
							 else
								 out.println("No washing bcz bed let down");
					  }	 
			   }
			   else{
				 if(rs.getString("vehicletype").equals("car")){
					 out.println("The cost for washing the your car wash is "+carCost+"$");
				 }

			  if(rs.getString("vehicletype").equals("truck")){
				  if(c.equals("1"))
				 out.println("The cost for washing the your truck is "+truckCost+"$");
				 else if(c.equals("2")){
					 int total=2+truckCost;
					 out.println("The cost for washing the your truck with mud on the bed is "+total+"$");}
					 else
						 out.println("No washing bcz bed let down");
			  }	 
			 }	 
		  
	    %>
	    <tr><td><%out.println(rs.getString("vehicleid")); %></td>
	     <td><%out.println(rs.getString("vehicletype")); %></td>
	    <td><%out.println(rs.getInt("visits")); %></td></tr>
	    <%

			} 
		   
	}
 if(count==0){
	 st.executeUpdate("insert into carwash(vehicleid,vehicletype,visits)values('"+b+"','"+vehicleType+"','"+1+"')");
	 rs=st.executeQuery("select * from carWash where vehicleid='"+b+"'");
	 while(rs.next())
		{
		
		 if(rs.getString("vehicletype").equals("car")){
			 out.println("The cost for washing the your car is "+carCost+"$");
			 
		 }

	 if(rs.getString("vehicletype").equals("truck")){
		  if(c.equals("1"))
				 out.println("The cost for washing the your truck is "+truckCost+"$");

				 else if(c.equals("2")){
					 int total=2+truckCost;
					 out.println("The cost for washing the your truck with mud on the bed is "+total+"$");}
					 else
						 out.println("No washing bcz bed let down");
	 }	 
	 
  %>
  
  <tr><td><%out.println(rs.getString("vehicleid")); %></td>
   <td><%out.println(rs.getString("vehicletype")); %></td>
  <td><%out.println(rs.getInt("visits")); %></td></tr>
  <%
 
  
 }
	 
  }
	 }
	 %>
	 </table>
	 <% 
	rs= st.executeQuery("select count(*) from carwash where vehicletype='car'");
	 while(rs.next()){
	        carCount = rs.getInt("count(*)");
	        out.print("    ");
	        
	     out.print("<p>Cars washed until now :  "+carCount+"</p>" );
	      
	    }
	 
	 rs= st.executeQuery("select count(*) from carwash where vehicletype='truck'");
	 while(rs.next()){
	       TruckCount = rs.getInt("count(*)");
	       out.print("<p>Trucks washed until now :  "+TruckCount+"</p>");
	    }
	 int washCount=carCount+ TruckCount;
	 out.print("<p> Vehicles  washed until now :  "+washCount+ "</p");
	 %>




<%
%>

</form>`
</body>
