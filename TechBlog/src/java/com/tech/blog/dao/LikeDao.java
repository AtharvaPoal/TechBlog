
package com.tech.blog.dao;

import java.sql.*;
public class LikeDao {
   
   Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
   
   public boolean insertLike(int pid,int uid){
       boolean f=false;
       try{
         
           String q = "insert into likes(pid,uid) values(?,?)";
           PreparedStatement pstmt = this.con.prepareStatement(q);
           
           pstmt.setInt(1,pid);
           pstmt.setInt(2,uid);
           
           pstmt.executeUpdate();
           f=true;
           
       }catch(Exception e){e.printStackTrace();}
         return f;
   }    
   
   public int countLikeOnPost(int pid){
       int count=0;
       
       try{
           
           String q="select count(*) from likes where pid=?";
           
           PreparedStatement pstmt  = this.con.prepareStatement(q);
           
           pstmt.setInt(1, pid);
           ResultSet set = pstmt.executeQuery();
           
           if(set.next()){
               count = set.getInt(1);
           }
           
       }catch(Exception e){e.printStackTrace();}
       return count;
   }
   
   public boolean isLikedByUser(int pid,int uid){
       boolean f=false;
       
       try{
           
           PreparedStatement pstmt = this.con.prepareStatement("select * from likes where pid= ? and uid = ?");
           pstmt.setInt(1, pid);
           pstmt.setInt(2, uid);
           
           ResultSet set = pstmt.executeQuery();
           
           if(set.next()){
               f=true;
           }
           
       }catch(Exception e ){e.printStackTrace();}
       return f;
   }
   
   public boolean deleteLike(int pid,int uid){
       boolean f=false;
       
       try{
           
           PreparedStatement pstmt = this.con.prepareStatement("delete from likes where pid=? and uid=?");
           pstmt.setInt(1, pid);
           pstmt.setInt(2, uid);
           
           pstmt.executeUpdate();
           
           f=true;
           
       }catch(Exception e ){e.printStackTrace();}
       return f;
   }
}
