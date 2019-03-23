@echo off
color 2e
mode con cols=72 lines=32
title made by Rukawalee
set web=
:start
echo ------------------------------------
echo *
echo *	author Rukawalee
echo *	请置于Java源程序盘下
echo *	
echo *	请将目录下文件放到同一目录
echo *	移植时轻移动目录文件
echo *	新增文件保存Tomcat路径
echo *
echo * 	注意：仅适用于目录
::echo *	批处理适用于Tomcat9
::echo *	madetime：2019.03.16
::echo *	updateTime: 2019.03.19
echo *	version：Final v2
echo * 	
echo ------------------------------------
if exist pt.plist (for /f "tokens=* delims=" %%i in (pt.plist) do set web=%%i) else goto setpt 
if "%web%" NEQ "" goto sc
:setpt
echo 请输入Tomcat文件目录(可拖入或粘贴，拖入请注意去掉"双引号")：
set /p web=
echo %web%>>pt.plist
attrib +h +r pt.plist
echo ------------------------------------
:sc
set classpath=%web%\lib\servlet-api.jar
echo 请输入Java源文件目录（可手动拖入源文件目录）：
set /p Jsrc=
for %%i in (%Jsrc%) do set f=%%~ni
javac %Jsrc%\%f%.java
if exist %Jsrc%\%f%.class (echo 编译%f%.java文件成功 & goto ok) else (goto end)
:ok
echo -----------------------------
pause
set webTom="%web%"\webapps
if exist %webTom%\%f%\WEB-INF\classes del /s/q/f %webTom%\%f%
md %webTom%\%f%\WEB-INF\classes
move %Jsrc%\*.class %webTom%\%f%\WEB-INF\classes
echo -----------------------------
::写入web.xm配置文件
echo ^<?xml version="1.0" encoding="UTF-8"?^> >> %webTom%\%f%\WEB-INF\web.xml
echo ^<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee" >> %webTom%\%f%\WEB-INF\web.xml
echo 	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >> %webTom%\%f%\WEB-INF\web.xml
echo 	xsi:schemaLocation=^"http://xmlns.jcp.org/xml/ns/javaee >> %webTom%\%f%\WEB-INF\web.xml
echo 	http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd^" >> %webTom%\%f%\WEB-INF\web.xml
echo 	version="4.0" >> %webTom%\%f%\WEB-INF\web.xml
echo 	metadata-complete="true"^> >> %webTom%\%f%\WEB-INF\web.xml
echo+ >> %webTom%\%f%\WEB-INF\web.xml
echo 	^<context-param^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<param-name^>companyName^</param-name^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<param-value^>Rukawa^</param-value^> >> %webTom%\%f%\WEB-INF\web.xml
echo 	^</context-param^> >> %webTom%\%f%\WEB-INF\web.xml
echo 	^<context-param^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<param-name^>address^</param-name^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<param-value^>Chongqing^</param-value^> >> %webTom%\%f%\WEB-INF\web.xml
echo 	^</context-param^> >> %webTom%\%f%\WEB-INF\web.xml	
echo 	^<servlet^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<servlet-name^>%f%^</servlet-name^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<servlet-class^>%f%^</servlet-class^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<init-param^> >>  %webTom%\%f%\WEB-INF\web.xml
echo 			^<param-name^>encoding^</param-name^> >> %webTom%\%f%\WEB-INF\web.xml
echo 			^<param-value^>UTF-8^</param-value^> >>  %webTom%\%f%\WEB-INF\web.xml
echo 		^</init-param^> >>  %webTom%\%f%\WEB-INF\web.xml
echo 	^</servlet^> >> %webTom%\%f%\WEB-INF\web.xml
echo+ >> %webTom%\%f%\WEB-INF\web.xml
echo 	^<servlet-mapping^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<servlet-name^>%f%^</servlet-name^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<url-pattern^>/%f%^</url-pattern^> >> %webTom%\%f%\WEB-INF\web.xml
echo 	^</servlet-mapping^> >> %webTom%\%f%\WEB-INF\web.xml
echo+ >> %webTom%\%f%\WEB-INF\web.xml
echo 	^<welcome-file-list^> >> %webTom%\%f%\WEB-INF\web.xml
echo 		^<welcome-file^>index.html^</welcome-file^> >> %webTom%\%f%\WEB-INF\web.xml
echo 	^</welcome-file-list^> >> %webTom%\%f%\WEB-INF\web.xml
echo+ >> %webTom%\%f%\WEB-INF\web.xml
echo ^</web-app^> >> %webTom%\%f%\WEB-INF\web.xml
::写入主页index.html文件
echo ^<!doctype html^> > %webTom%\%f%\index.html
echo ^<html^> >> %webTom%\%f%\index.html
echo 	^<head^> >> %webTom%\%f%\index.html
echo 		^<meta charset="" /^> >> %webTom%\%f%\index.html
echo 		^<title^>HelloWorld^</title^> >> %webTom%\%f%\index.html
echo 	^</head^> >> %webTom%\%f%\index.html
echo+ >> %webTom%\%f%\index.html
echo 	^<body^> >> %webTom%\%f%\index.html
echo 		点击"<a href="%f%">%f%</a>"访问正确网址 >> %webTom%\%f%\index.html
echo 	^</body^> >> %webTom%\%f%\index.html
echo ^</html^> >> %webTom%\%f%\index.html
echo 文件写入成功
:end
echo -----------------------------
pause
set /p be=继续运行当前脚本？(Y?N)：
if /i %be% equ Y cls & goto start
