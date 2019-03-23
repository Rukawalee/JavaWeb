@echo off
title made by Rukawalee
mode con cols=72 lines=32
color 2e
echo -------------------------------------------
echo *
echo *	author Rukawalee
echo *	快捷创建Java目标文件
echo *	只需要输入Java类名即可
echo *	madetime 2019.03.09
echo *
echo -------------------------------------------
set /p newf=请输入目标的文件名：
cd..
md %newf%
if not exist %newf%/%newf%.java (goto nofile) else (goto end)
:nofile
cd %newf%
echo import java.io.*; > %newf%.java
echo import java.util.*; >> %newf%.java
echo import javax.servlet.*; >> %newf%.java
echo import javax.servlet.http.*; >> %newf%.java
echo public class %newf% extends HttpServlet >> %newf%.java
echo { >> %newf%.java
echo 	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException >> %newf%.java
echo 	{ >> %newf%.java
echo 		response.setContentType("text/html; charset=utf-8");>> %newf%.java
echo 		request.setCharacterEncoding("utf-8"); >> %newf%.java
echo 		PrintWriter out = response.getWriter(); >> %newf%.java
echo 	} >> %newf%.java
echo+ >> %newf%.java
echo 	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException >> %newf%.java
echo 	{>> %newf%.java
echo 		doGet(request, response); >> %newf%.java
echo 	}>> %newf%.java
echo } >> %newf%.java
echo 创建%newf%目标文件成功
:end
