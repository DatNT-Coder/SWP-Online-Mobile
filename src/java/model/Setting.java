/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tiend
 */
public class Setting {
    private int id;
    private String name;
    private String value;
    private String type;
    private int order;
    private String description;
    private int isActive;
    private int canDeactive;
    

    public Setting() {
    }

    public Setting(int id, String name, String value, String type, int order, String description, int isActive, int canDeactive) {
        this.id = id;
        this.name = name;
        this.value = value;
        this.type = type;
        this.order = order;
        this.description = description;
        this.isActive = isActive;
        this.canDeactive = canDeactive;
    }

    public Setting(String name, String value, String type, int order, String description, int isActive, int canDeactive) {
        this.name = name;
        this.value = value;
        this.type = type;
        this.order = order;
        this.description = description;
        this.isActive = isActive;
        this.canDeactive = canDeactive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public int getCanDeactive() {
        return canDeactive;
    }

    public void setCanDeactive(int canDeactive) {
        this.canDeactive = canDeactive;
    }

    @Override
    public String toString() {
        return "Setting{" + "id=" + id + ", name=" + name + ", value=" + value + ", type=" + type + ", order=" + order + ", description=" + description + ", isActive=" + isActive + ", canDeactive=" + canDeactive + '}';
    }

    
    
}

