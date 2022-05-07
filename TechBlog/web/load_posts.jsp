<%-- 
    Document   : load_posts
    Created on : Dec 14, 2021, 11:20:47 AM
    Author     : hp
--%>


<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div class="row">
        <%
         PostDao d = new PostDao(ConnectionProvider.getConnection());
         
         int cid = Integer.parseInt(request.getParameter("cid"));
         List<Post> posts = null;
         
         if(cid==0){
          posts = d.getAllPosts();
         }else{
           posts = d.getPostByCatId(cid);    
         }
         
         if(posts.size()==0){
          out.println("<h3>No posts in this category</h3>");
          return;
         }
         for(Post p: posts){      
              
        %>
        
        <div class="col-md-6">
            <div class="card">
                <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
                <div class="card-body">
                    
                    <b><%=p.getpTitle()%></b>
                    
                    <p><%=p.getpContent()%></p>

                </div>
                    
                    <div class="card-footer bg-primary-background text-center">
                        <%
                        LikeDao ld  = new LikeDao(ConnectionProvider.getConnection());
                        User user = (User)session.getAttribute("currentUser");
                        
                        %>
                        <a href="#" onclick ="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>
                        <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary btn-sm">Read more</a>
                        
                        <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
                        
                    </div>
            </div>
            
        </div>
        <%
            }
        %>
    </div>
        </body>
</html>
