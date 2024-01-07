# 什么是ThreadLocal？

> 维基百科

![ThreadLocal 介绍](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312300934607.png)

> 我的理解

`ThreadLocal`是`java.lang`下面的一个类，是用来解决多线程中的并发问题。实际上它就是一个线程内的一个局部变量。比如可以存放一些线程安全的相关变量，用于线程内共享，线程之间互斥。这样其他线程进行访问，发现与变量中存放的信息不一致，于是就达到了解决并发的问题。

`ThreadLocal`中的四个方法：
- initValue
- get
- set
- remove

> 应用场景

1. 用户信息存储

    在项目中的大多时候，都需要对用户进行鉴权，此时，我们可以将用户的信息放在`ThreadLocal`中，有需要时取，很方便！
2. 线程安全

    由于`ThreadLocal`的隔离特性，加上一些并发安全处理的变量并不是线程安全的，所以，我们可以把这些变量配合它进行使用，这样就达到了线程安全的目的。
    例如：`SimpleDataFormat`变量。

3. PageHelper分页

    这个是`MyBatis`提供的分页插件。我们在代码中设置的分页参数、页码、页大小的信息都会存储于`ThreadLocal`中，方便执行分页对其进行读取。

4. 日志上下文存储

5. traceid存储

6. 数据库Session


> 总结

主要就是两个作用：

1. 线程安全
2. 进程内读取、传递信息 