



[toc]



# 1. HTTP1.0

<img src="../../%E6%88%91%E7%9A%84%E5%85%AB%E8%82%A1%E6%96%87/2%20%E5%BA%94%E7%94%A8%E5%B1%82/pic/HTTP101120%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220331204813704.png" alt="image-20220331204813704" style="zoom: 67%;" />

### 1.1 简介

首先：HTTP1.0可以发送任意类型的数据，包括HTML、图片、视频、二进制文件等，相比HTTP0.9只能发送HTML文件，促进了互联网发展。

其次：引入了 `GET`、`POST`等于与浏览器交互的命令。

再次：请求and回应报文发生都必须含有头部

### 1.2 请求格式

- 首行后面必须加上版本名称
- 请求头包含了关于客户端的描述信息

```http
GET / HTTP/1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5)
Accept: */*
```

### 1.3 响应格式

- 由头部+`\r\n`+ 数据主体 组成
- 首行+状态码+描述状态信息

```http
HTTP/1.0 200 OK 
Content-Type: text/plain
Content-Length: 137582
Expires: Thu, 05 Dec 1997 16:00:00 GMT
Last-Modified: Wed, 5 August 1996 15:55:28 GMT
Server: Apache 0.84

<html>
  <body>Hello World</body>
</html>
```



### 1.4 `Content-Type`

相比HTTP0.9   1.0可以传输多种类型的数据，1.0版规定，头信息必须是 ASCII 码，后面的数据可以是任何格式。因此，服务器需要告诉客户端数据体是什么格式

常见格式如下：

这些数据类型总称为`MIME type`，每个值包括一级类型和二级类型，之间用斜杠分隔。

```http
text/plain
text/html
text/css
image/jpeg
image/png
image/svg+xml
audio/mp4
video/mp4
application/javascript
application/pdf
application/zip
application/atom+xml
```

客户端请求的时候，可以使用`Accept`字段声明自己可以接受哪些数据格式。

> ```http
> Accept: */*
> ```



### 1.5 `Content-Encoding` 

发送的数据可以是任意格式，可以压缩后发送。 Content-Encoding 表明了压缩的格式

```http
Content-Encoding: gzip
Content-Encoding: compress
Content-Encoding: deflate
```

客户端通过 `Accept-Encoding: gzip, deflate` 说明可以接受的压缩格式

### 缺点

- 一个TCP连接只能发送一个请求，每次发送完毕都要断开TCP连接。

为了解决上述问题，部分浏览器在请求时使用非标准字段 `Connection:keep-alive`请求不要断开连接， 服务器同样回复这个同样的字段。此时的TCP连接可以复用。

但这个是非标准字段，不同的实现行为不一样。

# 2. HTTP1.1

1997年1月，HTTP/1.1 版本发布，只比 1.0 版本晚了半年。它进一步完善了 HTTP 协议，一直用到了20年后的今天，直到现在还是最流行的版本。

<img src="../../%E6%88%91%E7%9A%84%E5%85%AB%E8%82%A1%E6%96%87/2%20%E5%BA%94%E7%94%A8%E5%B1%82/pic/HTTP101120%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220331212515889.png" alt="image-20220331212515889" style="zoom:50%;" />

### 2.1 持久连接

> 只要两端任何一方没有明确提出，连接都不会断开

<img src="pic/1%E4%BB%80%E4%B9%88%E6%98%AFHTTP%EF%BC%9F.assets/image-20220613162804832.png" alt="image-20220613162804832" style="zoom: 50%;" />

1.1版本最大变化就是：引入持久连接， 请求后默认不断开连接，不需要声明 `Connection:keep-alive`。

- Client、Server一旦发现对方有一段时间没有活动，可以主动关闭连接
- 【规范的做法】：Client发送最后一个请求时候加上 `Connection:close` 请求服务器关闭连接。

```http
Connection:close
```

- 目前，对于同一个域名，大多数浏览器允许同时建立6个持久连接。

**好处：** 减少了由于三次握手建立连接、四次挥手断开连接导致的额外开销，减轻了服务器的负载

### 2.2 管道机制

> 管道机制（pipelining），即在同一个TCP连接里面，客户端可以同时发送多个请求。但是Server根据请求到达顺序依次返回对应的响应。

