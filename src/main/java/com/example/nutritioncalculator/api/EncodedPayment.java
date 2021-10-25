package com.example.nutritioncalculator.api;

import java.io.Serializable;


public class EncodedPayment implements Serializable {

    private byte[] data;

    private String storeId;

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId;
    }

}
