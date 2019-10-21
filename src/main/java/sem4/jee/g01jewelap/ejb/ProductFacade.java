/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.ejb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.SynchronizationType;
import sem4.jee.g01jewelap.entity.mysql.Product;

/**
 *
 * @author nguen
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

    public Integer getIdByProductName(String productName) {
        List<Product> products = em.createQuery("SELECT p FROM Product p WHERE p.productName = :name", Product.class)
                .setParameter("name", productName)
                .getResultList();
        if (products.isEmpty()) {
            return null;
        } else {
            Product product = products.get(0);
            return product.getId();
        }
    }

    public Product findByProductName(String productName) {
        em.flush();
        List<Product> products = em.createNativeQuery("SELECT * from product where product_name= '" + productName + "' ", Product.class)
                .getResultList();
        if (products.isEmpty()) {
            return null;
        } else {
            return products.get(0);
        }
    }

    public Product findById(Integer id) {
        List<Product> products = em.createNativeQuery("SELECT * from product where id= " + id.toString() + " ", Product.class)
                .getResultList();
        if (products.isEmpty()) {
            return null;
        } else {
            return products.get(0);
        }
    }
}
