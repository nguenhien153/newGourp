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
import sem4.jee.g01jewelap.entity.mysql.DiamondView;

/**
 *
 * @author nguen
 */
@Stateless
public class DiamondViewFacade extends AbstractFacade<DiamondView> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiamondViewFacade() {
        super(DiamondView.class);
    }

    public List<DiamondView> findByName(String name) {
      return em.createNativeQuery("SELECT * FROM diamond_view WHERE product_name = '"+
                 name+"' ORDER BY price", DiamondView.class).getResultList();
    }
    
}
