@echo off

D:

cd D:\IDEAProject\JavaU8G

echo "trucking files"

git add .

echo "trucking files over"

echo "commit files"

git commit -m "feat: auto upload"

echo "commit over"

echo "push to github"

git push origin master

@REM 如果有需要推送至其他仓库，自行打开注释并修改。 @REM 是 bat 文件的注释
@REM echo "push to another repository"
@REM git push origin2 master

timeout /t 3