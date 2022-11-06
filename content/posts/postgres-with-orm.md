---
title: "Postgres With Orm"
date: 2022-11-06T19:57:00+08:00
showToc: true
categories: 
  - backend
series: no
---

Postgresql 数据库是真的舒服, 数组JSON都支持, 对于一些数据我们可以利用支持这个特性直接给他冗余到同一张表去, 免得动不动两张表三张表一起查, 慢不说, 主要是写起来麻烦.

但这玩意跟ORM一起来就坏事了, ORM为了通用, 支持的肯定是一组数据库的共有的特性, postgres很多东西就用不了, EF Core 6下JSON相关的各种操作几乎全军覆没, 只能是基本的读写, 不过7已经加入了一些聚合操作, 但索引的支持遥遥无期; 另外在查询的时候也常用Dapper, 可你这个映射不太行啊, 我这个字段是JSONB, 你给我干成字符串几个意思? 
