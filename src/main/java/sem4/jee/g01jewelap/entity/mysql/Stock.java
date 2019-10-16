/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "stock")
@NamedQueries({
    @NamedQuery(name = "Stock.findAll", query = "SELECT s FROM Stock s")})
public class Stock implements Serializable {

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
    @Column(name = "number")
    private int number;
    @Basic(optional = false)
    @NotNull
    @Column(name = "size")
    private int size;
    @JoinColumn(name = "diamond_option_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private DiamondOption diamondOptionId;
    @JoinColumn(name = "gemstone_option_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private GemstoneOption gemstoneOptionId;
    @JoinColumn(name = "metal_option_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private MetalOption metalOptionId;
    @JoinColumn(name = "product_name", referencedColumnName = "product_name")
    @ManyToOne(optional = false)
    private Product productName;

    public Stock() {
    }

    public Stock(Integer id) {
        this.id = id;
    }

    public Stock(Integer id, Date dateCreate, String createBy, int number, int size) {
        this.id = id;
        this.dateCreate = dateCreate;
        this.createBy = createBy;
        this.number = number;
        this.size = size;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public DiamondOption getDiamondOptionId() {
        return diamondOptionId;
    }

    public void setDiamondOptionId(DiamondOption diamondOptionId) {
        this.diamondOptionId = diamondOptionId;
    }

    public GemstoneOption getGemstoneOptionId() {
        return gemstoneOptionId;
    }

    public void setGemstoneOptionId(GemstoneOption gemstoneOptionId) {
        this.gemstoneOptionId = gemstoneOptionId;
    }

    public MetalOption getMetalOptionId() {
        return metalOptionId;
    }

    public void setMetalOptionId(MetalOption metalOptionId) {
        this.metalOptionId = metalOptionId;
    }

    public Product getProductName() {
        return productName;
    }

    public void setProductName(Product productName) {
        this.productName = productName;
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
        if (!(object instanceof Stock)) {
            return false;
        }
        Stock other = (Stock) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.Stock[ id=" + id + " ]";
    }
    
}