<img src="pic/1%E4%BB%80%E4%B9%88%E6%98%AFHTTP%EF%BC%9F.assets/image-20220613163831416.png" alt="image-20220613163831416" style="zoom: 25%;" />

过去是Client发出A请求等到服务器的响应到达后才能发送B请求。 现在，可以同时发送A、B请求(同时发送多个请求)，但服务器处理仍然按照A、B的顺序。

**优点：**减少了整体的响应时间。 第一个请求发出去，不用等response回来，就可以同时发送第二个请求

**确定**：只解决了请求的“队头堵塞”没有解决响应的“队头堵塞”

### 2.3 `Content-Length` 

相比之前1.0版本一个TCP连接只传输一个响应， 现在一个TCP连接可以传输多个回应。

 `Content-Length`声明本次回应的长度，超过这个字节的就属于后面一个回应。

```html
Content-Length: 3495
```



- 在1.0 中这个字段不是必须的，因为一个响应发送完之后就关闭TCP连接了



### 2.4 分块传输编码

解决传输效率低的问题：

 使用 `Content-Length`需要事先知道全部数据的长度，如果server处理某个耗时的动态操作，server需要全部处理完成后才能发送给client。

更好的方式应该是：**处理完一块数据，发送一块数据**。 `流模式` 

HTTP1.1 规定可以使用“分块传输编码”（Chunked Transfer Encoding），使用`Transfer-Enconding` 字段在请求or响应报文的头部，则表明回应将由数量不定的数据块确定。

```http
Transfer-Encoding:chunked
```

每个非空的数据块之前，会有一个16进制的数值，表示这个块的长度。最后是一个大小为0的块，就表示本次回应的数据发送完了。下面是一个例子。

> ```http
> HTTP/1.1 200 OK
> Content-Type: text/plain
> Transfer-Encoding: chunked
> 
> 25
> This is the data in the first chunk
> 
> 1C
> and this is the second one
> 
> 3
> con
> 
> 8
> sequence
> 
> 0
> ```





### 2.5 Host字段

客户端头部增加了Host字段， 来指定请求的资源的域名。

将请求发往一个服务器的多个网站，为虚拟机打下基础

```html
Host: www.example.com
```



### 2.6 缺点

- "队头堵塞"： 1.1版本允许复用连接（同时发送多个请求），但服务器的处理只能按序处理。造成如果前一个请求的回应需要处理很久，则后面请求的回应会被阻塞， 导致有很多请求会被堵塞排队。

  <img src="pic/1%E4%BB%80%E4%B9%88%E6%98%AFHTTP%EF%BC%9F.assets/image-20220613164139303.png" alt="image-20220613164139303" style="zoom: 33%;" />
  
    

# 3. HTTP2

2015年，`HTTP/2` 发布。它不叫 HTTP/2.0，是因为标准委员会不打算再发布子版本了，下一个新版本将是 HTTP/3。

<img src="../../%E6%88%91%E7%9A%84%E5%85%AB%E8%82%A1%E6%96%87/2%20%E5%BA%94%E7%94%A8%E5%B1%82/pic/HTTP101120%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220411180741446.png" alt="image-20220411180741446" style="zoom:33%;" />

### 3.1 二进制协议

1.1中头信息是文本信息（ASCII编码）, 数据体可以是二进制or文本信息。

HTTP/2中全部是二进制。并且统称为 “帧”：头信息帧、数据帧。

> 具体二进制协议是什么见： 补充知识--> 二进制协议



**优点**：解析数据更高效



### 3.2 多工

HTTP/1.1是只能同时发送多个请求。 HTTP/2 可以同时发送多个请求和响应， 避免了 “队头堵塞”。

这种双向的、实时的通信 就是双工



### 3.3 数据流

HTTP/2中请求响应的发送不是按序发送的， 同一个TCP连接中的数据包可能属于不同的响应，因此需要给每个数据包标记ID， 来确定每个数据包属于的响应。



>  具体见： 补充知识--> 数据流

- 另外还规定，客户端发出的数据流，ID一律为奇数，服务器发出的，ID为偶数。

- 数据流发送到一半的时候，客户端和服务器都可以发送信号（`RST_STREAM`帧），取消这个数据流。这就是说，HTTP/2 可以取消某一次请求，同时保证TCP连接还打开着，可以被其他请求使用。

