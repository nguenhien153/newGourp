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
import sem4.jee.g01jewelap.entity.mysql.ProductType;

/**
 *
 * @author nguen
 */
@Stateless
public class ProductTypeFacade extends AbstractFacade<ProductType> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductTypeFacade() {
        super(ProductType.class);
    }

    public ProductType findByName(String productTypeName) {
        List<ProductType> productTypes = em.createQuery("SELECT p FROM ProductType p WHERE p.productTypeName = :name", ProductType.class)
                .setParameter("name", productTypeName)
                .getResultList();
        if (productTypes.isEmpty()) {
            return null;
        } else {
            return productTypes.get(0);
        }
    }

}
