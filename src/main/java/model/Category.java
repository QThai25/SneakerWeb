/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author thaiv
 */
public class Category {

    private int categoryId;
    private String name;
    private String decription;
    private String createdAt;

    public Category() {
    }

    public Category(int categoryId, String name, String decription, String createdAt) {
        this.categoryId = categoryId;
        this.name = name;
        this.decription = decription;
        this.createdAt = createdAt;
    }

    public Category(int categoryId, String name, String decription) {
        this.categoryId = categoryId;
        this.name = name;
        this.decription = decription;
    }

   

    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    
    
}
