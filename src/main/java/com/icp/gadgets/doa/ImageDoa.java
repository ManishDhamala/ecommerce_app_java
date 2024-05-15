package com.icp.gadgets.doa;

import com.icp.gadgets.controller.servlet.DatabaseController;
import com.icp.gadgets.utils.StringUtils;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImageDoa {
    public String SaveImageToFile(Part filePart, String fileName, String fileExtension) throws IOException {
        String uploadDir = "/Users/himalpun/Library/CloudStorage/OneDrive-LondonMetropolitanUniversity/College/2nd Sem/Advance Programming/Java_CW/src/main/webapp/images";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) uploadDirFile.mkdirs();
        try(InputStream input = filePart.getInputStream()) {
            Files.copy(input, Paths.get(uploadDir, fileName + "." + fileExtension), StandardCopyOption.REPLACE_EXISTING);
            return uploadDir + "/" + fileName + "." + fileExtension;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getFileExtension(Part part) {
        String contentType = part.getContentType();
        System.out.println("Content Type: " + contentType);
        if (contentType != null) {
            // Extract the file extension from the content type 
            String[] split = contentType.split("/");
            if (split.length == 2) {
                return split[1]; // Return the second part as the file extension
            }
        }
        return "jpg";
    }


    public int SaveImageToDatabase(int productId, String fileName) {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.IMAGE_INSERT);
            st.setString(1, fileName);
            st.setInt(2, productId);
            int result = st.executeUpdate();
            return result > 0 ? 1 : 0;
        } catch ( ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int removeImageByProductId(int productId) {
        try(Connection con = new DatabaseController().getConnection()) {
//            System.out.println("Removing image by product id: " + productId);
            String imgURL = getImgURLByProductId(productId);
//            System.out.println("Image URL: " + imgURL);
            if (imgURL != null) {
                File file = new File(imgURL);
                if (file.exists()) {
                    if (file.delete()) {
                        System.out.println("Image file deleted successfully.");
                    } else {
                        System.out.println("Failed to delete image file.");
                    }
                }
            }
            // Delete image reference from the database
            PreparedStatement st = con.prepareStatement(StringUtils.REMOVE_IMAGE_BY_PRODUCT_ID);
            st.setInt(1, productId);
            int result = st.executeUpdate();
            if(result > 0) {
                System.out.println("Image reference removed from database.");
            } else {
                System.out.println("Failed to remove image reference from database.");
            }
            // Remove image file from local storage
            return result > 0 ? 1 : 0;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
            e.printStackTrace();
            return 0;
        }
    }

    private boolean hasImages(int productId) throws SQLException {
        try (Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.HAS_IMAGE);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // If count is greater than 0, it means there are images associated
            }
            return false; // No rows returned, indicating no images associated
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    public  String getImgURLByProductId(int productId) {
        try(Connection con = new DatabaseController().getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_IMAGE_BY_PRODUCT_ID);
            st.setInt(1, productId);
            String imgURL = null;
            try {
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    imgURL = rs.getString("imgUrl");

                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
//            System.out.println("Image URL: " + imgURL);
            return imgURL;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
