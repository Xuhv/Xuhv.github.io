---
title: "Overridable Component Like MUI in Vue"
date: 2022-10-03T23:38:08+08:00
showToc: true
categories:
  - front-end
series:
  - typescript
  - vue
---

在React的组件库[MUI](https://github.com/mui/material-ui/)中, 有一个看上去就叼到爆的功能`OverridableComponent`, 在我初学TS那阵子, 那简直就是神迹, 后来对TS逐渐熟悉了看了下源码也就释然了, 再后来一次还尝试写过一个Vue版本.

{{< gist Xuhv d2fff66d0bb7f9fb7d1c63e34bafd08b >}}

本来看懂了原实现, 以为这个移植就是手到擒来, 然而事实上port到Vue还是有点麻烦, 主要问题有

1. `React.ElementType`这个类型在Vue中没有等价的东西, 我定义的这个`ComponentTsx`也没考虑其他情况, 就刚好这里能用而已
2. 从Vue组件里获取$props类型的这个方式有点诡异, 事实上, 这样获取到的也不止props, 还有事件. 有时候我就在想Vue的这个事件的设计是不是真的失败. 感觉就是增加了一个毫无卵用的API

而且这段代码也就能拿来练练手了, 由于Vue函数组件没状态, 容易搞出性能问题, 状态组件的props需要一个个去定义, 真想实现一个能用的OverridableComponent我还真没办法.