/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.dto;

import java.util.List;
import sem4.jee.g01jewelap.entity.mysql.Diamond;
import sem4.jee.g01jewelap.entity.mysql.Gemstone;
import sem4.jee.g01jewelap.entity.mysql.Image;
import sem4.jee.g01jewelap.entity.mysql.Metal;

/**
 *
 * @author nguen
 */
public class ProductDetailsDTO {

    private int id;
    private String productName;
    
    private List<Metal> metals;
    private List<Diamond> diamonds;
    private List<Gemstone> gemstones;

    private List<Image> images;
    
    public ProductDetailsDTO() {
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public List<Metal> getMetals() {
        return metals;
    }

    public void setMetals(List<Metal> metals) {
        this.metals = metals;
    }

    public List<Diamond> getDiamonds() {
        return diamonds;
    }

    public void setDiamonds(List<Diamond> diamonds) {
        this.diamonds = diamonds;
    }

    public List<Gemstone> getGemstones() {
        return gemstones;
    }

    public void setGemstones(List<Gemstone> gemstones) {
        this.gemstones = gemstones;
    }

}
