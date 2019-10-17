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
import sem4.jee.g01jewelap.entity.mysql.GemstoneView;

/**
 *
 * @author nguen
 */
@Stateless
public class GemstoneViewFacade extends AbstractFacade<GemstoneView> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GemstoneViewFacade() {
        super(GemstoneView.class);
    }

    public List<GemstoneView> findByName(String name) {
         return em.createNativeQuery("SELECT * FROM gemstone_view WHERE product_name = '"+
                 name+"' ORDER BY price", GemstoneView.class).getResultList();
    }
    
}
