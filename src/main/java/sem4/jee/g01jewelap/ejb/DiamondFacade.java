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
import sem4.jee.g01jewelap.entity.mysql.Diamond;

/**
 *
 * @author nguen
 */
@Stateless
public class DiamondFacade extends AbstractFacade<Diamond> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DiamondFacade() {
        super(Diamond.class);
    }

    public List<Diamond> findByName(String name) {
        return em.createNativeQuery("select id ,carat , total_number ,total_weight from "
                + "diamond where product_name = '" + name + "'", Diamond.class).getResultList();
    }

    public List<Diamond> findByProductName(String productName) {
        List<Diamond> diamonds = em.createNativeQuery("Select * from diamond where product_name = '" + productName + "'", Diamond.class)
                .getResultList();
        if (diamonds.isEmpty()) {
            return null;
        } else {
            return diamonds;
        }
    }

}
