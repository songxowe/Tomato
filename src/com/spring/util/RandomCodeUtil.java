package com.spring.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

public class RandomCodeUtil {
	 private ByteArrayInputStream image;
	  private String str;

	  public RandomCodeUtil() {
	    init();
	  }

	  public static RandomCodeUtil Instance() {
	    return new RandomCodeUtil();
	  }

	  public ByteArrayInputStream getImage() {
	    return this.image;
	  }

	  public String getString() {
	    return this.str;
	  }

	  private void init() {
	    // 在内存中创建图象
	    int width = 109;
	    int height = 40;
	    BufferedImage image = new BufferedImage(width, height,
	        BufferedImage.TYPE_INT_RGB);

	    /* 获取内在中图像的上下文 */
	    Graphics g = image.getGraphics();

	    /* 创建一个随机类 */
	    Random random = new Random();

	    /* 设置背景颜色 */
	    g.setColor(this.getRandColor(200, 250));
	    g.fillRect(0, 0, width, height);

	    /* 设置字体 */
	    g.setFont(new Font("Times New Roman", Font.PLAIN, 28));

	    /* 设置干扰线的颜色 */
	    g.setColor(getRandColor(160, 200));
	    for (int i = 0; i < 155; i++) {
	      int x = random.nextInt(width);
	      int y = random.nextInt(height);
	      int xl = random.nextInt(12);
	      int yl = random.nextInt(12);
	      g.drawLine(x, y, x + xl, y + yl);
	    }

	    /* 用来临时保存随机产生的数字 */
	    String sRand = "";
	    for (int i = 0; i < 4; i++) {
	      String rand = String.valueOf(random.nextInt(10));
	      sRand += rand;
	      g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110),
	          20 + random.nextInt(110)));
	      g.drawString(rand, 20 * i + 10, 25);
	      /* 然后赋给str */
	      this.str = sRand;
	    }
	    /* 使图像生效 */
	    g.dispose();

	    ByteArrayInputStream input = null;
	    ByteArrayOutputStream output = new ByteArrayOutputStream();
	    try {
	      ImageOutputStream imageOutput = ImageIO.createImageOutputStream(output);
	      ImageIO.write(image, "JPEG", imageOutput);
	      imageOutput.close();
	      input = new ByteArrayInputStream(output.toByteArray());
	    } catch (Exception e) {
	      System.out.println("验证码图片产生出现错误：" + e.toString());
	    }
	    this.image = input;
	  }

	  /* 随机产生颜色 */
	  private Color getRandColor(int fc, int bc) {
	    Random random = new Random();
	    if (fc > 255)
	      fc = 255;
	    if (bc > 255)
	      bc = 255;
	    int r = fc + random.nextInt(bc - fc);
	    int g = fc + random.nextInt(bc - fc);
	    int b = fc + random.nextInt(bc - fc);
	    return new Color(r, g, b);
	  }
}
