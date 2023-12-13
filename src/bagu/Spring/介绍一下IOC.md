> 怎么理解 Spring 中的控制反转？控制怎么反转了？

控制反转即`IOC`-- `Inversion Of Control`，顾名思义，就是`Bean`的控制权交给了 Spring 来进行管理，也就是对象的控制权。

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

因此，控制反转就是：本来是代码中 new 出一个对象，代码拥有控制权，然后在 Spring 中，通过`@Component`注解，把类表示为 Spring 的一个组件，被标记的类就会被 Spring 自动扫描，然后作为 Bean 注册到 Spring 的 IOC 容器中。然后控制权就交给了 Spring ，随用随取。



> IOC 还有什么优点？





> IOC 是如何实现的？