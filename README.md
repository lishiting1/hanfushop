# hanfushop
网络工程 李诗婷 202230441374
网络应用开发大作业，做一个在线购物网站，使用servlet+jsp+mysql+Tomcat实现。
环境：IntelliJ 2024.3, MySQL 8.0.37，  Tomcat 9.0.37
需要导入数据库的文件：onlineshop.sql,注意在dbcp.properties文件中将数据库的信息改成自己的。

系统结构：
本汉服购物系统的架构采用分层设计。
util层：这是一个工具类的包，包括数据库连接工具等；
dao层：实现对数据库的增删改查，包括dao层接口，提供数据库中表增删改查接口，ipml里面提供各个接口的实现类；
service层：管理业务调度和跳转，处理逻辑问题，包括service层接口，提供各种服务的接口，ipml里面提供各个接口的实现类；
domain层：封装数据，设置数据的属性和行为，包括封装数据库中各种表的数据的实现类；
web层：实现各种前端的功能，包括网页展示的jsp文件，与后端交互、处理请求的servlet。

实现功能：
这个汉服购物平台为顾客提供了一个基本的购物系统。
1、用户登录与注册。系统用户分为管理员和普通用户，管理员用户可以通过管理员账号进入后台，对用户和商品信息进行增删改查；
普通用户只能浏览或购买商品，以及修改个人信息。
2、商品展示和管理。前端展示商品，用户可以点击看商品的详细信息、加入购物车、下单；后台管理商品信息，可进行增删改查。
3、商品的分类功能。管理员可以进行商品的分类管理，在前端页面用户可以通过菜单选择进行分类展示商品。
4、历史订单信息、购买日志。普通用户可在个人中心查看历史订单详情；管理员可以在管理中心查看或修改订单信息。