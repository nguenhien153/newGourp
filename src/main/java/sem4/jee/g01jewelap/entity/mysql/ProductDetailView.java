/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author nguen
 */
@Entity
@Table(name = "product_detail_view")
@NamedQueries({
    @NamedQuery(name = "ProductDetailView.findAll", query = "SELECT p FROM ProductDetailView p")})
public class ProductDetailView implements Serializable {

    private static final long serialVersionUID = 1L;
    @Size(max = 50)
    @Column(name = "product_name")
    @Id
    private String productName;
    @Size(max = 50)
    @Column(name = "category_name")
    private String categoryName;
    @Size(max = 50)
    @Column(name = "product_type_name")
    private String productTypeName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "weight_product")
    private Double weightProduct;
    @Column(name = "width")
    private Float width;
    @Column(name = "lenght")
    private Float lenght;
    @Column(name = "grand_total")
    private Double grandTotal;
    @Column(name = "default_option")
    private Boolean defaultOption;
    @Lob
    @Size(max = 65535)
    @Column(name = "main_image")
    private String mainImage;
    @Lob
    @Size(max = 65535)
    @Column(name = "sub_image")
    private String subImage;
    @Lob
    @Size(max = 65535)
    @Column(name = "image_1")
    private String image1;
    @Lob
    @Size(max = 65535)
    @Column(name = "image_2")
    private String image2;
    @Lob
    @Size(max = 65535)
    @Column(name = "image_3")
    private String image3;
    @Lob
    @Size(max = 65535)
    @Column(name = "image_4")
    private String image4;

    public ProductDetailView() {
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public Double getWeightProduct() {
        return weightProduct;
    }

    public void setWeightProduct(Double weightProduct) {
        this.weightProduct = weightProduct;
    }

    public Float getWidth() {
        return width;
    }

    public void setWidth(Float width) {
        this.width = width;
    }

    public Float getLenght() {
        return lenght;
    }

    public void setLenght(Float lenght) {
        this.lenght = lenght;
    }

    public Double getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(Double grandTotal) {
        this.grandTotal = grandTotal;
    }

    public Boolean getDefaultOption() {
        return defaultOption;
    }

    public void setDefaultOption(Boolean defaultOption) {
        this.defaultOption = defaultOption;
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

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }
    
}
