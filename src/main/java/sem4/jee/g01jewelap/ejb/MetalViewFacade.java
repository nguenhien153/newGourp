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
import sem4.jee.g01jewelap.entity.mysql.MetalView;

/**
 *
 * @author nguen
 */
@Stateless
public class MetalViewFacade extends AbstractFacade<MetalView> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MetalViewFacade() {
        super(MetalView.class);
    }

    public List<MetalView> findByName(String name) {
        return em.createNativeQuery("SELECT * FROM metal_view where product_name = '"+name
                +"' ORDER BY default_option DESC", MetalView.class)
                .getResultList();
    }

}
