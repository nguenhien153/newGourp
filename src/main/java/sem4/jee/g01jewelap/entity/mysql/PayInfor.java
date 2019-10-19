/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.entity.mysql;

import java.io.Serializable;
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
@Table(name = "pay_infor")
@NamedQueries({
    @NamedQuery(name = "PayInfor.findAll", query = "SELECT p FROM PayInfor p")})
public class PayInfor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 200)
    @Column(name = "custNameInfor")
    private String custNameInfor;
    @Size(max = 255)
    @Column(name = "custAddInfor")
    private String custAddInfor;
    @Column(name = "custPhoneInfor")
    private Integer custPhoneInfor;
    @Size(max = 200)
    @Column(name = "userBankInfor")
    private String userBankInfor;
    @Size(max = 50)
    @Column(name = "numberCardInfor")
    private String numberCardInfor;
    @Column(name = "cardOpenDate")
    @Temporal(TemporalType.DATE)
    private Date cardOpenDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "update_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateAt;
    @Column(name = "deleted_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedAt;
    @JoinColumn(name = "accountID", referencedColumnName = "account_id")
    @ManyToOne(optional = false)
    private Account accountID;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "payInforID")
    private List<Invoice> invoiceList;

    public PayInfor() {
    }

    public PayInfor(Integer id) {
        this.id = id;
    }

    public PayInfor(Integer id, Date createdAt) {
        this.id = id;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCustNameInfor() {
        return custNameInfor;
    }

    public void setCustNameInfor(String custNameInfor) {
        this.custNameInfor = custNameInfor;
    }

    public String getCustAddInfor() {
        return custAddInfor;
    }

    public void setCustAddInfor(String custAddInfor) {
        this.custAddInfor = custAddInfor;
    }

    public Integer getCustPhoneInfor() {
        return custPhoneInfor;
    }

    public void setCustPhoneInfor(Integer custPhoneInfor) {
        this.custPhoneInfor = custPhoneInfor;
    }

    public String getUserBankInfor() {
        return userBankInfor;
    }

    public void setUserBankInfor(String userBankInfor) {
        this.userBankInfor = userBankInfor;
    }

    public String getNumberCardInfor() {
        return numberCardInfor;
    }

    public void setNumberCardInfor(String numberCardInfor) {
        this.numberCardInfor = numberCardInfor;
    }

    public Date getCardOpenDate() {
        return cardOpenDate;
    }

    public void setCardOpenDate(Date cardOpenDate) {
        this.cardOpenDate = cardOpenDate;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }

    public Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {
        this.deletedAt = deletedAt;
    }

    public Account getAccountID() {
        return accountID;
    }

    public void setAccountID(Account accountID) {
        this.accountID = accountID;
    }

    public List<Invoice> getInvoiceList() {
        return invoiceList;
    }

    public void setInvoiceList(List<Invoice> invoiceList) {
        this.invoiceList = invoiceList;
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
        if (!(object instanceof PayInfor)) {
            return false;
        }
        PayInfor other = (PayInfor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.PayInfor[ id=" + id + " ]";
    }
    
}