### 3.4 头信息压缩

由于HTTP协议不带有状态，每次客户端都要附带所有信息：如 `User-Agent`、 `Cookie` 浪费带宽影响速度

头信息压缩机制： 

1. 一方面头信息通过压缩后发送：`gzip`  ,  `compress`
2. Client Server同时维护一张头信息表，所有字段存入这个表， 当发送信息只需要继续发送索引号。 

### 5.5 服务器推送

HTTP/2 允许服务器未经请求，主动向客户端发送资源，这叫做服务器推送（server push）。

常见场景是客户端请求一个网页，这个网页里面包含很多静态资源。正常情况下，客户端必须收到网页后，解析HTML源码，发现有静态资源，再发出静态资源请求。其实，服务器可以预期到客户端请求网页后，很可能会再请求静态资源，所以就主动把这些静态资源随着网页一起发给客户端了。

# 补充知识

## 分块传输编码：







## 二进制协议：

**文本协议**：

传输信息使用文本信息

- 每个字段自带描述信息（就是参数名），和文本一样清楚。数据传输格式如下：

```http
$registerData = [
    "account"  => "sqrtcat",
    "password" => "123456"
];
```

- 【缺点】：参数名会带来额外的传输开销



**二进制编码传输协议**：

- 没有参数名， 通过固定不同的字节位作为参数的数据段。比如0~10为“Account”的数据段，11~24为"PassWord"的数据段

- Account、PassWord本身是不定长的，需要进行打包填充数据段，将每个字段填充到固定的长度。最后在接受者处解包。 `pack/unpack`

- 如下的二进制协议：

   <img src="../../%E6%88%91%E7%9A%84%E5%85%AB%E8%82%A1%E6%96%87/2%20%E5%BA%94%E7%94%A8%E5%B1%82/pic/HTTP101120%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220329222712792.png" alt="image-20220329222712792" style="zoom: 33%;" />



[参考：二进制编码传输协议](https://segmentfault.com/a/1190000022356844)

## 数据流

**定义** ： 用于在客户端and服务器之间交换帧的双向帧序列集。



如在HTTP1.X中传输的请求形式如下，是文字协议传输。

在HTTP2.0时，将请求拆分成了帧，请求头是Head帧，data是Data帧。

<img src="../../%E6%88%91%E7%9A%84%E5%85%AB%E8%82%A1%E6%96%87/2%20%E5%BA%94%E7%94%A8%E5%B1%82/pic/HTTP101120%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220329225934674.png" alt="image-20220329225934674" style="zoom: 25%;" />

在传输请求的过程中，为了实现在同一个TCP连接中并行传输多个请求多个响应。我们引入流的概念。

(HTTP1.X中如何将响应和请求对应起来的，)

如果并行请求响应，则一个TCP中有许许多多的请求相关Head、Data帧，还有响应相关的Head帧、Data帧，由于不同的帧到达服务器的时间不一样，服务器给出对应请求响应的时间也不一样，会导致客户端将无法将响应和请求对应起来。

因此，我们将每个请求拆分成的帧打上标记(Stream ID )，同时当服务器返回响应时也打上和对应请求相同的标记(Stream ID)， 这样一个请求对应一个响应他们的Stream ID都是一样的，客户端在收到响应时就能知道是对哪个请求的回应。

这里的被打上相同的StreamID的帧们就形成了一个流。一个TCP连接同时在发送多个请求，就有多个流。

![image-20220329232302666](pic/%E4%BB%80%E4%B9%88%E6%98%AFHTTP.assets/image-20220329232302666.png)

举个例子：

客户端发出了A.html  B.CSS两个请求， 两个请求被拆分成帧，A.html拆分成并标记属于stream1流 ：Rhead s1帧，Rdata s1帧， B.CSS被拆分并标记为sream 2流：Rhead s2   Rdata s2。这几个帧不按顺序到达服务器，但服务器可以根据他们的Stream ID组装起来，得到A.html请求， 并返回请求对应的响应 ToA.html, 并拆分并标记属于stream 1流：Tohead s1  Todata s2。

当客户端收到几个帧之后，将相同流对应的帧组装，得到响应报文



