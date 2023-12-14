## Java概述

什么是 Java 语言？



Java 语言的特点？



JVM、JDK、JRE？

## Java基础

1. Java有几种数据类型？分别是哪些？
2. 怎么理解`&`和`&&`
3. 自增运算是怎么理解的？
```java
int i  = 1;
i = i++;
System.out.println(i);
```
## 面向对象

1. 什么是面向对象？有哪些特性？
2. 什么是多态？怎么理解多态？
3. `==`与`equals`的区别？
4. 重写过`equals`和`hashcode`吗？为什么要重写？
5. 解释一下深拷贝和浅拷贝。
6. Java创建对象的几种方式？

## String

1. 说说`String`，是基本数据类型吗？
2. String、StringBuffer、StringBuilder有什么区别？
3. 了解`intern`方法吗？
4. String 是如何保持不可变的？（源码 Final 类）

## Integer

1. String怎么转Integer？原理？
1. 

## Object

1. 了解过`Object`类吗？都有什么方法？你怎么理解`finalize`方法？

![](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047276.png)

2. 


## 异常处理

1. Java中的异常体系

![](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047393.png)

2. 怎么处理异常？
   1. 捕获try{}catch{}finalize{}
   2. 抛出throw、throws
## I/O



| BIO--Blocking IO | 同步阻塞IO（一个连接一个线程，发起请求一直阻塞，一般通过连接池改善） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047025.png) |
|--- | --- | --- |
| NIO--Non-blocking IO | 同步非阻塞IO（多个连接复用一个线程，一个请求一个线程） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047309.png) |
| AIO--Asynchronous IO | 异步非阻塞IO（一个有效请求一个线程，IO请求立即返回，操作结束后，回调通知） | ![image.png](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047677.png) |



1. IO流体系结构

![](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070047942.jpeg)

2. 什么是装饰器模式？
> 我对装饰器的理解就是继承，然后增加新功能，但它们的核心区别在于装饰器模式是通过“添加”新的功能，而不是通过“重写”原有功能来实现扩展的。

在IO流中，这种模式被广泛应用。例如，在java.io包中，InputStream和OutputStream是两个基础的输入输出流类，它们定义了输入输出流的基本行为和接口。然后，有许多其他的类和接口继承自InputStream和OutputStream，并添加了新的功能。这些新类可以看作是装饰器，它们可以增强原有类（被装饰类）的功能。例如，BufferedInputStream和BufferedOutputStream可以在原有类的基础上添加缓冲功能，提高IO性能。
总的来说，装饰器模式是一种灵活且强大的设计模式，它允许我们在运行时动态地添加或删除功能，而无需修改原始的类。这种设计模式提高了代码的复用性和可扩展性。
_**手撸装饰器模式：**_

```java
public interface Printer {
    void print();
}

public class StandardPrinter implements Printer {
    @Overvide
    public void print() {
        System.out.println("Standard print!");
    }
}

public class ColorPrinter implements Printer {
    private Printer printer;

    public ColorPrinter(Printer printer){
        this.printer = printer;
    }

    @Overvide
    public void print() {
        System.out.print("Color print!");
        Printer.print();
    }
}

public class Main {
    public static void main(String[] args) {
        Printer sPrinter = new StandardPrinter();
        sPrinter = new ColorPrinter(sPrinter);
        sPrinter.print();
    } 
}
```

## 序列化

1. 什么是序列化与反序列化
2. 序列化有哪几种方式？
   1. Java对象流序列化

一般会用Java原生IO 进行转化，一般会用ObjectIO

   2. JSON序列化

JSON序列化的方式有很多，一般会选择使用`jackson`包中的`ObjectMapper`类来将Java对象转化为byte数组或将json串转化为对象

   3. ProtoBuff序列化

是一种轻便高效的结构化数据存储格式，通过其序列化对象可以很大程度的把对象进行压缩，大大减小数据传输大小，提高性能。

## 泛型

1. 什么是泛型？
2. 什么是类型擦除？为什么要擦除？
3. 为什么泛型不可以被重载？

## 注解

1. 什么是注解？注解的生命周期？
2. 说说`@Override`和`@Autowired`的源码

## 反射

1. 怎么理解反射？

2. 怎么通过反射来创建一个对象？

## 源码

1. 说说你对 HashMap 数据结构的理解？



2. 什么是 Hash 冲突？怎么解决？
3. 为什么阿里巴巴Java开发者手册中有一条建议是**强制禁止**使用构造方法把 BigDecimal(double) 的方式把 double 的值转化为 BigDecimal 对象？

> 说明：因为会存在精度损失风险，如：BigDecimal(0.1F)，实际存储值为0.10000000149，
>
> 正确的方法应该怎么做？
>
> 一：String入参：BigDecimal bd = new BigDecimal("0.1")
>
> 二：使用内部的 valueOf 方法：BigDecimal bd1 = BigDecimal.valueOf(0.1);
