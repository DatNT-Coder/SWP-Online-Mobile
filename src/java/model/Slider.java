/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author naokh
 */
public class Slider {

          private int id;
          private String title;
          private String image;
          private String backlink;
          private int status;
          private String notes;
          private int marketingId;
          private Date updatedDate;

          public Slider() {
          }

          public Slider(int id, String title, String image, String backlink, int status, String notes, int marketingId, Date updatedDate) {
                    this.id = id;
                    this.title = title;
                    this.image = image;
                    this.backlink = backlink;
                    this.status = status;
                    this.notes = notes;
                    this.marketingId = marketingId;
                    this.updatedDate = updatedDate;
          }

          public int getId() {
                    return id;
          }

          public void setId(int id) {
                    this.id = id;
          }

          public String getTitle() {
                    return title;
          }

          public void setTitle(String title) {
                    this.title = title;
          }

          public String getImage() {
                    return image;
          }

          public void setImage(String image) {
                    this.image = image;
          }

          public String getBacklink() {
                    return backlink;
          }

          public void setBacklink(String backlink) {
                    this.backlink = backlink;
          }

          public int getStatus() {
                    return status;
          }

          public void setStatus(int status) {
                    this.status = status;
          }

          public String getNotes() {
                    return notes;
          }

          public void setNotes(String notes) {
                    this.notes = notes;
          }

          public int getMarketingId() {
                    return marketingId;
          }

          public void setMarketingId(int marketingId) {
                    this.marketingId = marketingId;
          }

          public Date getUpdatedDate() {
                    return updatedDate;
          }

          public void setUpdatedDate(Date updatedDate) {
                    this.updatedDate = updatedDate;
          }

          @Override
          public String toString() {
                    return "Slider{"
                            + "id=" + id
                            + ", title='" + title + '\''
                            + ", image='" + image + '\''
                            + ", backlink='" + backlink + '\''
                            + ", status=" + status
                            + ", notes='" + notes + '\''
                            + ", marketingId=" + marketingId
                            + ", updatedDate=" + updatedDate
                            + '}';
          }
}
