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
import sem4.jee.g01jewelap.entity.mysql.MetalType;

/**
 *
 * @author nguen
 */
@Stateless
public class MetalTypeFacade extends AbstractFacade<MetalType> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MetalTypeFacade() {
        super(MetalType.class);
    }

    public MetalType findByProductName(String metalTypeName) {
        List<MetalType> metalTypes = em.createQuery("SELECT p FROM MetalType p WHERE p.metalTypeName = :name", MetalType.class)
                .setParameter("name", metalTypeName)
                .getResultList();
        if (metalTypes.isEmpty()) {
            return null;
        } else {
            return metalTypes.get(0);
        }
    }

    
}
