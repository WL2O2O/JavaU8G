## 什么是 `BIO`、`NIO`、`AIO`

| BIO--Blocking IO | 同步阻塞IO（一个连接一个线程，发起请求一直阻塞，一般通过连接池改善） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047025.png) |
|--- | --- | --- |
| NIO--Non-blocking IO | 同步非阻塞IO（多个连接复用一个线程，一个请求一个线程） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047309.png) |
| AIO--Asynchronous IO | 异步非阻塞IO（一个有效请求一个线程，IO请求立即返回，操作结束后，回调通知） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047677.png) |

## 先看维基百科

>  怎么理解 `BIO`、`NIO`、`AIO`

![image-20240103104047227](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202401031040804.png)

## 我的理解

**同步阻塞与同步非阻塞**的区别，我们举个例子来说明：
    同步阻塞：鲁智深**排队**（阻塞）打酒，时不时问小二，**等着酒**（同步）被盛好；
    异步阻塞：鲁智深**排队**（阻塞）打酒，**等着叫号机器或者大屏通知**（异步）响应；
    同步不阻塞：鲁智深酒馆打酒，**坐着玩手机**（不阻塞），时不时问小二，**等着酒**（同步）被盛好；
    异步不阻塞：鲁智深酒馆打酒，**坐着玩手机**（不阻塞），**等着叫号机器或者大屏通知**（异步）响应

**同步与异步**的区别在于
    同步：请求与响应同时进行，直到响应再返回结果；
    异步：请求直接返回空结果，不会立即响应，但一定会有响应，通过通知（叫号机）、状态（大屏通知）、回调函数响应

**阻塞与非阻塞**的区别在于
    阻塞：请求后一直等待
    非阻塞：请求后，可以继续干其他事，直到响应


> 知识扩展
1. IO流体系结构

![](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047942.jpeg)