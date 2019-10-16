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
@Table(name = "gemstone")
@NamedQueries({
    @NamedQuery(name = "Gemstone.findAll", query = "SELECT g FROM Gemstone g")})
public class Gemstone implements Serializable {

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
    @Column(name = "width")
    private float width;
    @Basic(optional = false)
    @NotNull
    @Column(name = "lenght")
    private float lenght;
    @Basic(optional = false)
    @NotNull
    @Column(name = "total_number")
    private int totalNumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "total_weight")
    private float totalWeight;
    @Basic(optional = false)
    @NotNull
    @Column(name = "carat")
    private float carat;
    @JoinColumn(name = "product_name", referencedColumnName = "product_name")
    @ManyToOne(optional = false)
    private Product productName;

    public Gemstone() {
    }

    public Gemstone(Integer id) {
        this.id = id;
    }

    public Gemstone(Integer id, Date dateCreate, String createBy, float width, float lenght, int totalNumber, float totalWeight, float carat) {
        this.id = id;
        this.dateCreate = dateCreate;
        this.createBy = createBy;
        this.width = width;
        this.lenght = lenght;
        this.totalNumber = totalNumber;
        this.totalWeight = totalWeight;
        this.carat = carat;
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

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getLenght() {
        return lenght;
    }

    public void setLenght(float lenght) {
        this.lenght = lenght;
    }

    public int getTotalNumber() {
        return totalNumber;
    }

    public void setTotalNumber(int totalNumber) {
        this.totalNumber = totalNumber;
    }

    public float getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(float totalWeight) {
        this.totalWeight = totalWeight;
    }

    public float getCarat() {
        return carat;
    }

    public void setCarat(float carat) {
        this.carat = carat;
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
        if (!(object instanceof Gemstone)) {
            return false;
        }
        Gemstone other = (Gemstone) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.Gemstone[ id=" + id + " ]";
    }
    
}
