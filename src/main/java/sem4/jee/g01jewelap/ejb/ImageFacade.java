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
import sem4.jee.g01jewelap.entity.mysql.Image;

/**
 *
 * @author nguen
 */
@Stateless
public class ImageFacade extends AbstractFacade<Image> {

    @PersistenceContext(unitName = "jewelap_mysql")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ImageFacade() {
        super(Image.class);
    }

    public List<Image> findByProductName(String productName) {
        List<Image> images = em.createNativeQuery("Select * from image where product_name = '" + productName + "'", Image.class)
                .getResultList();
        if (images.isEmpty()) {
            return null;
        } else {
            return images;
        }
    }

}
