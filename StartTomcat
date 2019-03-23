@echo off
color 2e
mode con cols=72 lines=32
:start
echo ------------------------------------
echo *
echo *	author Rukawalee
echo *	快速启动Tomcat服务
echo *
echo * 	注意：仅适用于目录
echo *	第一次使用需要设置Tomcat路径
::echo *	madetime：2019.03.19
echo *	version：Final
echo * 	
echo ------------------------------------
if exist pt.plist for /f "tokens=* delims=" %%i in (pt.plist) do set web=%%i& goto end
echo 请输入Tomcat文件目录(可拖入或粘贴，拖入请注意去掉"双引号")：
set /p web=
echo %web%>>pt.plist
attrib +h +r pt.plist
cls
goto start
:end
set /p m=1、启动Tomcat  2、关闭Tomcat  3、删除配置文件：

if "%m%"=="1" start /d "%web%\bin" startup.bat
if "%m%"=="2" start /d "%web%\bin" shutdown.bat
if "%m%"=="3" attrib -h -r pt.plist & del /q pt.plist

exit
