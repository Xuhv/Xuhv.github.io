---
title: "Identity"
date: 2022-11-06T20:16:40+08:00
showToc: true
categories: no
series: no
---

### 从JWT开始

我对乱七八糟登录认证的认知是从JWT开始的, 无状态, 听到这一条我就知道我离不开他了, 不是别的, 我SQL写得比较拉跨, 毕竟前端选手, 后端属实业余, 吹牛逼还, 行写SQL直接就现原形了.

不过后来我发现好像这个无状态好像也不差绝对的, 登录不还得有登出吗, 登录不设白名单, 登出的时候就得设个黑名单.

后来就觉得跟普通的session_id方案差不多了, 加个公用的数据库, session_id照样跨系统用. 而JWT这玩意配置起来也比较麻烦, 在ASP.NET Core中, 生成JWT和利用JWT进行认证授权是要分开写两套的, 麻烦, 不给我网, 我连那两个包名都记不住. 

### AspNet Identity & IdentityServer流弊

当我发现这东西以后, 我才知道自己写登录是多离谱的事, 尼玛别人连登陆页面和数据库都给你写好了, 拓展也是无压力. 只是我发现浏览器是把信息存在cookie里的, 当时心里就感觉有些不妙.

不过如果是要微服务, 单做一个登陆服务, Identity就不行了, 然后微软网站告诉我有个东西叫IdentityServer, 开箱即用的OIDC和Identity集成, 这等于说用.NET技术栈的话压根就不用愁认证方面的问题了?

不过很快我发现我错了, 前后端分离, 这是我学习的一个宗旨, 虽然MVC,Razor Pages以及Blazor Server我也简单过了一遍, 但没有前后端分离是肯定不行的, 认证服务器,资源服务器谈不上啥分离不分离, 要分离的就是使用资源的客户端, 终端用户使用的应用, 然后, Boom

OAuth2有四种模式

1. Implicit Grant我手动pass, 属实不想再前端整这些玩意儿, 前端应当具有更强的表现力和更优的交互, 而不是操心这些, 而且token存浏览器本身就不是百分百安全.
2. Client Credentials Grant, 这玩意不是用在这里的
3. Password Grant, 狗听了都摇头
4. Authorization Code Grant, 就它了, 前端几乎无感, 安全性高

然后, 出岔子了, 开发时, 前端和后端并不是同一个HOST, 于是Backend Channel在重定向的时候是定到后端的, 而我是将后端代理到前端, 于是跨域了, 嗯, 于是我用AspNet.Yarp把前端代理到了后端, 这下总没事了吧, 好家伙, 404, Backend Channel重定向这一步直接炸了, 测试下重定向链接Post请求404, Get被重写到了index.html, 合着这波重定向把我客户端上几个给Backend Channel用的接口干废了. 虽然IdentityServer还有个BFF的库可以解决这个问题, 但说句实话, 已经给恶心到了, 引入额外的东西太多了.
