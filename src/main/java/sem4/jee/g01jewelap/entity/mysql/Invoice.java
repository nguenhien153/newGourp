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
@Table(name = "invoice")
@NamedQueries({
    @NamedQuery(name = "Invoice.findAll", query = "SELECT i FROM Invoice i")})
public class Invoice implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "status")
    private String status;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "pay_method")
    private String payMethod;
    @Basic(optional = false)
    @NotNull
    @Column(name = "numberCheck_invoice")
    private int numberCheckinvoice;
    @Basic(optional = false)
    @NotNull
    @Column(name = "cancel_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date cancelDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "cancel_reason")
    private String cancelReason;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Basic(optional = false)
    @NotNull
    @Column(name = "update_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateAt;
    @Column(name = "deleted_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedAt;
    @JoinColumn(name = "accountID", referencedColumnName = "account_id")
    @ManyToOne(optional = false)
    private Account accountID;
    @JoinColumn(name = "invoiceDetailID", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private InvoiceDetail invoiceDetailID;
    @JoinColumn(name = "locationsID", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Locations locationsID;
    @JoinColumn(name = "payInforID", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PayInfor payInforID;

    public Invoice() {
    }

    public Invoice(Integer id) {
        this.id = id;
    }

    public Invoice(Integer id, String status, String payMethod, int numberCheckinvoice, Date cancelDate, String cancelReason, Date createdAt, Date updateAt) {
        this.id = id;
        this.status = status;
        this.payMethod = payMethod;
        this.numberCheckinvoice = numberCheckinvoice;
        this.cancelDate = cancelDate;
        this.cancelReason = cancelReason;
        this.createdAt = createdAt;
        this.updateAt = updateAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public int getNumberCheckinvoice() {
        return numberCheckinvoice;
    }

    public void setNumberCheckinvoice(int numberCheckinvoice) {
        this.numberCheckinvoice = numberCheckinvoice;
    }

    public Date getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getCancelReason() {
        return cancelReason;
    }

    public void setCancelReason(String cancelReason) {
        this.cancelReason = cancelReason;
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

    public InvoiceDetail getInvoiceDetailID() {
        return invoiceDetailID;
    }

    public void setInvoiceDetailID(InvoiceDetail invoiceDetailID) {
        this.invoiceDetailID = invoiceDetailID;
    }

    public Locations getLocationsID() {
        return locationsID;
    }

    public void setLocationsID(Locations locationsID) {
        this.locationsID = locationsID;
    }

    public PayInfor getPayInforID() {
        return payInforID;
    }

    public void setPayInforID(PayInfor payInforID) {
        this.payInforID = payInforID;
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
        if (!(object instanceof Invoice)) {
            return false;
        }
        Invoice other = (Invoice) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "sem4.jee.g01jewelap.entity.mysql.Invoice[ id=" + id + " ]";
    }
    
}
