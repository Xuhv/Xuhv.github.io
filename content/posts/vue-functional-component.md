---
title: "Vue Functional Component"
date: 2022-10-03T15:55:26+08:00
showToc: true
categories:
  - frontend
series: 
  - vue
---

在Vue3中, 函数组件得到了史诗级加强, 具体表现有二

1. 写法简化, 使用便利性大大增强
2. 随处可用的`h`, 插槽改版, 适用范围更加宽广

因此在Vue3下, 可以看到的是函数组件的使用大量增加, 典型的如`naive-ui`, 从其文档中你能找到大量函数组件的使用, 由此可见, Vue3的函数组件确实在某种意义上有着巨大的好处. 但与之相应的, 函数组件的使用也有着一些误区.

### 函数组件的应用场景

1. 重复的模板片段, 在Vue3中, 配合JSX, 重复片段的组件提取将变得异常简单
2. 插槽的封装, 截止本文编写, Vue插槽始终没有好的编辑器支持(指VS Code, 没用过WebStorm), 但通过将插槽封装成Props的方式, 你将得到具有类型支持的组件. 你可以在[naive-ui](https://github.com/tusen-ai/naive-ui/blob/main/src/data-table/src/TableParts/Body.tsx)中看到许多这种写法. 毕竟现在插槽就是一个值为函数组件的对象, 封装起来毫无压力
3. 对状态组件的强化, `setup script`一个很好的地方在于省去了很多的模板代码, 代码短了自然会好读好写一些, 但不好的地方的就是糟糕的`TypeScript`支持了, 在包含类型的时候`volar`插件可能会错误解析你的代码, 而[#4294](https://github.com/vuejs/core/issues/4294)这个issue估计是有生之年系列了. 在某些情况下, 你可以考虑使用函数组件来强化你的状态组件. 函数组件的Props并不需要像`defineProps`那样从类型声明编译, 你可以直接使用各种[复杂类型](https://www.typescriptlang.org/docs/handbook/2/types-from-types.html)就像是在一般的TS中那样

### 使用函数组件的注意事项

1. 虽然你可以对组件的插槽按Props的方式封装, 但如果你不是从头开始写一个组件库, 而是在现有组件的基础上操作, 这样的做法可能并不好, 因为你改变了原有的API
2. 当你使用函数组件对状态组件进行包裹的时候, 你需要注意, 状态组件(子组件)的交互应当避免对函数组件(父组件)Props的操作, 函数组件Props更新将造成整个子树的更新, 这可能会导致你的组件卡成PPT

_~~虽然本文拿`naive-ui`举例, 但我还是觉得`element-plus`好用~~_