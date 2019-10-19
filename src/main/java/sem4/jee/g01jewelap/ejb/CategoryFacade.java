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
import sem4.jee.g01jewelap.entity.mysql.Category;

/**
 *
 * @author nguen
 */
@Stateless
public class CategoryFacade extends AbstractFacade<Category> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoryFacade() {
        super(Category.class);
    }

    public Boolean checkDupplicate(String categoryName) {
        List<Category> categorys = em.createQuery("SELECT p FROM Category p WHERE p.categoryName = :name", Category.class)
                .setParameter("name", categoryName)
                .getResultList();
        if (categoryName.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }
}
