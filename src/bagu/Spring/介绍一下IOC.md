## 什么是`IOC`？

### 维基百科介绍

![image-20231225093856709](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312250938801.png)

### 我的理解

> IOC？控制怎么实现反转了？

`IOC`-- `Inversion Of Control`即控制反转，就是把`Bean`创建流程的控制权（也就是创建对象的过程）交给了`Spring`来进行管理，降低代码间的耦合度。



> 实现`IOC`的方式有两种：

依赖注入-`DI--Dependency Injection`和依赖查找-`DL--Dependency Lookup`



> 技术描述：

例如：

```Java
class 张三 {
}
class 李四 {
	// 需要手动 new 出来
	张三 zs = new 张三();
}
```

```Java
// 通过注解，把 Bean 注入 Spring 容器
@Component
class 张三 {
}
class 李四 {
	// 因为张三的 Bean 已注入容器中，所以可以直接取出使用
	@Autowire
	private 张三 zs;
}
```

因此，控制反转就是：本来是代码中 new 出一个对象，代码拥有控制权，然后在 Spring 中，通过`@Component`注解，把类表示为`Spring`的一个组件，被标记的类就会被`Spring`自动扫描，然后作为`Bean`注册到`Spring`的`IOC`容器中。然后控制权就交给了`Spring`，随用随取。


