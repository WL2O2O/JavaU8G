## 什么是`AOP`？

### 维基百科介绍

![image-20231225093104780](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312250931397.png)

### 我的理解

> 什么是`AOP`？

简单来说，`AOP`就是为了更加优雅的编写业务、专注于业务开发、增加代码可读性，将一些具有某种功能的代码抽取出来，然后通过`Spring AOP`注解的形式注入使用。

> 怎么实现？

`AOP`的相关注解：

| 注解            | 含义                                                         |
| --------------- | ------------------------------------------------------------ |
| @Aspect         | 定义切面类                                                   |
| @Pointcut       | 定义切入点，表示在哪些连接点上切入执行增强操作               |
| @Before         | 表示在目标方法执行**之前**执行增强操作                       |
| @After          | 表示在目标方法执行**之后**（**无论是否发生异常**）执行增强操作 |
| @AfterReturning | 在目标方法执行之后（**正常返回时**）执行增强操作             |
| @AfterThrowing  | 在目标方法执行之后（**发生异常时**）执行增强操作             |
| @Around         | 包围目标方法，可以在执行前后自定义增强操作                   |
| @DeclareParents | 引入新的接口到目标对象                                       |

> 这些注解可以与其他Spring注解一起使用，例如`@Component`、`@Service`、`@Controller`等，以实现对特定方法或类的增强操作。通过使用这些注解，您可以在不修改原始代码的情况下，将横切关注点（例如日志记录、事务管理等）模块化地应用到应用程序中的不同部分。

> 实例：
>
> 假设我们有一个 `UserService` 接口和一个 `UserServiceImpl` 类，现在我们想要在 `createUser` 方法执行前后添加日志记录的功能。
>
> ```java
> public interface UserService {
>     void createUser(String username, String password);
> }
> 
> public class UserServiceImpl implements UserService {
>     public void createUser(String username, String password) {
>         // 创建用户的实现逻辑
>     }
> }
> ```
>
> 创建一个切面类，并在切面类的方法上使用 `@Around` 注解来定义环绕通知：
>
> ```java
> @Aspect
> @Component
> public class LoggingAspect {
> 
>     private static final Logger logger = LoggerFactory.getLogger(LoggingAspect.class);
> 
>     @Around("execution(* com.example.service.UserService.createUser(..))")
>     public Object logMethodExecution(ProceedingJoinPoint joinPoint) throws Throwable {
>         String methodName = joinPoint.getSignature().getName();
>         logger.info("Executing method: {}", methodName);
> 
>         // 执行目标方法
>         Object result = joinPoint.proceed();
> 
>         logger.info("Method {} executed successfully", methodName);
>         return result;
>     }
> }
> ```
>
> 

### 知识扩展

> 这行代码怎么理解？`execution(* com.example.service.*.*(..))`

`execution(* com.example.service.*.*(..))` 是一个切入点表达式（Pointcut Expression），它用于指定切入点的位置。

切入点表达式由以下几部分组成：

- `execution`: 指定切入点类型为方法执行。
- `*`: 匹配任意返回类型的方法。
- `com.example.service`: 指定目标方法所在的包路径。
- `*.*`: 第一个`*`表示任意类名，第二个`*`表示任意方法名。
- `(..)`: 匹配任意参数类型和数量的方法参数。

所以，`execution(* com.example.service.*.*(..))` 表示匹配 `com.example.service` 包下任意类的任意方法，并且方法的参数可以是任意类型和数量。



> 实际业务中经常使用`AOP`的示例：日志记录和事务管理的结合

```java
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Aspect
@Component
public class LoggingAndTransactionalAspect {

    private static final Logger logger = LoggerFactory.getLogger(LoggingAndTransactionalAspect.class);

    @Before("execution(* com.example.service.*.*(..))")
    public void logBefore(JoinPoint joinPoint) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        logger.info("Executing method {} in class {}", methodName, className);
    }

    @AfterReturning(value = "execution(* com.example.service.*.*(..))", returning = "result")
    @Transactional
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        String methodName = joinPoint.getSignature().getName();
        String className = joinPoint.getTarget().getClass().getSimpleName();
        logger.info("Method {} in class {} executed successfully. Result: {}", methodName, className, result);
    }
}
```

增加了`@Transactional`注解。这意味着在目标方法执行后，会自动开启事务并提交事务。这样，我们就实现了日志记录和事务管理的结合。