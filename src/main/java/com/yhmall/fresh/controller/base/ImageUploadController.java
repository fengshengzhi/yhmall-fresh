package com.yhmall.fresh.controller.base;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.csource.upload.UploadFileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yhmall.fresh.utils.Common;
import com.yhmall.fresh.utils.Constants;

/**
 * 
 * @author zwt
 *
 */

@Controller
public class ImageUploadController {

	private static final Log logger = LogFactory.getLog(ImageUploadController.class);
	  
	 /**  
     * 从输入流中获取数据  
     * @param inStream 输入流  
     * @return  
     * @throws Exception  
     */    
    public byte[] readInputStream(InputStream inStream) throws Exception{    
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();    
        byte[] buffer = new byte[1024];    
        int len = 0;    
        while( (len=inStream.read(buffer)) != -1 ){    
            outStream.write(buffer, 0, len);    
        }    
        inStream.close();    
        return outStream.toByteArray();    
    }    
    /** 
     * 图片裁切 
     * @param x1 选择区域左上角的x坐标 
     * @param y1 选择区域左上角的y坐标 
     * @param width 选择区域的宽度 
     * @param height 选择区域的高度 
     * @param sourcePath 源图片路径 
     * @param descpath 裁切后图片的保存路径 
     */  
    public byte[] cut(int x1, int y1, int width, int height,  
            String sourcePath) {  
  
        ImageInputStream iis = null;  
        try {  
            String fileSuffix = sourcePath.substring(sourcePath  
                    .lastIndexOf(".") + 1);  
            Iterator<ImageReader> it = ImageIO  
                    .getImageReadersByFormatName(fileSuffix);  
            ImageReader reader = it.next();  
            iis = ImageIO.createImageInputStream(getInputStreamByUrl(sourcePath));  
            reader.setInput(iis, true);  
            ImageReadParam param = reader.getDefaultReadParam();  
            Rectangle rect = new Rectangle(x1, y1, width, height);  
            param.setSourceRegion(rect);  
            BufferedImage bi = reader.read(0, param);  
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bi, fileSuffix,byteArrayOutputStream);  
            
           /* File file=new File("d://100.jpg");

            FileOutputStream fos=new FileOutputStream(file);

            fos.write(byteArrayOutputStream.toByteArray(),0,byteArrayOutputStream.toByteArray().length);

            fos.flush();

            fos.close(); */
            
            return byteArrayOutputStream.toByteArray();
        } catch (Exception ex) {  
            ex.printStackTrace();  
        } finally {  
            if (iis != null) {  
                try {  
                    iis.close();  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
                iis = null;  
            }  
        }
		return null;  
  
    }  
    
