---
title: "Vue Functional Component"
date: 2022-10-03T15:55:26+08:00
showToc: true
categories:
  - front-end
series: 
  - vue
---

In Vue3, functional components have been greatly enhanced, and there are two specific performances

1. Simplifying the API
2. `h` available everywhere and slot revision, resulting the wider application

Therefore, under Vue3, you can see that the use of functional components has increased a lot. For example, `naive-ui`. You can find a lot of use of functional components from its documentation. Indeed it's very useful in some cases. But correspondingly, there are some misunderstandings in the use of function components.

### Application Scenarios

1. In Vue3, with JSX, the component extraction of repeated fragments will become extremely simple.

2. As of this writing, Vue slots have no good editor support, but by passing slots into props, you will get components with type support. You can see a lot of this in [naive-ui](https://github.com/tusen-ai/naive-ui/blob/main/src/data-table/src/TableParts/Body.tsx). Now, a slot is now an object whose value is a functional component, so there is no difficulty to do that.

3. Enhancement of state components. A good part of `setup script` is that it reduces a lot of template code. If the code is shorter, it will be easier to read and write, but the downside is that it has poor TypeScript support. Sometimes the `volar` plugin may parse code incorrectly, and this issue [#4294](https://github.com/vuejs/core/issues/4294)'s solution is still far away. In some cases, you can consider using function components to enhance your state components. The props of function components do not need to be compiled like `defineProps`, so you can use various [complex types](https://www.typescriptlang.org/docs/handbook/2/types-from-types.html) directly like in normal TS.

### Misunderstandings

1. Although you can wrap the slot of a component in the way of Props, if you are not writing a component library from scratch, but operating on the basis of existing components, this approach may not be a good idea. We should avoid change the original API.

2. When you use a function component to wrap a state component, you need to pay attention that the interaction of the state component (child component) should avoid the operation of the function component (parent component) props, the function component props update will cause the entire subtree to update, which may cause your components to get stuck.

_~~Although this article takes `naive-ui` as an example, I still think `element-plus` is better to use~~_
