package com.icp.gadgets.utils;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import org.apache.commons.codec.binary.Base64;

public class Helper {

    public String getDayName(int day){
        switch(day){
            case 1:
                return "Sunday";
            case 2:
                return "Monday";
            case 3:
                return "Tuesday";
            case 4:
                return "Wednesday";
            case 5:
                return "Thursday";
            case 6:
                return "Friday";
            case 7:
                return "Saturday";
            default:
                return "Invalid day";
        }
    }

    public String getColorAccordingToDay(int day){
        switch(day){
            case 1:
                return "#5EB344";
            case 2:
                return "#FCB72A";
            case 3:
                return "#F8821A";
            case 4:
                return "#E0393E";
            case 5:
                return "#963D97";
            case 6:
                return "#069CDB";
            case 7:
                return "#F39C12";
            default:
                return "#F39C12";
        }
    }

    public  String extractFileName(String imgUrl) {
        // Split the URL by "/"
        String[] parts = imgUrl.split("/");

        // Get the last part, which should be the filename
        String fileName = parts[parts.length - 1];

        // Return the filename
        return fileName;
    }


    public  String getAPiSecret(String message) throws NoSuchAlgorithmException, InvalidKeyException {
        System.out.println("Message: " + message);
        String secret = "8gBm/:&EnhH.1/q";
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(secret.getBytes(),"HmacSHA256");
        sha256_HMAC.init(secret_key);
        String hash = Base64.encodeBase64String(sha256_HMAC.doFinal(message.getBytes()));
        System.out.println("Hash: " + hash);
        return hash;
    }
}
