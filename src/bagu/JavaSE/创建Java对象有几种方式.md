> Java创建对象的几种方式？

1. new

2. 反射

3. clone

4. 序列化

   

> 怎么理解反射？

通过new来创建对象就是正射，是在编译时就会确定创建的对象类型；而反射就是动态地获取类信息、构造器进而`newInstance`创建对象的过程。

> 怎么通过反射来创建一个对象？

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

