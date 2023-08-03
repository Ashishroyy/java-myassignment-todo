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
     padding:10px;
     background-color:white;
     box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
     height:350px;
     width:420px;
     border-radius:10px;
     margin-left:500px;
     text-align:center;
     font-size:20px;
  }
  H1{
    color: gray;
    font-family: sans-serif;
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
  td{
    padding:5px;
  }
 .btn{
    height:30px;
    margin-top:200px;
    background-color: black;
    border-radius:5px;
   
    
    }
    a{
    text-decoration:none;
    color:white;
  }
  
</style>
</head>
<body>

<div class="content">
       <div class="myform">
        <H1>WELCOME USER</H1>
        <div class="btn"><a href="loginpage">Login to Sunbase</a></div>
       </div>
       
</div>
</body>
</html>
