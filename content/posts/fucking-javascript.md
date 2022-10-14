---
title: "Fucking Javascript"
date: 2022-10-13T23:56:23+08:00
categories: no
series: no
---

### 迷惑的`unrefined`

无意中看到了某项目的代码中用了`void 0`，不是很懂为啥不用`undefined`，遂百度，得到的回答是`undefined`不是保留字，只是一个全局变量

一敲， 还真是这样

![](/img/fucking-javascript-01.png)

哦，怕全局变量被改了嘛，情有可原， 然后他妈的就这样了

![](/img/fucking-javascript-02.png)

你说你闹哪样？

