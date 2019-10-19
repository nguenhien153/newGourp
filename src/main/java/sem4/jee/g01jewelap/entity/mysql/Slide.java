/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author TrangNguyen
 */
@Entity
@Table(name = "slide")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Slide.findAll", query = "SELECT s FROM Slide s")
    , @NamedQuery(name = "Slide.findById", query = "SELECT s FROM Slide s WHERE s.id = :id")
    , @NamedQuery(name = "Slide.findBySlideUrl", query = "SELECT s FROM Slide s WHERE s.slideUrl = :slideUrl")
    , @NamedQuery(name = "Slide.findByIsShow", query = "SELECT s FROM Slide s WHERE s.isShow = :isShow")
    , @NamedQuery(name = "Slide.findByOrdinal", query = "SELECT s FROM Slide s WHERE s.ordinal = :ordinal")})
public class Slide implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 50)
    @Column(name = "slide_url")
    private String slideUrl;
    @Column(name = "is_show")
    private Boolean isShow;
    @Lob
    @Size(max = 65535)
    @Column(name = "title")
    private String title;
    @Column(name = "ordinal")
    private Integer ordinal;

    public Slide() {
    }

    public Slide(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSlideUrl() {
        return slideUrl;
    }

    public void setSlideUrl(String slideUrl) {
        this.slideUrl = slideUrl;
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getOrdinal() {
        return ordinal;
    }

    public void setOrdinal(Integer ordinal) {
        this.ordinal = ordinal;
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
        if (!(object instanceof Slide)) {
            return false;
        }
        Slide other = (Slide) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.Slide[ id=" + id + " ]";
    }
    
}
