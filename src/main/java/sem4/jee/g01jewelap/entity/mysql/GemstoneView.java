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
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author nguen
 */
@Entity
@Table(name = "gemstone_view")
@NamedQueries({
    @NamedQuery(name = "GemstoneView.findAll", query = "SELECT g FROM GemstoneView g")})
public class GemstoneView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "product_name")
    private String productName;
    @Size(max = 50)
    @Id
    @Column(name = "gemstone_type")
    private String gemstoneType;
    @Column(name = "rate")
    private BigDecimal rate;
    @Id
    @Column(name = "price")
    private Double price;
    @Column(name = "total_weight")
    private Double totalWeight;

    public GemstoneView() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getGemstoneType() {
        return gemstoneType;
    }

    public void setGemstoneType(String gemstoneType) {
        this.gemstoneType = gemstoneType;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(Double totalWeight) {
        this.totalWeight = totalWeight;
    }

}
