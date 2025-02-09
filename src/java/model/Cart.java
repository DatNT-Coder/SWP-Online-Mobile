
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author quangcto
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    private Item getItemById(int id){
        for (Item i : items) {
            if(i.getProduct().getID()==id)
                return i;
        }
        return null;
    }
    
    public  int getQuantityById(int id){
        return getItemById(id).getQuantity();
    }
    // them vao cart
    
    public void addItem(Item t){
        // co o cart roi
        if(getItemById(t.getProduct().getID())!=null){
            Item i = getItemById(t.getProduct().getID());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        }else{
            //chua co
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!= null){
            items.remove(getItemById(id));
        }
    } 
    
    public double getTotalMoney(){
        double t =0;
        for (Item i : items) {
            t+=i.getQuantity()*i.getPrice();
        }
            return t;
    }
    
    private Product getProductById(int id, List<Product> list){
        for (Product i : list) {
            if(i.getID()==id)
                return i;
        }
        return null;
    }
    
    public Cart(String txt, List<Product> list){
        items = new ArrayList<>();
        try {
        if(txt!=null & txt.length()!=0){
            String[] s =txt.split("-");
            for (String i : s) {
                String[] n =i.split(":");
                int id = Integer.parseInt(n[0]);
                int quantity = Integer.parseInt(n[1]);
                Product p = getProductById(id, list);
                Item t = new Item(p, quantity, p.getCost_price());
                addItem(t);
            }
        }
            
        } catch (Exception e) {
        }
    }
}
