## docker相关

```bash
# 拉取镜像
$ docker pull [镜像名称] [版本]

# 查看已安装镜像
$ docker images

# 创建和启动容器，因为懒的配置，所以使用默认配置
$ docker run -itd --name redis -p 6379:6379 redis

# 查看运行中的CONTAINER
$ docker ps -a

# 进入指定的容器
$ docker exec -it mymongo /bin/bash

# 设置 docker 运行时容器自启动
$ docker update redis --restart=always 

# 查看docker 运行状态
$ systemctl status docker

# docker重启命令
$ systemctl restart docker
# 容器重启命令
$ docker restart redis(自己命的名字或者CONTAINER ID)

# 删除容器命令
$ docker rm [容器名]
# 删除镜像
$ docker rmi [镜像名]
```

### `Docker`安装`MySQL`例子：

```bash
$ docker pull mysql

# 在宿主机家目录创建用于放配置文件的文件夹
$ mkdir -p /root/docker-mysql/{conf,data,log}

# 在配置文件目录:/root/docker-mysql/conf新建一个my.cnf配置文件，写入下面内容，设置客户端和mysql服务器端编码都为utf8
[client]
default_character_set=utf8
[mysqld]
collation_server=utf8_general_ci
character_set_server=utf8

# 一套组合拳
$ docker run -p 3306:3306 \
--privileged=true \
-v /root/docker-mysql/log:/var/log/mysql \
-v /root/docker-mysql/data:/var/lib/mysql \
-v /root/docker-mysql/conf:/etc/mysql/conf.d \
-e MYSQL_ROOT_PASSWORD=你的MySQL密码 \
--name mysql \
--restart=always \
-d mysql

$ docker exec -it mysql bash

$ mysql -u root -p
```

## 防火墙相关

```bash
# 启动     
$ systemctl start firewalld
# 关闭     
$ systemctl stop firewalld
# 查看状态  
$ systemctl status firewalld
$ firewall-cmd --state

# 开机启用  
$ systemctl enable firewalld
# 开机禁用  
$ systemctl disable firewalld

# 查看端口  
$ firewall-cmd --list-ports         				--zone=public
	
# 添加端口（永久添加443端口,协议为tcp）
$ firewall-cmd --add-port=443/tcp   --permanent 

# 删除tcp下的80端口  
$ firewall-cmd --remove-port=80/tcp --permanent   --zone=public

# 重新加载  
$ firewall-cmd --reload
 
------------------------------------------------------------------------
 参数介绍：
 firewall-cmd：是Linux提供的操作firewall的一个工具
 --permanent：表示设置为持久；
 --add-port：标识添加的端口
 --remove-port:标识删除的端口
```

## 文件和目录操作相关

```bash
# ls: 列出当前目录下的文件和子目录
$ ls

# cd: 改变当前工作目录
$ cd [目录路径]

# mkdir: 创建一个新目录
$ mkdir [目录名称]

# rm: 删除文件或目录
$ rm [文件/目录路径]

# cp: 复制文件或目录
$ cp [源文件/目录路径] [目标路径]

# mv: 移动文件或目录
$ mv [源文件/目录路径] [目标路径]

# touch: 创建一个新文件或修改文件的时间戳
$ touch [文件名]

# cat: 查看文件的内容
$ cat [文件路径]

# grep: 在文件中查找指定的字符串
$ grep [要查找的字符串] [文件路径]

# du: 查看目录大小
$ du [目录路径]

# tar: 归档和压缩文件
# 创建 tar 压缩文档
$ tar -czvf [压缩文件名.tar.gz] [要压缩的文件/目录路径]

# 解压 tar 存档文件
$ tar -xzvf [压缩文件名.tar.gz]
```

## 系统状态和资源管理

```bash
# ps: 查看当前运行的进程
$ ps

# top: 查看CPU和内存使用情况
$ top

# free: 查看内存使用情况
$ free

# df -h: 查看文件系统使用情况
$ df -h

# ssh: 远程登录到另一台主机
$ ssh [用户名]@[主机地址]

# lsof -i: 端口占用情况
$ lsof -i
```

## 日志查看相关

```bash
# tail: 常用语查看日志文件
$ tail -n [行数] [文件路径]

# 查看实时日志
$ tail -f [文件路径]

# less: 查看大文件的内容，在less中，可以使用Page Up、Page Down、上下方向键等进行滚动和搜索。要退出less，可以使用q键。
$ less [文件路径]

# grep: 在日志文件中查找指定的字符串，eg：grep ERROR /var/log/myapp.log
$ grep [要查找的字符串] [日志文件路径]
```