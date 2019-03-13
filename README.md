# PetStore
PetStore是Sun公司用于演示JavaEE的，界面用Java Web实现。这里简化为JavaSE技术，界面用Java Swing实现。

## 需求分析
* 用户登录
* 查询商品
* 添加到购物车
* 查看购物车
* 下订单
* 查看订单

## 原型设计
略

## 数据库设计

四张表：account, product, order, order_detail

account

| 字段 | 类型 | 主键 | 外键 |
| ------ | ------ | ------ | ------ |
| userid | varchar(80) | 是 | — |
| password | varchar(25) | — | — |
| name | varchar(80) | — | — |

product

| 字段 | 类型 | 主键 | 外键 |
| ------ | ------ | ------ | ------ |
| productid | varchar(10) | 是 | — |
| category | varchar(10) | — | — |
| cname | varchar(80) | — | — |
| ename | varchar(80) | — | — |
| image | varchar(20) | — | — |
| price | decimal(10,2) | — | — |

order

| 字段 | 类型 | 主键 | 外键 |
| ------ | ------ | ------ | ------ |
| orderid | bigint | 是 | — |
| userid | varchar(80) | — | — |
| orderdate | datetime | — | — |
| status | int | — | — |
| amount | decimal(10,2) | — | — |

order_detail

| 字段 | 类型 | 主键 | 外键 |
| ------ | ------ | ------ | ------ |
| orderid | bigint | 是 | 是 |
| productid | varchar(10) | 是 | 是 |
| quantity | int | — | — |
| unicost | decimal(10,2) | — | — |

## 架构设计
一般架构有三个基本层：
* 表示层（用户与系统交互）
* 服务层（系统的核心业务处理）
* 数据持久层（访问持久化数据）

这里简化为表示层（Swing）和数据持久层（JDBC）

## 系统设计
#### 数据持久层设计
DAO（数据访问对象）设计模式，每一个数据表对应一个DAO对象，每一个DAO对象中有访问数据表的CRUD四类操作

| AccountDao | 
| ------ |
| findAll():List&lt;Account&gt; |
| findById(String):Account |
| create(Account):int |
| modify(Account):int |
| remove(Account):int |

| ProductDao | 
| ------ |
| findAll():List&lt;Product&gt; |
| findById(String):Product |
| findByCategory(String):List&lt;Product&gt; |
| create(Product):int |
| modify(Product):int |
| remove(Product):int |

| OrderDao | 
| ------ |
| findAll():List&lt;Order&gt; |
| findById(String):Order |
| create(Order):int |
| modify(Order):int |
| remove(Order):int |

| OrderDetailDao | 
| ------ |
| findAll():List&lt;OrderDetail&gt; |
| findById(String):OrderDetail |
| create(OrderDetail):int |
| modify(OrderDetail):int |
| remove(OrderDetail):int |

#### 表示层设计
三个窗口类
* LoginFrame(用户登录窗口)
* ProductListFrame（商品列表窗口）
* CartFrame（购物车窗口）

两个表模型
* ProductTableModel
* CartTableModel

