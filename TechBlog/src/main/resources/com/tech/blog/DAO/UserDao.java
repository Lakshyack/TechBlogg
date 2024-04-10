package com.tech.blog.DAO;

import com.tech.blog.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // Method to insert user database:
    public boolean saveUser(User user) {
        boolean f = false;

        try {
            //user --> database
            String q = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get user by email and password
    public User getUserBYEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String q = "select * from user where email = ? and password = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {

                user = new User();
                // get data from db
                String name = set.getString("name");
//        set to user
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user){
        boolean f = false;
        try{
 // create query
            String q = "update user set name = ?, email = ?, password = ?,gender = ?,about=?, profile = ? where id = ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5,user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7,user.getId());

            pstmt.executeUpdate();
            f = true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

}
