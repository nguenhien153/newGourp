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
import sem4.jee.g01jewelap.entity.mysql.Metal;

/**
 *
 * @author nguen
 */
@Stateless
public class MetalFacade extends AbstractFacade<Metal> {
    
    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public MetalFacade() {
        super(Metal.class);
        
    }
    
    public Metal findByProductName(String productName) {
        List<Metal> metals = em.createNativeQuery("Select * from metal where product_name = '" + productName + "'", Metal.class)
                .getResultList();
        if (metals.isEmpty()) {
            return null;
        } else {
            return metals.get(0);
        }
    }
    
}
