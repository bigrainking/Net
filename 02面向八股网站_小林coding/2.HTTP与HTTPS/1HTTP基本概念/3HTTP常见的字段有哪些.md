

# 一、回答

### 1. Content-Type：

- **Server告诉client本次回应的数据是什么格式**.

   下面表明是 `text/html`格式的数据，编码方式是utf-8

   ```html
   Content-Type: text/html; charset=utf-8
   ```

   

- client可以用Accept表明自己可以接受什么格式的数据

   下面表明自己可以接受任何格式的数据

   ```html
   Accept: */*
   ```



HTTP1.0 相比0.9可以传输更多的格式的数据。Content-Type是1.0之后才有的字段。

1.0规定头信息必须是ASCII格式，后面的数据body可以是任何类型的数据



### 2. Content-Encoding

同样是从1.0开始出现的字段（0.9不允许压缩格式的数据传输）

- server告诉client响应的的数据的压缩方法，client需要用该方法解压

```html
Content-Encoding:gzip
```

- client可以通过Accept-Encoding告诉server自己可以接受的压缩方法

<img src="pic/3HTTP%E5%B8%B8%E8%A7%81%E7%9A%84%E5%AD%97%E6%AE%B5%E6%9C%89%E5%93%AA%E4%BA%9B.assets/image-20220529171312422.png" alt="image-20220529171312422" style="zoom:33%;" />



### 3. Content-Length

- server响应时，`Content-Length`表明本次响应的数据长度， 超过这个长度的字段就是后面的响应的了

```html
Content-Length:1000
```



- Content-Length是HTTP1.1开始才有的字段，1.0的一个TCP连接只能发送一个响应（响应完成就要断开）， HTTP/1.1才有持久化连接，一个连接可以传输多个响应

### 4. Host

client发送给server的请求包含这个字段， 请求一台服务器上的某个网站

（为虚拟机打下基础，一个sever多个域名）

<img src="pic/3HTTP%E5%B8%B8%E8%A7%81%E7%9A%84%E5%AD%97%E6%AE%B5%E6%9C%89%E5%93%AA%E4%BA%9B.assets/image-20220529172631981.png" alt="image-20220529172631981" style="zoom:33%;" />

```html
Host: www.A.com
```



## 连接参考

[我的笔记：HTTP各个版本的区别](..\..\..\我的八股文\2 应用层\HTTP各个版本的区别.md)

[小林](https://xiaolincoding.com/network/2_http/http_interview.html#http-%E5%B8%B8%E8%A7%81%E5%AD%97%E6%AE%B5%E6%9C%89%E5%93%AA%E4%BA%9B)

