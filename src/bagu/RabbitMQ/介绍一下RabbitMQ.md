# 介绍一下`RabbitMQ`？

`RabbitMQ`就是一个实现了一个AMQP协议的开源消息代理软件，即高级消息队列协议（Advance Message Queen Protocol），`RabbitMQ`的服务器是由`ErLang`语言编写的，故拥有高性能、健壮、可伸缩性的优点。

# 了解`RabbitMQ`的架构吗？

![RabbitMQ架构图](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202401071311045.png)

- Producer：生产者
- Consumer：消费者
- V-host：虚拟主机
- Exchange：交换机
- Queen：消息队列

# 在你的项目中为什么不用RocketMQ？

首先，`RabbitMQ`是支持多种语言的，并且可以设置任意时长的TTL存活时间，另外还有一个可视化管理页面，可以更加清晰的检查消息的生产与消费，其次，我更加熟悉`RabbitMQ`的使用，比如怎么做消息分发、如何实现延迟消息队列、配置死信队列等等（抛出话题，指引方向）

# 消息分发

消息分发方式？

# 怎么配置死信队列

架构图？



