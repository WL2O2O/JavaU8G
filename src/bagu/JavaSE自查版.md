## Java概述

> 什么是 Java 语言？

Java 语言是一门面向对象的编程语言，不仅吸收了 C++ 语言的各种优点，还舍弃了 C++ 中难以理解的多继承以及指针的概念，因此 Java 语言功能强大且简单易用。Java 语言很好的实现了面向对象的思想，因此支持我们以优雅的思维方式进行复杂的编程。

> Java 语言的特点？

1. 面向对象
2. 平台无关
3. 编译与解释并行
4. 支持多线程



> JVM、JDK、JRE？

JVM -- Java 虚拟机
JRK -- Java 开发工具包
JRE -- Java 运行环境

三者之间的关系是：JDK > JRE > JVM

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

> 什么是多态？

多态就是，对于同一个父类，指向不同子类对象的同一个行为，运行出来结果不同。

> 怎么理解多态？

例如伪代码：

```java
class Animals {
    public void sleep() {
        sout("坐着睡！");
    }
}

class Dog extends Animals {
    @Override
    public void sleep() {
        sout("站立着睡！");
    }
}

class Cat extends Animals {
    @Override
    public void sleep() {
        sout("睁眼睡！");
    }
}
// 同一个父类 Animals，指向不同子类 Dog、Cat
Animals animals1 = new Dog();
Animals animals2 = new Cat();
```

对于`animals1.sleep()`和`animals2.sleep()`，最后运行出来可能会有不用的结果，但是这取决于几个条件：

- 继承类或实现接口

- 子类重写方法

- 同一个父类，指向不同子类

> 重载与重写什么区别？

引用 Wiki 百科：

> ## 函数重载规则
>
> - 多个函数定义使用相同的函数名称
> - 函数参数的数量或类型必须有区别
>
> 函数重载是静态多态的一种类别，其使用某种“最佳匹配”算法解析函数调用，通过找到形式参数类型与实际参数类型的最佳匹配来解析要调用的具体函数。该算法的细节因语言而异。
>
> 函数重载通常与[静态类型](https://zh.wikipedia.org/wiki/類型系統)编程语言（在[函数调用](https://zh.wikipedia.org/wiki/子程序)中强制执行[类型检查](https://zh.wikipedia.org/wiki/類型系統#型別檢查)）有关。重载函数实际上只是一组具有相同名称的不同函数。具体调用使用哪个函数是在[**编译期**](https://zh.wikipedia.org/wiki/编译期)决定的。
>
> 在 [Java](https://zh.wikipedia.org/wiki/Java) 中，函数重载也被称为编译时多态和静态多态。
>
> 函数重载不应与在运行时进行选择的[多态](https://zh.wikipedia.org/wiki/多态_(计算机科学))形式混淆，例如通过[虚函数](https://zh.wikipedia.org/wiki/虚函数)而不是静态函数。



因此我们大概明白：

- 重载是编译时重载的，编译时根据参数，决定调用哪个方法
- 重写是运行期重写的，运行时根据父类指向的子类，调用方法



**总结：**

重载和重写都是多态的体现，维基百科中也有说明[多态分为动态多态和静态多态](https://zh.wikipedia.org/wiki/%E5%A4%9A%E6%80%81_(%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%A7%91%E5%AD%A6))

如图：

![image-20231214103612773](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312141036730.png)



那么我们不妨理解为重载为静态动态（编译器决定）、重写为运行期决定的，为动态多态。





3. `==`与`equals`的区别？

4. 重写过`equals`和`hashcode`吗？为什么要重写？

5. 解释一下深拷贝和浅拷贝。

> 6. Java创建对象的几种方式？

1. new

2. 反射

3. clone

4. 序列化

   

**怎么理解反射**？

通过new来创建对象就是正射，是在编译时就会确定创建的对象类型；而反射就是动态地获取类信息、构造器进而`newInstance`创建对象的过程。

**怎么通过反射来创建一个对象**？

无参实例化：

`Object obj = Class.forName(类名).getConstructor().newInstance();`

有参实例化：

`Object obj = Class.forName(类名).getConstructor(String.class).newInstance("汪汪");`

```java
public class Main {  
    public static void main(String[] args) {  
        try {  
            // 获取Dog类的Class对象  
            Class<?> dogClass = Class.forName("Dog");  
  
            // 获取Dog类的构造器  
            Constructor<?> dogConstructor = dogClass.getConstructor();  
  
            // 通过构造器创建Dog对象  
            Object dog = dogConstructor.newInstance();  
  
            // 如果需要初始化参数，可以使用带有参数的构造函数  
            Constructor<?> dogConstructorWithParams = dogClass.getConstructor(String.class);  
            Object dogWithName = dogConstructorWithParams.newInstance("旺财");  
  
        } catch (ClassNotFoundException | NoSuchMethodException | IllegalAccessException | InstantiationException | InvocationTargetException e) {  
            e.printStackTrace();  
        }  
    }  
}  
class Dog {  
    private String name;  
  
    public Dog() {  
        name = "小黄学长";  
    }  
  
    public Dog(String name) {  
        this.name = name;  
    }  
  
    public String getName() { 
        return name;  
    }  
}
```



## String

1. 说说`String`，是基本数据类型吗？



> 2. String、StringBuffer、StringBuilder有什么区别？

**区别：**

1. `String`类是不可变的，`StringBuilder`和`StringBuffer`是可变的;
2. `StringBuffer`是线程安全的



**知识扩展：**

`StringBuffer`为什么是线程安全的？



3. 了解`intern`方法吗？

4. String 是如何保持不可变的？（源码 Final 类）

## Integer

1. String怎么转Integer？原理？

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

1. 说说你对`HashMap`数据结构的理解？

> `HashMap`数据结构

首先，hashmap 的数据结构是基于数组和链表的，如图：

![img](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312070046177.png)

so，既然是基于数组和链表的，那就说明数组和链表的特点也就是 HashMap 的特点：

**数组：寻址快，直接根据索引访问元素，插入和删除慢；**

**链表：寻址慢，需要从头节点开始遍历，插入和删除快。**



说到 HashMap 就要说到 Java 8 了，Java 8 之前，HashMap 使用一个数组加链表的结构来存储 【K，V】 键值对。

如果发生 hash 冲突，那么

这将导致在处理 hash 冲突的时候性能不高，尤其是链表很长的时候。因此，Java 8 中的 HashMap 引入了红黑树来替代链表，这样当链表变长的时候，会自动转换为红黑树，从而提高了增删改查的性能。



2. 什么是 Hash 冲突？怎么解决？

> 什么是 Hash 冲突



> 怎么解决？

2. 为什么阿里巴巴Java开发者手册中有一条建议是**强制禁止**使用构造方法把 BigDecimal(double) 的方式把 double 的值转化为 BigDecimal 对象？

> 说明：因为会存在精度损失风险，如：BigDecimal(0.1F)，实际存储值为0.10000000149，
>
> 正确的方法应该怎么做？
>
> 一：String入参：BigDecimal bd = new BigDecimal("0.1")
>
> 二：使用内部的 valueOf 方法：BigDecimal bd1 = BigDecimal.valueOf(0.1);
