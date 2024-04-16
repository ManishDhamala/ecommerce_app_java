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
        String uploadDir = "/Users/himalpun/Library/CloudStorage/OneDrive-LondonMetropolitanUniversity/College/2nd Sem/Advance Programming/blaxboxgadgets/src/main/webapp/images";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) uploadDirFile.mkdirs();
        try(InputStream input = filePart.getInputStream()) {
            Files.copy(input, Paths.get(uploadDir, fileName + "." + fileExtension), StandardCopyOption.REPLACE_EXISTING);
            return uploadDir + "/" + fileName + "." + fileExtension;
        } catch (IOException e) {
            throw new IOException("Error saving image to file");
        }

    }
    public String getFileExtension(Part part) {
        String[] split = part.getSubmittedFileName().split("\\.");
        return split[split.length - 1];
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
            System.out.println("Image URL: " + imgURL);
            return imgURL;
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
