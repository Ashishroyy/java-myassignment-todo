<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
  <%@page isELIgnored="false" %> 
<html>
<head>
<title>Customer Lists</title>
<style>
  body{
     background-color:aliceblue;
  }
  .myform{
  margin-top:20px;
  padding:10px;
     background-color:white;
     box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
     border-radius:10px;
  }
  .items{
  background-color:white;
     box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
     border-radius:10px;
     margin-top:10px;
  
  }
  input{
     width:300px;
     height:30px;
     border:1px solid ;
  }
  input[type=submit]{
  width:300px;
     background-color: black;
     color:white;
     border-radius:5px;
  }
  .btn{
    height:30px;
    width:200px;
    margin-top:10px;
    background-color: black;
    border-radius:5px;
    }
    a{
    text-decoration:none;
    color:white;
  }
  table td{
  word-wrap:break-word;
  }
</style>
</head>
<body>

<div class="content">
       <div class="myform">
        <div class="btn"><a href="CustomerPage">Add Customer</a></div>
        <div class="btn"><a href="showdata">Refresh</a></div>
        <h1>Customers lists</h1>
       </div><%! int a=1; %>
       <table width="100%">
       <tr style="background-color:black;color:white;">
       <td width="50px">S.No. </td>
       <td width="20%">UUID</td>
       <td width="100px">FIRST NAME</td>
       <td width="100px">LAST NAME</td>
       <td width="100px">STREET</td>
       <td width="100px">ADDRESS</td>
       <td width="100px">CITY</td>
       <td width="100px">STATE</td>
       <td width="100px">EMAIL</td>
       <td width="100px">PHONE</td>
       <td width="100px">ACTION</td>
       <td width="100px">ACTION</td>
       </tr>
       </table>
         <c:forEach items="${responsedata}" var="item">
        <div class="items"><table width="100%">
        <tr>
        <td width="50px"><%=a++%></td>
        <td width="20%">${item.uuid}</td>
        <td width="100px">${item.first_name}</td>
        <td width="100px">${item.last_name}</td>
        <td width="100px">${item.street}</td>
        <td width="100px">${item.address}</td>
        <td width="100px">${item.city}</td>
        <td width="100px">${item.state}</td>
        <td width="100px">${item.email}</td>
        <td width="100px">${item.phone}</td>
        <td width="100px"><a href="UpdatePage?uuid=${item.uuid}" style="color:green;">EDIT</a></td>
        <td width="100px"><a href="deletecustomer/${item.uuid}" style="color:red;">DELETE</a></td>
        </tr>
        </table></div>
         </c:forEach>
</div>
</body>
</html>
