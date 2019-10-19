/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
@Table(name = "product")
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")})
public class Product implements Serializable {

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productID")
    private List<InvoiceDetail> invoiceDetailList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productID")
    private List<Shoppingcart> shoppingcartList;
    @OneToMany(mappedBy = "productID")
    private List<Discount> discountList;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date_create")
    @Temporal(TemporalType.DATE)
    private Date dateCreate;
    @Column(name = "date_modify")
    @Temporal(TemporalType.DATE)
    private Date dateModify;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "create_by")
    private String createBy;
    @Size(max = 50)
    @Column(name = "modify_by")
    private String modifyBy;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "product_name")
    private String productName;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "making_charges")
    private BigDecimal makingCharges;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lenght")
    private float lenght;
    @Basic(optional = false)
    @NotNull
    @Column(name = "height")
    private float height;
    @Basic(optional = false)
    @NotNull
    @Column(name = "display")
    private boolean display;
    @Basic(optional = false)
    @NotNull
    @Column(name = "width")
    private float width;
    @Basic(optional = false)
    @NotNull
    @Column(name = "view_number")
    private long viewNumber;
    @Lob
    @Size(max = 65535)
    @Column(name = "tag")
    private String tag;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<Image> imageList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<MetalOption> metalOptionList;
    @JoinColumn(name = "product_type_name", referencedColumnName = "product_type_name")
    @ManyToOne(optional = false)
    private ProductType productTypeName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<Metal> metalList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<Gemstone> gemstoneList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<GemstoneOption> gemstoneOptionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<Diamond> diamondList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<Stock> stockList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productName")
    private List<DiamondOption> diamondOptionList;

    public Product() {
    }

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, Date dateCreate, String createBy, String productName, BigDecimal makingCharges, float lenght, float height, boolean display, float width, long viewNumber) {
        this.id = id;
        this.dateCreate = dateCreate;
        this.createBy = createBy;
        this.productName = productName;
        this.makingCharges = makingCharges;
        this.lenght = lenght;
        this.height = height;
        this.display = display;
        this.width = width;
        this.viewNumber = viewNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Date getDateModify() {
        return dateModify;
    }

    public void setDateModify(Date dateModify) {
        this.dateModify = dateModify;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(String modifyBy) {
        this.modifyBy = modifyBy;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getMakingCharges() {
        return makingCharges;
    }

    public void setMakingCharges(BigDecimal makingCharges) {
        this.makingCharges = makingCharges;
    }

    public float getLenght() {
        return lenght;
    }

    public void setLenght(float lenght) {
        this.lenght = lenght;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public boolean getDisplay() {
        return display;
    }

    public void setDisplay(boolean display) {
        this.display = display;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public long getViewNumber() {
        return viewNumber;
    }

    public void setViewNumber(long viewNumber) {
        this.viewNumber = viewNumber;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

    public List<MetalOption> getMetalOptionList() {
        return metalOptionList;
    }

    public void setMetalOptionList(List<MetalOption> metalOptionList) {
        this.metalOptionList = metalOptionList;
    }

    public ProductType getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(ProductType productTypeName) {
        this.productTypeName = productTypeName;
    }

    public List<Metal> getMetalList() {
        return metalList;
    }

    public void setMetalList(List<Metal> metalList) {
        this.metalList = metalList;
    }

    public List<Gemstone> getGemstoneList() {
        return gemstoneList;
    }

    public void setGemstoneList(List<Gemstone> gemstoneList) {
        this.gemstoneList = gemstoneList;
    }

    public List<GemstoneOption> getGemstoneOptionList() {
        return gemstoneOptionList;
    }

    public void setGemstoneOptionList(List<GemstoneOption> gemstoneOptionList) {
        this.gemstoneOptionList = gemstoneOptionList;
    }

    public List<Diamond> getDiamondList() {
        return diamondList;
    }

    public void setDiamondList(List<Diamond> diamondList) {
        this.diamondList = diamondList;
    }

    public List<Stock> getStockList() {
        return stockList;
    }

    public void setStockList(List<Stock> stockList) {
        this.stockList = stockList;
    }

    public List<DiamondOption> getDiamondOptionList() {
        return diamondOptionList;
    }

    public void setDiamondOptionList(List<DiamondOption> diamondOptionList) {
        this.diamondOptionList = diamondOptionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.Product[ id=" + id + " ]";
    }

    public List<InvoiceDetail> getInvoiceDetailList() {
        return invoiceDetailList;
    }

    public void setInvoiceDetailList(List<InvoiceDetail> invoiceDetailList) {
        this.invoiceDetailList = invoiceDetailList;
    }

    public List<Shoppingcart> getShoppingcartList() {
        return shoppingcartList;
    }

    public void setShoppingcartList(List<Shoppingcart> shoppingcartList) {
        this.shoppingcartList = shoppingcartList;
    }

    public List<Discount> getDiscountList() {
        return discountList;
    }

    public void setDiscountList(List<Discount> discountList) {
        this.discountList = discountList;
    }
    
}
