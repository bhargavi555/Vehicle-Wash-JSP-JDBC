<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>VehicleForm</title>
</head>
<body >

<font size="20"><marquee behavior="alternate">USA VEHICLE WASH</marquee></font>
   
        <h1>VEHICLE DETAILS</h1>
        <form action="vehicle.jsp" method="post">
        <br/>Vehicle ID:<input type="text" name="vehicleId">
      

        <br/>
        <br/>

        <br/>select your vehicle type:
        <input type="radio" name=myradio value="car"/>Cars
        <input type="radio" name=myradio value="truck"/>Trucks
        <br/>
        <br/>
         <br/> select your truck choice:
        <input type="checkbox" name=mybox value="1"/>No Mud in the bed
        <input type="checkbox" name=mybox value="2"/>With Mud in the bed
        <input type="checkbox" name=mybox value="3"/>Bed let down
        

       <br/>
        <br/>
        <br/>
        <br/>
        <input type="submit" value="SUBMIT">
        </form>
</body>