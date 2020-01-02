## SaltyZero's Repack
Based on Azerothcore v2.0.0 and authorized by saltyzero@foxmail.com I'm intended to build one high expansibility and performance server with easy game APIs. 
    
## Description:
>* The master branch is x64 version with mariadb_10.4.2_x64 and openssl_1.1.1c_x64. No x86 version anymore.
>* Some private codes will be just obtained from contributions, but free to use all functions.

## Upcoming:   
>* v1.5 will fix more origin dungeons.

## Features:  
>* Use game APIs with C++ rather than Eluna to override your own scripts just like it in demo project [transmog] or [world_chat].
   
>* More brief file structure.
   
>* Dynamic hot loading or freeing script dll with GM cmd .script load xxx / .script free xxx. It's a so powerful function.
    
>* Use the cmd [create_new_script] to create a new scirpt project with the default configuration [RelWithDebInfo|Win32]. Now you can build all script with cmd [build_all].

## Requirements:

>* If you play at localhost just requiring [mysql] and one mysql database browser just like [navicat] or [heidisql].

>* If you open it on the internet and that will requirie one host tool just like [apache].

## Steps:

>* Open your mysql service.

>* Import all sql files within data folder and other script sql files if you use it.

>* Set your server conf to connect to the mysql on it's port with default 3306.

>* Create a character and have fun.

## Note:
>* Compile the script project with configuration [RelWithDefInfo]. 

>* The script name and the exported function name XXX matches the form of XXX.dll and AddSC_XXX() { new XXX(); } which will be filled in Database.

>* Game APIs are not complete but useful I'm trying to update.

>* You can debug your scripts in the debugger directly as long as you set your debugger configuration as the same as the demo script [transmog] or [world_chat].

>* If you find any compiling error or any good suggestion just contact me.

>* If you meet errors when import SQL files, you'd better install [Navicat 11].

## 说明    
1. 主分支为x64版本, mariadb_10.4.2_x64, openssl_1.1.1c_x64, 所有文件仅端部分80M. 不再更新x86版本.

## 计划    
1. 在1.3版本中会添加一些可玩性的功能.   

## 特性    
1. 使用C++的接口重写脚本逻辑而不使用lua, 参考已有的幻化和世界聊天功能.  
2. 更简洁的文件结构. 
3. 动态热加载卸载dll动态链接库, 使用gm命令即可完成. 
4. 使用命令行脚本一键创建新工程, 并且支持一键编译所有脚本, 我使用的是VS2017 SDK版本17763, 可根据需要自己修改.
