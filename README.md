##Vim安装学习笔记

###Vim使用史

前几年一直有使用Vim,不过用的也是简单的基础，后来因为Linux下和Win7下老是有编码冲>突问题，再加上Vim上的复制粘贴真是不太习惯，然后转战Notepad++，外加了一个vim操作>方式插件，然后最近又在想重新折腾下回到vim环境下，故准备重新安装Vim环境加上学习记录为笔记。

###Vim安装使用

电脑系统：Linux Mint & Win7(主系统）

以下设置代码都存放在 `_vimrc` 文件中

1. 先解决编码问题，现在主要工作编码是GBK...
```bash
set fileencodings=utf-8,cp936
```

2. 参考了[所需即所获：像 IDE 一样使用 vim](https://github.com/yangyangwithgnu/use_vim_as_ide) 进行了部分我优先需要的设置。
3. 使用了主题 [Molokai](https://github.com/tomasr/molokai)
4. 研究win7上安装插件YouCompleteMe失败。。。
5. 开始安装的时候使用了Pathogen，发现不是很方便，要自己安装插件，改用[Vundle](https://github.com/gmarik/Vundle.vim)
6. 在家安装的时候，使用Vundle重新安装插件，安装了Vundle.vim后一直提示无法打开TEMP文件，查了网上很多资料，作者的Issues，有说SHELL问题的，目录问题的一一测试都没有成功，无意间把插件目录(vimfiles/bundle/)下同文件夹名删除后竟然安装成功了！！！！折腾了差不多2小时。。。

