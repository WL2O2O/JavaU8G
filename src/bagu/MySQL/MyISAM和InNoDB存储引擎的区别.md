# MyISAM和InNoDB有什么区别

## 维基百科介绍

![MyISAM与InNoDB的介绍与对比](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312230954357.png)

## 我的理解

`MyISAM`与`InNoDB`的分界点在于`MySQL`的`5.5版本`，5.5之后，随着不断追求高并发与事务，就逐渐取代了`MyISAM`存储引擎。

|          |      MyISAM      |       InNoDB        |
| :------: | :--------------: | :-----------------: |
|   事务   |        🚫         |          ✔️          |
|   索引   |    非聚焦索引    |      聚焦索引       |
|   外键   |        🚫         |          ✔️          |
| 最小粒度 |       表锁       |        行锁         |
|   行数   | 保存，可直接读取 | 不保存，需要`count` |



> `MySQL`有几种存储引擎？

1. MyISAM
2. InNoDB
3. MEMORY
4. ······