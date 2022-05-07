<%-- 
    Document   : login_page
    Created on : Dec 9, 2021, 8:58:08 PM
    Author     : hp
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 96%, 69% 100%, 32% 96%, 0 100%, 0 0);
        }
        .primary-background{
              background:#3d5afe ! important;
                 } 
    </style>
        <title>Login Page</title>
        
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center primary-background banner-background" style="height : 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card" >
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-2x"><p>Login here!</p></span>
                            </div>
                               
                            <%
                            Message msg = (Message)session.getAttribute("msg");
                            if(msg!=null){
                            %>
                            
                            <div class="alert <%=msg.getCssClass()%>" role="alert">
                                     <%=msg.getContent()%>
                                        </div>
                            
                            
                            
                            <%
                            session.removeAttribute("msg");
                                }
                            %>
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                <div class="form-group">
                     <label for="exampleInputEmail1">Email address</label>
                             <input name="email"  type="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                           <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                             </div>
                             <div class="form-group">
                       <label for="exampleInputPassword1">Password</label>
                            <input name="password"  type="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div>
                                    <div class="container text-center">
                 <button type="submit" class="btn btn-primary">Submit</button>
                                 </form>
        </div>
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   
    </body>
</html>
