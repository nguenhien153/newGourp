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
import sem4.jee.g01jewelap.entity.mysql.Gemstone;

/**
 *
 * @author nguen
 */
@Stateless
public class GemstoneFacade extends AbstractFacade<Gemstone> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public GemstoneFacade() {
        super(Gemstone.class);
    }

    public List<Gemstone> findByName(String name) {
        return em.createNativeQuery("select id ,width , lenght, total_number, total_weight, carat from "
                + "gemstone where product_name = '" + name + "'", Gemstone.class).getResultList();
    }
    
}
