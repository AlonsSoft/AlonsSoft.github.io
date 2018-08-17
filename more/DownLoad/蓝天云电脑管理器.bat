@echo off
color 2e
title BlueSkyCloudComputertool

if not exist 蓝天云电脑.bat echo 请将本文件放到蓝天云电脑目录下&pause&exit
mode con:lines=28 cols=82
if exist snap\snsp.ini goto 111
md snap
echo.没有快照>>snap\snsp.ini
:111
if not exist System\Windows.img echo 本文件无法识别您是否安装蓝天云&echo 请安装或重新安装或安装&pause&exit
:xgj
cls
setlocal enabledelayedexpansion
set /p xname=<VMachine\1\name.ini
set /p xnc=<VMachine\1\memory.ini
set /p kz=<snap\snsp.ini

echo  ============================ 蓝天云电脑小工具 ==================================
echo.
echo.                         请确保蓝天云电脑是关闭状态
echo    1) 更改云电脑名字
echo.                                        云电脑名:%xname%
echo    2) 更改云电脑内存大小
echo.                                        云电脑内存大小:%xnc%MB
echo    3) 生成/删除云电脑快照
echo.                                        本工具适用于蓝天云电脑大部分版本
echo    4) 还原云电脑快照
echo.
echo.
set /p xqj=                           请选择：
if /i %xqj%==1 goto 1
if /i %xqj%==2 goto 2
if /i %xqj%==3 goto 3
if /i %xqj%==4 goto 4
goto xgj
:1
cls
echo 当前云电脑名字: %xname%
echo 给云电脑起好点的名字吧
set /p xm=请输入云电脑的新名字:
:q
cls
echo 确定信息无误可以修改名字吗？[y/n]
set/p ztxg=
if /i %ztxg%==y goto ok
if /i %ztxg%==n goto xgj
goto q
:ok
cls
del VMachine\1\name.ini
echo %xm%>>VMachine\1\name.ini
echo 修改完成
echo 云电脑的老名字: %xname%
echo 云电脑的新名字: %xm%
echo 任意键返回主菜单
pause >nul
goto xgj
:2
cls
echo 当前云电脑内存大小: %xnc%
echo 给云电脑设置一点合理的内存吧，单位MB
echo 注意内存不要大于主机内存，否则无法启动
echo 设置内存不得小于120MB，否则也可能无法启动
set /p xn=请输入云电脑的内存大小:
:2q
cls
echo 确定信息无误可以修改内存大小吗？[y/n]
set/p ztxg=
if /i %ztxg%==y goto 2ok
if /i %ztxg%==n goto xgj
goto 2q
:2ok
cls
del VMachine\1\memory.ini
echo %xn%>>VMachine\1\memory.ini
echo 修改完成
echo 云电脑的老内存大小: %xnc%MB
echo 云电脑的新内存大小: %xn%MB
echo 任意键返回主菜单
pause >nul
goto xgj
:3
cls
echo 上一个云电脑快照创建日期: %kz% 
echo 创建快照会删除以前的快照，请确保您的虚拟机处于关闭状态
echo 快照只能生成一个
echo 确定创建快照？[y/n/d] (输入d删除云电脑快照)
set/p ztxg=
if /i %ztxg%==y goto kok
if /i %ztxg%==n goto xgj
if /i %ztxg%==d goto delk
goto 3
:kok
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                 正在删除上次创建的快照
del snap\snsp.dcs
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                     正在创建快照
copy System\Windows.img snap\snsp.dcs
del snap\snsp.ini
echo %date%%time%>>snap\snsp.ini
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                  创建成功，任意键返回
pause >nul
goto xgj
:4
cls
echo 上一个云电脑快照创建日期: %kz%
echo 还原快照会丢失当前的数据，请确保您的虚拟机处于关闭状态
echo 确定还原快照？[y/n]
set/p ztxg=
if /i %ztxg%==y goto hkok
if /i %ztxg%==n goto xgj
goto xgj
:hkok
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                     正在还原快照
echo.                          请勿关闭，否则会导致云电脑损坏
echo.                         还原约一分钟，相信我，不会卡在这的
echo.                          如果云电脑损坏，请重新安装云电脑
copy snap\snsp.dcs System\Windows.img
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                  还原成功，任意键返回
pause >nul
goto xgj
:delk
cls
echo 上一个云电脑快照创建日期: %kz%
echo 删除快照会丢失当前的快照
echo 确定删除快照？[y/n]
set/p ztxg=
if /i %ztxg%==y goto dhkok
if /i %ztxg%==n goto xgj
goto xgj
:dhkok
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                     
echo.                          
echo.                         
echo.                                正在删除快照，约一分钟
del snap\snsp.dcs
del snap\snsp.ini
echo.没有快照>>snap\snsp.ini
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                  删除成功，任意键返回
pause >nul
goto xgj



