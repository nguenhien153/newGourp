/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author nguen
 */
@Entity
@Table(name = "diamond_view")
@NamedQueries({
    @NamedQuery(name = "DiamondView.findAll", query = "SELECT d FROM DiamondView d")})
public class DiamondView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 50)
    @Column(name = "product_name")
    private String productName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "rate")
    private BigDecimal rate;
    @Size(max = 50)
    @Column(name = "diamond_type")
    private String diamondType;
    @Column(name = "total_weight")
    private Double totalWeight;
    @Column(name = "price")
    private Double price;

    public DiamondView() {
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public String getDiamondType() {
        return diamondType;
    }

    public void setDiamondType(String diamondType) {
        this.diamondType = diamondType;
    }

    public Double getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(Double totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
    
}
