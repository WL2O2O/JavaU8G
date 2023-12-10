用命令行给本仓库提交代码步骤：
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
    $ git commit -m "你的提交信息" （替换引号中内容，引号保留）
    ```

4. 推送代码到远程`GitHub`协作仓库

    ```bash
    $ git push origin master
    ```

5. 等三分钟左右，刷新页面看是否更新





> ⭐⭐⭐注意事项：
> 

Q：为什么我提交代码出现了 reject 被拒绝？

A：因为是多人协作仓库，可能在你上传的时候，本地版本不一致，为了避免冲突，在此步骤`1. 更改已有的文件内容或者新增文件`之前需要增加`拉取仓库最新内容`的步骤：

```bash
# 命令解释：拉取 master 分支最新内容     origin：分支标记，master：分支名
$ git pull origin master
```

只要简历上写熟练使用 git ，一般都会问如何解决 git 冲突，下面说一下解决方案👇

解决冲突的方案：
1. 最简单的：手动解决。重复第一步，先拉取仓库最新内容，然后文件中会出现需要手动解决冲突的内容，手动删改，然后再提交
2. 学一下其他命令，例如 git checkout、git reset、git reverse



参考文献：

[git 命令可视化学习](https://learngitbranching.js.org/?locale=zh_CN)

[git 常用命令汇总](https://wl2o2o.github.io/2022/10/07/git/)