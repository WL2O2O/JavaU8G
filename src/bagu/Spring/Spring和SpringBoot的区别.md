> Spring 是什么？

Spring 是一个功能强大的企业级开发框架，提供了一系列的模板，用来支持不同的应用需求，如：依赖注入（DI）、面向切面编程（AOP）、事务管理、Web 应用程序开发等。然后 Spring Boot 框架的出现，主要起到了简化 Spring 应用程序的开发，有利于快速构建开发应用程序。

> Spring Boot 提供了什么功能？

1. 自动装配

​	通过依赖一个 spring-boot-starter-xxx 的依赖，然后通过配置文件来简化配置，简化业务逻辑的开发。

2. 内嵌 Web 服务器

​	Spring Boot 内置了`Tomcat`和`Jetty`Web 服务器，所以无需另外下载`Web`服务器便可以运行程序。

​	那么是如何启动`Web`项目的呢？

​	如图：

![启动类方法](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312131550304.png)

​	我们可以看到，在`main`方法中有一个`SpringApplication`类的静态方法`run()`来启动`Web`项目，然后`Spring Boot`会扫描我们的全局依赖，然后结合配置文件中的配置来启动程序。

3. 约定大于配置思想

   简单来说就是配置与业务分离，而且并不需要开发者关心配置如何实现的，只需在配置文件中编写相关配置即可。例如：应用程序通过读取`application.yml`或者`application.properties`文件获取配置，极大程度上，让开发者更加专注于应用程序的开发。

