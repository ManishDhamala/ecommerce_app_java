package com.icp.gadgets.model;

public class Image {
    private int imageId;
    private String imgUri;


    private String productId;

    public Image(int imageId, String imgUri, String productId) {
        this.imageId = imageId;
        this.imgUri = imgUri;
        this.productId = productId;
    }


    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public String getImgUri() {
        return imgUri;
    }

    public void setImgUri(String imgUri) {
        this.imgUri = imgUri;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
}
