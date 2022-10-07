---
title: "关于深拷贝"
date: 2022-10-05T00:39:52+08:00
showToc: true
categories: 
  - front-end
series: no
---

原来遇到要深拷贝这种操作我一般就`JSON.stingify`然后`JSON.parse`了(为啥不用lodash呢, 我也没个很好的理由, 可能是看见项目package.json里没这个包也不好自己加得?)

后来lodash就真香了, 但某次看着引入的函数, 我就在想这种递归的方式比用`JSON`好在哪里, 函数没了? 我只是用来拷贝数据, 不存在这个问题啊; 循环依赖, 什么大聪明非得干出循环依赖的数据来? 至于别的, 等等, JSON和JS对象差别在哪? JS对象的类型定义应该是`Record<string | number | Symbol, any>`, 嗯Symbol类型肯定是炸了, 不过谁数据里要这玩意儿啊, 再想想别的. 嗯, JSON就对象, 数组, 字符串, 数字, 布尔和null几种类型, 但JS常用的还有undefined, Date也用来表示数据, undefined我知道, 序列化后就没得咯, 很棒的特性, 表单置空用这个就不会发额外字段到后端了, Date呢, 试了下, 会变成ISO格式的字符串, 原来如此. 另外一搜索, 发现还有`NaN`, `Infinity`, `-Infinity`也会被序列化成null.

另外前阵子出了个`structuredClone`的API, 用这个的话更好, lodash可删(防抖节流? 嗯, 先继续用着吧, 正经人谁手写这玩意儿啊). 一看兼容性, 好家伙Chrome 98, Firefox 94, Node.Js 17, 这谁顶得住, 但这个[see also](https://developer.mozilla.org/en-US/docs/Web/API/structuredClone#see_also)就很妙了, 对啊, 这玩意api虽然有些许不同, 但不还是个深拷贝吗, polyfill下就得了, cloneDeep可删.
