package com.tech.blog.DAO;

import com.tech.blog.entities.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.post;
import com.tech.blog.helper.ConnectionProvider;

public class postDao {
    //fetch all details of category
    Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("cname");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return list;
    }

    public boolean savePost(post p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTitle,pContent,pCode,pPics,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();

            f = true;


        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public List<post> getAllPosts() {
        List<post> list = new ArrayList<>();
//fetch all the post
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts");
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPics");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                post pPost = new post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(pPost);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;

    }

    public List<post> getPostByCatId(int catId) {
        List<post> list = new ArrayList<>();
        //fetch all the post by CatId

        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts where catId = ?");
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPics");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                post pPost = new post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(pPost);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
