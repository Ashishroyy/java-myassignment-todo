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
     height:200px;
     width:420px;
     border-radius:10px;
     margin-left:500px;
  }
  h3{
     color: gray;
     text-align: center;
  }
  input{
     width:300px;
     height:30px;
     border:1px solid;
  }
  input[type=submit]{
  width:300px;
     background-color: black;
     color:white;
     border-radius:5px;
  }
  input[type=reset]{
     width:100px;
     background-color: black;
     color:white;
     border-radius:5px;
  }
  td{
    padding:5px;
  }
</style>
</head>
<body>

<div class="content">
    <div class="myform">
        
        <h3>Login</h3>  
       <form:form method="post" action="login" modelAttribute="login">    
        <table >    
         <tr>    
          <td> Login Id </td>   
          <td><form:input path="login_id" placeholder="login_id" /></td>  
         </tr>    
         <tr>    
          <td> Password</td>    
          <td><form:input path="password" placeholder="password"/></td>  
         </tr>   
         <tr>
          <td><input type="reset" value="reset" /></td>    
          <td><input type="submit" value="Login" /></td>    
         </tr>    
        </table>    
       </form:form>
    </div>
</div>

</body>
</html>
