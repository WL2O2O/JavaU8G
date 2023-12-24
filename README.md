## ⭐仓库提交代码步骤：

0. 选择本地电脑上一个文件夹，克隆仓库内容到文件夹中

     ```bash
     # 本处使用 ssh 协议，如未配置，需要先配置本地密钥到GitHub
     # 参考链接：https://blog.csdn.net/W_317/article/details/106518894
     $ git clone git@github.com:WL2O2O/JavaU8G.git
     ```

1. 更改已有的文件内容或者新增文件

     > 增加文件之后不要忘记在 src 文件夹中的 SUMMARY.md 目录文件中新增，否则索引不到，也就不会在网站中显示了。

2. 本地仓库跟踪文件

    ```bash
    $ git add . 
    ```

3. 提交代码到本地仓库

    ```bash
    $ git commit -m "你的提交信息"
    ```

4. 推送代码到远程`GitHub`协作仓库

    ```bash
    $ git push origin master
    ```

5. 等三分钟左右，刷新页面看是否更新



## ⭐便捷脚本：

本仓库根目录中提供了一键 pull 和一键 upload 的脚本，因为多人协作为了便捷未设多分支结构进行管理，所以为了以防忘记拉取远仓最新代码，可以使用脚本文件进行点击式操作。

![git脚本](https://cs-wlei224.obs.cn-south-1.myhuaweicloud.com/blog-imgs/202312242058900.png)

使用步骤：

1. 双击`autoPull.bat`
2. 修改或者新增文件
3. 双击`autoUpload.bat`



 ## ⭐注意事项：

Q：为什么我提交代码出现了 reject 被拒绝？

A：因为是多人协作仓库，可能在你上传的时候，本地版本不一致，为了避免冲突，在此步骤`1. 更改已有的文件内容或者新增文件`之前需要增加`拉取仓库最新内容`的步骤，为了便捷这一操作，可以直接双击`autoPull.bat`脚本文件进行一键拉取，或者命令：

```bash
# 命令解释：拉取 master 分支最新内容     origin：分支标记，master：分支名
$ git pull origin master
```

只要简历上写熟练使用 git ，一般都会问如何解决 git 冲突，下面说一下解决方案👇

✨**冲突原因分析：**

​	A 与 B 同时协作，A 更新了文件`Test.md`，然后 B 在本地也更新了文件`Test.md`，此时 A 并不知道，在进行 push 操作时被 reject。注意：新增的文件不会导致冲突，除非重名，所以发生冲突一般是更新导致的。

✨**解决冲突的方案：**

1. 最简单的——手动解决：不用变动刚才自己修改的内容，先拉取仓库最新内容，然后文件中会出现需要手动解决冲突的内容标记，手动选择删改，然后再 push
2. 取消更改文件内容——命令：复制自己更新的文件内容（方便解决冲突后再次粘贴），`git checkout fileName.md`取消对某冲突文件的更改 --> `git pull origin master`拉取最新内容 --> 再次更新文件 --> 推送更新



✨**如何回滚代码：**

​	一般文件的生命周期：内容修改 --> commit 到本地分支 --> push 到远仓

 1. 对于已修改，但未 commit 文件的回滚：可以使用`git checkout fileName.md`取消对文件的更改

 2. 对于已修改，已 commit或者push 文件的回滚：

    ```bash
    # 查看 git 日志的提交记录的32位 hash 值
    $ git log
    
    # 回退提交，以 hash 值为 1234 为例（正常是32位）
    $ git revert 1234 或者 git reset --hard 1234
    
    revert 会保留更改文件的历史记录，创建一条新的记录，reset 是强制回退，彻底的回到指定的版本，reset 有三种模式可以选择：soft、mixed（默认）、hard（常用）
    
    --soft模式会重置指针，但不会修改工作目录或索引。这意味着之前的更改仍
    然存在于工作区中，并且可以重新提交。
    
    --mixed模式是默认模式，它重置指针并更新索引以匹配指定的提交。这将取消索引中的所有更改，但工作目录中的更改将保留。
    
    --hard模式会重置指针，索引和工作区。这意味着所有更改都将永久删除，并
    且没有办法澈销或恢复这些更改。
    ```

    

参考文献：

[git 命令可视化学习](https://learngitbranching.js.org/?locale=zh_CN)

[git 常用命令汇总](https://wl2o2o.github.io/2022/10/07/git/)