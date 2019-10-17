/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author nguen
 */
@Entity
@Table(name = "product_view")

public class ProductView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 50)
    @Column(name = "product_name")
    @Id
    private String productName;
    @Column(name = "date_create")
    @Temporal(TemporalType.DATE)
    private Date dateCreate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "making_charges")
    private BigDecimal makingCharges;
    @Size(max = 50)
    @Column(name = "product_type_name")
    private String productTypeName;
    @Column(name = "display")
    private Boolean display;
    @Column(name = "view_number")
    private BigInteger viewNumber;
    @Lob
    @Size(max = 65535)
    @Column(name = "tag")
    private String tag;
    @Column(name = "diamond")
    private Double diamond;
    @Column(name = "diamond_price")
    private Double diamondPrice;
    @Column(name = "gemstone")
    private Double gemstone;
    @Column(name = "gemstone_price")
    private Double gemstonePrice;
    @Column(name = "metal")
    private Float metal;
    @Column(name = "metal_price")
    private Double metalPrice;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "main_image")
    private String mainImage;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "sub_image")
    private String subImage;
    @Column(name = "weight_product")
    private Double weightProduct;
    @Column(name = "grand_total")
    private Double grandTotal;

    public ProductView() {
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public BigDecimal getMakingCharges() {
        return makingCharges;
    }

    public void setMakingCharges(BigDecimal makingCharges) {
        this.makingCharges = makingCharges;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public Boolean getDisplay() {
        return display;
    }

    public void setDisplay(Boolean display) {
        this.display = display;
    }

    public BigInteger getViewNumber() {
        return viewNumber;
    }

    public void setViewNumber(BigInteger viewNumber) {
        this.viewNumber = viewNumber;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Double getDiamond() {
        return diamond;
    }

    public void setDiamond(Double diamond) {
        this.diamond = diamond;
    }

    public Double getDiamondPrice() {
        return diamondPrice;
    }

    public void setDiamondPrice(Double diamondPrice) {
        this.diamondPrice = diamondPrice;
    }

    public Double getGemstone() {
        return gemstone;
    }

    public void setGemstone(Double gemstone) {
        this.gemstone = gemstone;
    }

    public Double getGemstonePrice() {
        return gemstonePrice;
    }

    public void setGemstonePrice(Double gemstonePrice) {
        this.gemstonePrice = gemstonePrice;
    }

    public Float getMetal() {
        return metal;
    }

    public void setMetal(Float metal) {
        this.metal = metal;
    }

    public Double getMetalPrice() {
        return metalPrice;
    }

    public void setMetalPrice(Double metalPrice) {
        this.metalPrice = metalPrice;
    }

    public String getMainImage() {
        return mainImage;
    }

    public void setMainImage(String mainImage) {
        this.mainImage = mainImage;
    }

    public String getSubImage() {
        return subImage;
    }

    public void setSubImage(String subImage) {
        this.subImage = subImage;
    }

    public Double getWeightProduct() {
        return weightProduct;
    }

    public void setWeightProduct(Double weightProduct) {
        this.weightProduct = weightProduct;
    }

    public Double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(Double grandTotal) {
        this.grandTotal = grandTotal;
    }
    
}