    /**  
     * 根据地址获得数据的字节流  
     * @param strUrl 网络连接地址  
     * @return  
     */    
    public InputStream getInputStreamByUrl(String strUrl){    
        try {    
            URL url = new URL(strUrl);    
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();    
            conn.setRequestMethod("GET");    
            conn.setConnectTimeout(5 * 1000);    
            InputStream inStream = conn.getInputStream();//通过输入流获取图片数据    
            return inStream;    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
        return null;    
    }    
    
    /**  
     * 根据地址获得数据的字节流  
     * @param strUrl 网络连接地址  
     * @return  
     */    
    public byte[] getImageFromNetByUrl(String strUrl){    
        try {    
            URL url = new URL(strUrl);    
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();    
            conn.setRequestMethod("GET");    
            conn.setConnectTimeout(5 * 1000);    
            InputStream inStream = conn.getInputStream();//通过输入流获取图片数据    
            byte[] btImg = readInputStream(inStream);//得到图片的二进制数据    
            return btImg;    
        } catch (Exception e) {    
            e.printStackTrace();    
        }    
        return null;    
    }    
    
	/**
	 * 图片裁剪
	 * @param request
	 * @param response
	 *  * 图片裁切 
     * @param x1 选择区域左上角的x坐标 
     * @param y1 选择区域左上角的y坐标 
     * @param width 选择区域的宽度 
     * @param height 选择区域的高度 
     * @param sourcePath 源图片路径 
     * @param descpath 裁切后图片的保存路径 
	 * @throws Exception
	 */
    @RequestMapping("/cutImage")
    public void cutImage(
    		int x1, int y1, int width, int height,String sourcePath,HttpServletRequest request,
            HttpServletResponse response)  {
        	
            try {
            	
                // 判断文件名是否为空。为空set null值
                String myfileUrl = UploadFileUtil.uploadFile(
                		new ByteArrayInputStream(this.cut(x1, y1, width, height, sourcePath)),
                       sourcePath.substring(sourcePath  
                               .lastIndexOf(".") + 1), null);
                
                String newUrl = Constants.IMAGES_VIEW2 + myfileUrl;
                
                if(null!=myfileUrl){
                	
                	logger.info("图片上传成功ImageUrl："+newUrl);
                	response.getWriter().write(
                			"{\"url\":\"" + newUrl+"\",\"error\":0,"+"\"success\":\"true\"," + "\"data\":{\"BaseUrl\":\""
                					+ myfileUrl + "\",\"url\":\"" + newUrl
                					+ "\",\"filename\":\""
                					+ sourcePath.substring(sourcePath  
                                            .lastIndexOf(".") + 1) + "\"}}");
                	
                } else {
                	
                	logger.error("图片服务器上传图片失败！！");
                	response.getWriter().write(
                			"{\"error\":\"1\","+"\"success\":\"flase\"," + "\"data\":{\"BaseUrl\":\"\",\"Url\":\"\",\"filename\":\""
                					+ sourcePath.substring(sourcePath  
                                            .lastIndexOf(".") + 1) + "\"}}");
                	
                }
            } catch (Exception e) {
            	
                try {
                	
                    response.getWriter().write(
                            "{\"success\":\"false\","
                                    + "\"data\":{\"BaseUrl\":\"" + ""
                                    + "\",\"Url\":\"" + ""
                                    + "\",\"filename\":\"" + "" + "\"}}");
                    
                } catch (IOException e1) {
                	
                    logger.error("图片裁剪失败！！！"+e1.getMessage(),e1);
                }
                
                logger.error("图片裁剪失败！！！"+e.getMessage(),e);
            }
        
        
    }
	
    
    /**
	 * 图片上传
	 * @param request
	 * @param response
	 * @throws Exception
	 */
    @RequestMapping("/imageUp")
    public void uploadImages(HttpServletRequest request,
            HttpServletResponse response)  {
    	
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = mulRequest.getFileMap();
        
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
        	
            try {
            	
                MultipartFile mf = entity.getValue();
                // 判断文件名是否为空。为空set null值
                String myfileUrl = UploadFileUtil.uploadFile(
                        mf.getInputStream(),
                        Common.getFileExt2(mf.getOriginalFilename()), null);
                
                String newUrl = Constants.IMAGES_VIEW2 + myfileUrl;
                
                if(null!=myfileUrl){
                	
                	logger.info("图片上传成功ImageUrl："+newUrl);
                	response.getWriter().write(
                			"{\"url\":\"" + newUrl+"\",\"error\":0,"+"\"success\":\"true\"," + "\"data\":{\"BaseUrl\":\""
                					+ myfileUrl + "\",\"url\":\"" + newUrl
                					+ "\",\"filename\":\""
                					+ mf.getOriginalFilename() + "\"}}");
                	
                } else {
                	
                	logger.error("图片服务器上传图片失败！！");
                	response.getWriter().write(
                			"{\"error\":\"1\","+"\"success\":\"flase\"," + "\"data\":{\"BaseUrl\":\"\",\"Url\":\"\",\"filename\":\""
                					+ mf.getOriginalFilename() + "\"}}");
                	
                }
            } catch (Exception e) {
            	
                try {
                	
                    response.getWriter().write(
                            "{\"success\":\"false\","
                                    + "\"data\":{\"BaseUrl\":\"" + ""
                                    + "\",\"Url\":\"" + ""
                                    + "\",\"filename\":\"" + "" + "\"}}");
                    
                } catch (IOException e1) {
                	
                    logger.error("展示属性图片上传失败！！！"+e1.getMessage(),e1);
                }
                
                logger.error("展示属性图片上传失败！！！"+e.getMessage(),e);
            }
        }
        
        
    }
}
