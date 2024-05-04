package com.icp.gadgets.utils;

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

}
