
CRM - 客户关系管理系统

1.在 MyEclipse 中导入 crm 工程
2.复制 WebRoot/db/sqlScript.sql中的内容,
    然后在 pl/sql developer 的 SQL Window中执行
    结果:建表 / 初始化数据
3.部署 crm 到 Tomcat,且启动 (注意启动时是否异常)
4.打开浏览器 http://ip:port/crm    
  admin   - admin  管理员(所有功能)
  newer_c - newer 客户经理 (Customer)
  newer_s - newer 销售主管 (Saler)
  newer_m - newer 高管        (Manager)


crm
 - src 所有的源码和配置文件
    - com.crm.action 表示层 封装 Struts2 的操作
    - com.crm.dao 持久层 封装 Hiberante 的操作
    - com.crm.pojo 实体类/Hiberante映射文件
    - com.crm.service 业务逻辑层 封装 Spring 的操作
    - com.crm.test JUnit 单元测试
    - com.crm.util 工具包(加密/分页/图片随机数) 
    
    - applicationContext.xml Spring 总配置文件
    - applicationContext-*.xml Spring 对应模块配置文件
    
    - ehcache.xml 配置 Hiberante 二级缓存
    - log4j.properties Log4j 配置文件
    
    - struts.xml Struts2 总配置文件
    - struts-*.xml Struts2 对应模块配置文件
    
 - WebRoot 所有的jsp/js/css/images文件   
    - basedata 数据字典管理模块
    - css 样式文件
    - db Oracle数据库脚本
    - dhtmltree 动态html树
    - images 图片
    - js  
    - menu 权限管理的xml文件
    - WEB-INF
    - *.jsp
    


已完成的功能：
1.登录 + 权限管理
  Strtuts2+jQuery实现图片随机数
  dhtmltree + xml 实现权限
  md5 对密码 加密  
  
2.数据字典管理 - 查询产品信息    
  Struts2+Spring+Hiberante 实现分页
  Hiberante 二级缓存
  
  
