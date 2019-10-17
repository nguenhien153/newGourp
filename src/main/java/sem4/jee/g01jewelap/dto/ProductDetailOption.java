/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sem4.jee.g01jewelap.dto;

import java.util.List;
import sem4.jee.g01jewelap.entity.mysql.Diamond;
import sem4.jee.g01jewelap.entity.mysql.DiamondView;
import sem4.jee.g01jewelap.entity.mysql.Gemstone;
import sem4.jee.g01jewelap.entity.mysql.GemstoneView;
import sem4.jee.g01jewelap.entity.mysql.MetalView;
import sem4.jee.g01jewelap.entity.mysql.ProductDetailView;

/**
 *
 * @author nguen
 */
public class ProductDetailOption {

    private ProductDetailView detailView;

    private List<DiamondView> diamondViews;
    private List<GemstoneView> gemstoneViews;
    private List<MetalView> metalViews;

    private List<Gemstone> listGemstone;
    private List<Diamond> listDiamond;

    public ProductDetailView getDetailView() {
        return detailView;
    }

    public void setDetailView(ProductDetailView detailView) {
        this.detailView = detailView;
    }

    public List<DiamondView> getDiamondViews() {
        return diamondViews;
    }

    public void setDiamondViews(List<DiamondView> diamondViews) {
        this.diamondViews = diamondViews;
    }

    public List<GemstoneView> getGemstoneViews() {
        return gemstoneViews;
    }

    public void setGemstoneViews(List<GemstoneView> gemstoneViews) {
        this.gemstoneViews = gemstoneViews;
    }

    public List<MetalView> getMetalViews() {
        return metalViews;
    }

    public void setMetalViews(List<MetalView> metalViews) {
        this.metalViews = metalViews;
    }

    public List<Gemstone> getListGemstone() {
        return listGemstone;
    }

    public void setListGemstone(List<Gemstone> listGemstone) {
        this.listGemstone = listGemstone;
    }

    public List<Diamond> getListDiamond() {
        return listDiamond;
    }

    public void setListDiamond(List<Diamond> listDiamond) {
        this.listDiamond = listDiamond;
    }

}
