@echo off
color 2e
title BlueSkyCloudComputertool

if not exist �����Ƶ���.bat echo �뽫���ļ��ŵ������Ƶ���Ŀ¼��&pause&exit
mode con:lines=28 cols=82
if exist snap\snsp.ini goto 111
md snap
echo.û�п���>>snap\snsp.ini
:111
if not exist System\Windows.img echo ���ļ��޷�ʶ�����Ƿ�װ������&echo �밲װ�����°�װ��װ&pause&exit
:xgj
cls
setlocal enabledelayedexpansion
set /p xname=<VMachine\1\name.ini
set /p xnc=<VMachine\1\memory.ini
set /p kz=<snap\snsp.ini

echo  ============================ �����Ƶ���С���� ==================================
echo.
echo.                         ��ȷ�������Ƶ����ǹر�״̬
echo    1) �����Ƶ�������
echo.                                        �Ƶ�����:%xname%
echo    2) �����Ƶ����ڴ��С
echo.                                        �Ƶ����ڴ��С:%xnc%MB
echo    3) ����/ɾ���Ƶ��Կ���
echo.                                        �����������������Ƶ��Դ󲿷ְ汾
echo    4) ��ԭ�Ƶ��Կ���
echo.
echo.
set /p xqj=                           ��ѡ��
if /i %xqj%==1 goto 1
if /i %xqj%==2 goto 2
if /i %xqj%==3 goto 3
if /i %xqj%==4 goto 4
goto xgj
:1
cls
echo ��ǰ�Ƶ�������: %xname%
echo ���Ƶ�����õ�����ְ�
set /p xm=�������Ƶ��Ե�������:
:q
cls
echo ȷ����Ϣ��������޸�������[y/n]
set/p ztxg=
if /i %ztxg%==y goto ok
if /i %ztxg%==n goto xgj
goto q
:ok
cls
del VMachine\1\name.ini
echo %xm%>>VMachine\1\name.ini
echo �޸����
echo �Ƶ��Ե�������: %xname%
echo �Ƶ��Ե�������: %xm%
echo ������������˵�
pause >nul
goto xgj
:2
cls
echo ��ǰ�Ƶ����ڴ��С: %xnc%
echo ���Ƶ�������һ�������ڴ�ɣ���λMB
echo ע���ڴ治Ҫ���������ڴ棬�����޷�����
echo �����ڴ治��С��120MB������Ҳ�����޷�����
set /p xn=�������Ƶ��Ե��ڴ��С:
:2q
cls
echo ȷ����Ϣ��������޸��ڴ��С��[y/n]
set/p ztxg=
if /i %ztxg%==y goto 2ok
if /i %ztxg%==n goto xgj
goto 2q
:2ok
cls
del VMachine\1\memory.ini
echo %xn%>>VMachine\1\memory.ini
echo �޸����
echo �Ƶ��Ե����ڴ��С: %xnc%MB
echo �Ƶ��Ե����ڴ��С: %xn%MB
echo ������������˵�
pause >nul
goto xgj
:3
cls
echo ��һ���Ƶ��Կ��մ�������: %kz% 
echo �������ջ�ɾ����ǰ�Ŀ��գ���ȷ��������������ڹر�״̬
echo ����ֻ������һ��
echo ȷ���������գ�[y/n/d] (����dɾ���Ƶ��Կ���)
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
echo                                 ����ɾ���ϴδ����Ŀ���
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
echo                                     ���ڴ�������
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
echo                                  �����ɹ������������
pause >nul
goto xgj
:4
cls
echo ��һ���Ƶ��Կ��մ�������: %kz%
echo ��ԭ���ջᶪʧ��ǰ�����ݣ���ȷ��������������ڹر�״̬
echo ȷ����ԭ���գ�[y/n]
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
echo                                     ���ڻ�ԭ����
echo.                          ����رգ�����ᵼ���Ƶ�����
echo.                         ��ԭԼһ���ӣ������ң����Ῠ�����
echo.                          ����Ƶ����𻵣������°�װ�Ƶ���
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
echo                                  ��ԭ�ɹ������������
pause >nul
goto xgj
:delk
cls
echo ��һ���Ƶ��Կ��մ�������: %kz%
echo ɾ�����ջᶪʧ��ǰ�Ŀ���
echo ȷ��ɾ�����գ�[y/n]
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
echo.                                ����ɾ�����գ�Լһ����
del snap\snsp.dcs
del snap\snsp.ini
echo.û�п���>>snap\snsp.ini
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
echo                                  ɾ���ɹ������������
pause >nul
goto xgj



