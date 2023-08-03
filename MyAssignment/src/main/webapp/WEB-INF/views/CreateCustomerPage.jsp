<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
  <%@page isELIgnored="false" %> 
<html>
<head>
<title>MyFirst MVC</title>
<style>
  body{
     background-color:aliceblue;
  }
  .myform{
  margin-top:20px;
  padding:10px;
     background-color:white;
     box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
     height:350px;
     width:420px;
     border-radius:10px;
     margin-left:500px;
  }
  input{
     width:300px;
     height:30px;
     border:1px solid;
  }
  input[type=submit]{
     width:300px;
     background-color:black;
     color:white;
     border-radius:5px;
  }
  input[type=reset]{
     width:100px;
     background-color: black;
     color:white;
     border-radius:5px;
  }
</style>
</head>
<body>

<div class="content">
    <div class="myform">
        
        <h3>Create Customer</h3>  
       <form:form method="post" action="createcustomer" modelAttribute="create">    
        <table>    
         <tr>    
          <td style="width:50%;"> First Name </td>   
          <td><form:input path="first_name" placeholder="FirstName"/></td>  
         </tr>    
         <tr>    
          <td style="width:50%;"> Last Name</td>    
          <td><form:input path="last_name" placeholder="LastName"/></td>  
         </tr> 
         <tr>    
          <td style="width:50%;"> Street </td>   
          <td><form:input path="street" placeholder="Street"/></td>  
         </tr>    
         <tr>    
          <td style="width:50%;"> Address</td>    
          <td><form:input path="address" placeholder="Address"/></td>  
         </tr> 
         <tr>    
          <td style="width:50%;"> City </td>   
          <td><form:input path="city" placeholder="City"/></td>  
         </tr>    
         <tr>    
          <td style="width:50%;">State</td>    
          <td><form:input path="state" placeholder="State"/></td>  
         </tr> 
          <tr>    
          <td style="width:50%;"> Email</td>    
          <td><form:input path="email" placeholder="Email"/></td>  
         </tr>  
          <tr>    
          <td style="width:50%;"> Phone</td>    
          <td><form:input path="phone" placeholder="Phone"/></td>  
         </tr>    
         <tr>    
         <td style="width:50%;"> <input type="reset" value="Reset" /></td>
          <td colspan="1"><input type="submit" value="Create" /></td>    
         </tr>    
        </table>    
       </form:form>
    </div>
</div>
</body>
</html>
