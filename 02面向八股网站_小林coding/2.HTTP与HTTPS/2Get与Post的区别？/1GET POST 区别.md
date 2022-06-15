# 一、Get Post的区别

[面试官：说一下 GET 和 POST 的区别？](https://github.com/febobo/web-interview/issues/145)

[GET POST 区别原理讲解](https://mp.weixin.qq.com/s?__biz=MzI3NzIzMzg3Mw==&mid=100000054&idx=1&sn=71f6c214f3833d9ca20b9f7dcd9d33e4#rd)



## 1. 是什么？

GET POST都是TCP连接，他们本质上没有区别。他们都是TCP链接。

- 都是HTTP 协议中发送请求的方法
- 本质都是TCP链接，没有区别
- 由于浏览器、服务器的限制导致他们在应用过程出现区别

## 2. 区别



#### 参数类型

- Get请求的参数位置都会写在URL中，但URL规定只支持ASCII编码；因此，GET请求支持ASCII编码
- POST的参数是在body中，因此，POST支持各种格式的编码

#### 参数位置

GET、POST的实质没有区别。

他们都使用同一个传输层协议，传输的时候没有区别。

- **当没有参数时**, 只有第一行的方法名的区别

   ```http
   POST /uri HTTP/1.1 \r\n
   GET /uri HTTP/1.1 \r\n
   ```

- **当有参数时**，GET的data在URL里面，POST的data在body里面

   `get`

   ```http
   GET /index.html?name=qiming.c&age=22 HTTP/1.1
   Host: localhost
   ```

   `post`

   ```http
   POST /index.html HTTP/1.1
   Host: localhost
   Content-Type: application/x-www-form-urlencoded
   
   name=qiming.c&age=22
   ```

- 注意：

   有参数时候的参数位置的区别**仅仅只是约定不是HTTP的规定**，GET的参数也可以写在body里面，POST的参数也可以写在URL里面

#### 参数长度

 HTTP 没有给`GET` `POST` 的body URL进行长度限制，但服务器and浏览器进行了限制。

- 大多数浏览器限制URL长度为2K字节
- 大多数服务器最多处理64K字节的URL：服务器处理长的URL消耗的资源较多，因此会限制长度

> 不同服务器处理方式不同：
>
> GET 请求如果body中含有data，有的服务器会读取数据；有的则直接忽略。因此即使GET请求的body中含有数据也不能读取出来

#### 安全

- `POST`比`GET` 安全，因为`POST` 的数据在地址栏看不见

   

- 但实际上都不安全，HTTP是明文传输，如果抓包，即使是post数据也会被完整获取

- 只有HTTPS才能加密安全



#### 数据包

`GET` 产生一个数据包； `POST`产生2个数据包。

- `GET` 请求方式：浏览器会把http header 和 data一起发送给服务器
- `POST` :浏览器先发送HTTP header，服务器响应 100 continue， 浏览器继续发送信息，Server响应200



POST消耗时间更多，但是POST更有效。

- 当网速快时，发送2次与1次包的耗时差别不大。网速慢时， 两次包的TCP在验证数据包完整性上，有非常大的优点。
- Firefox 的POST只发一次包



# 二、其他: GET的长度限制



如上面所述：

- `GET`方法通过`URL`传递数据， `URL` 本身没有数据限制
- 不同浏览器对`URL` 长度限制了。例如`IE`限制为 2KB字符
- 服务器处理过长的`URL`会消耗过多资源，也会对`URL`进行限制

[《LeetBook》](https://juejin.cn/post/6932001161532669960#heading-15)

[小林](https://xiaolincoding.com/network/2_http/http_interview.html#get-%E4%B8%8E-post)



