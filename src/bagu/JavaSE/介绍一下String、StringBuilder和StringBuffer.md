## 介绍一下String、StringBuilder和StringBuffer

> 对比之类的问题，要先说区别

1. `String`类是不可变的，`StringBuffer`和`StringBuilder`是可变的;
2. `String`和`StringBuffer`是线程安全的，`StringBuilder`是非安全的；

> 知识扩展：

- `String`为什么不可变？

  因为我们通过源码可以看出，`String`类是通过`final`关键字来修饰的，这就意味着他不能够被继承，不能被重写方法，所以是不可变的。
  那么为什么我们平时用到的`concat`、`trim`等等方法，不都改变了`String`的值了吗？
  其实不然，我们虽然改变了其值，但是其实是创建了一个新的对象，并没有改变其值。

- `StringBuffer`为什么是线程安全的？

  StringBuffer和StringBuilder很类似，最大的区别就在于StringBuffer是线程安全的，由源码中StringBuffer中的`append`方法源码修饰符`synchronized`足以看出该方法是线程安全的。

  ![StringBuffer源码](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312291315245.png)







