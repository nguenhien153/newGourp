/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.ejb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import sem4.jee.g01jewelap.entity.mysql.GemstoneOption;

/**
 *
 * @author nguen
 */
@Stateless
public class GemstoneOptionFacade extends AbstractFacade<GemstoneOption> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GemstoneOptionFacade() {
        super(GemstoneOption.class);
    }
    
}
