# `Java面试通关秘籍` —— `Java_Useful_8股文_Guide`
🚀 项目简介

本项目`Java_Useful_8股文_Guide`致力于打造一个全面且实用的`Java技术与面试指南`，涵盖了从`Java`基础知识到高级实践应用的广泛领域，包括但不限于`Java面试`、`算法`、`JavaSE`、`并发编程`、`JVM优化`、`MySQL`、`OS`、`中间件`、`微服务`等核心知识点，以及`Spring全家桶`及`设计模式`等内容。

📚 主要内容（Plan）

`JavaSE`：深入浅出地讲解Java语言的基础概念与进阶特性。
`JUC`：收录大量并发实例代码及分析，帮助你掌握多线程开发技巧。
`JVM`：提供详尽的JVM原理介绍与实际调优案例，助你成为JVM调优专家。
`DesignPatterns`：总结常用的设计模式及其应用场景，提升你的软件设计能力。
`SpringFrames`：全面解读Spring家族各组件及其实战用法，增强你在企业级开发中的竞争力。
`JavaInterview`：汇总各类Java面试题目的解析与讨论，为你准备面试保驾护航。

🔍 SEO优化与查找便利性（Plan）

我们特别关注了搜索引擎优化（SEO），确保您在搜索“Java面试准备”、“Java核心技术”、“并发编程实例”、“JVM调优实践”、“Spring框架详解”等相关关键词时，能够迅速找到并利用这份宝贵的资源。

🌱 更新维护

为了持续提供优质内容，本项目将坚持每日或每周定期更新，及时跟进最新的Java技术和面试趋势。我们也诚挚邀请社区成员参与贡献，通过Pull Request（PR）的方式分享您的知识和经验。

🌟 互动与参与

欢迎各位开发者关注此项目、点赞（Star）以示支持，并积极参与讨论与共建。让我们携手为Java开发者社群创造一份高质量、持续更新的知识宝典！

如何参与？
点击右上角的 Star 按钮关注项目进展。
通过 Fork 功能复制项目到自己的GitHub账户，对内容进行修改后发起 Pull Request。
在 Issues 区域提出问题、建议或者分享新的面试题目与解析。

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

    

## 本地已经推送到远程，但是想修改`Github`提交信息，怎么操作

如果你已经将更改推送（push）到了远程仓库，并且想要修改提交信息，你可以使用git rebase命令来交互式地修改历史提交。以下是一般步骤：

1. 谨慎操作：修改已经推送到远程仓库的提交是一个敏感操作。如果你正在与他人合作，或者你的仓库是公开的，修改历史提交可能会给其他人带来困扰。确保你了解潜在的风险，并通知与你一起工作的其他人。

2. 确保工作区是干净的：在开始之前，确保你的工作区没有任何未提交的更改。你可以使用git status来检查。如果有未提交的更改，请提交或暂存它们。

3. 执行交互式 rebase：

```bash
git rebase -i HEAD~n
```

这里的 n 是你想要修改的提交数量。例如，如果你想要修改最近的3个提交，你可以使用`git rebase -i HEAD~3`

4. 修改提交信息：这会打开一个交互式界面，列出了你选定的最近的n个提交。对于每个提交，前面都有一个pick命令。找到你想要修改提交信息的那一行，将pick改为reword（或者简写为r）。
5. 保存并关闭编辑器。对于每个标记为reword的提交，Git会依次打开编辑器让你修改提交信息。修改后保存并关闭编辑器。
6. 完成 rebase：在修改了所有想要的提交信息后，rebase操作会继续进行，并创建新的提交以替代旧的提交。
7. 强制推送到远程仓库：由于你修改了历史提交，你需要使用强制推送（force push）来更新远程仓库：

```bash
git push origin $your-branch-name$ -f
```

将 your-branch-name 替换为你正在工作的分支名。

注意：强制推送会覆盖远程仓库的历史记录，因此请确保你了解这一操作的后果，并通知与你一起工作的其他人。

## 提交了代码到`GitHub`，但是提交错了，怎么办？

**一、 很简单，如果你不在意`Github`的commit记录，那么你可以直接修改，再次提交。**
**二、 你不想远程commit中显示了多次提交记录，那么你可以：**
采取以下步骤来删除本次本地提交并重新推送的代码：（远程会同步删除提交）

1. 打开命令行终端（如Git Bash、Terminal等）。
2. 导航到你的本地仓库所在的目录。
3. 执行以下命令来撤销本次提交：

```shell
git reset --soft HEAD~1
```

这个命令会将你的HEAD指针回退到上一次提交，但是保留了工作区的修改。也就是说，你撤销了本次提交，但是修改后的代码仍然保留在你的本地仓库中。

4. 现在你可以修改代码，使用`git add`命令将修改后的文件添加到暂存区，然后使用`git commit`命令重新提交：

```shell
git add <modified_files>  
git commit -m "Fixed issues and re-committed"
```

这里的`<modified_files>`是你修改后的文件路径或文件名。`-m`选项后面跟的是提交信息，你可以根据实际情况自行填写。

5. 最后，将修改后的代码推送到GitHub：

```shell
git push origin <branch_name>
```

这里的`<branch_name>`是你当前所在的分支名称，例如`main`或`develop`。

这样，你就成功地删除了错误的提交并重新提交了修改后的代码。请确保在执行这些操作之前已经备份了重要的文件和数据。

## 我想合并`GitHub`的多个`commit`记录，怎么办？

如果你想在GitHub上只显示一个提交，你可以使用`git rebase`命令来合并多个提交为一个提交。以下是一个简单的步骤：

1. 打开命令行终端（如Git Bash、Terminal等）。
2. 导航到你的本地仓库所在的目录。
3. 执行以下命令来将多个提交合并为一个提交：

```shell
git rebase -i HEAD~<number_of_commits>
```

这里的`<number_of_commits>`是你想要合并的提交数量。例如，如果你想要合并最近的3个提交，可以输入`HEAD~3`。

4. 执行上述命令后，你将进入一个交互式界面，列出你想要合并的提交。在文件中，将需要保留的提交前面的`pick`改为`squash`或`s`。保留你想要合并的提交，将其他的提交合并到其中一个提交中。
5. 保存并关闭文件后，Git会重新构建提交历史，将多个提交合并为一个提交。
6. 在合并完成后，使用以下命令将修改后的代码推送到GitHub：

```shell
git push origin <branch_name> --force
```

这里的`<branch_name>`是你当前所在的分支名称，例如`main`或`develop`。

通过以上步骤，你可以将多个提交合并为一个提交，只显示一个提交记录在GitHub上。请确保在执行这些操作之前已经备份了重要的文件和数据。





参考文献：

[git 命令可视化学习](https://learngitbranching.js.org/?locale=zh_CN)

[git 常用命令汇总](https://wl2o2o.github.io/2022/10/07/git/) 