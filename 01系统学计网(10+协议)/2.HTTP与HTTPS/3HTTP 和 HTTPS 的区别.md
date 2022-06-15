[toc]



# 一、HTTP

#### 1. **HTTP是什么？**

HTTP是超文本传输协议(Hyper Text Transfer Protocal)。

HTTP是从Web服务器传输HTML(超文本标记语言)到本地浏览器的传送协议。

设计HTTP最初的目的是为了提供一种发布和接收HTML页面的方法。



#### 2. **HTTP的原理**

- HTTP基于TCP/IP通信协议传输数据。

- 【传输数据】传输的数据并不是计算机底层中的二进制包，而是完整的、有意义的数据，如HTML 文件, 图片文件, 查询结果等超文本，能够被上层应用识别

- 传输原理：如下图

   

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324151241800.png" alt="image-20220324151241800" style="zoom: 67%;" />

- Client Server交互具体过程如下

   [参考](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Overview#http_%E6%B5%81)

   当客户端想要和服务端进行信息交互时（服务端是指最终服务器，或者是一个中间代理），过程表现为下面几步：

   1. 打开一个TCP连接：TCP连接被用来发送一条或多条请求，以及接受响应消息。客户端可能打开一条新的连接，或重用一个已经存在的连接，或者也可能开几个新的TCP连接连向服务端。

   2. 发送一个HTTP报文：HTTP报文（在HTTP/2之前）是语义可读的。在HTTP/2中，这些简单的消息被封装在了帧中，这使得报文不能被直接读取，但是原理仍是相同的。

      ```html
      GET / HTTP/1.1
      Host: developer.mozilla.org
      Accept-Language: fr
      ```

   3. 读取服务端返回的报文信息：

      ```html
      HTTP/1.1 200 OK
      Date: Sat, 09 Oct 2010 14:28:02 GMT
      Server: Apache
      Last-Modified: Tue, 01 Dec 2009 20:18:22 GMT
      ETag: "51142bc1-7449-479b075b2891b"
      Accept-Ranges: bytes
      Content-Length: 29769
      Content-Type: text/html
      
      <!DOCTYPE html... (here comes the 29769 bytes of the requested web page)
      ```

   4. 关闭连接或者为后续请求重用连接。

#### 3. **特点：**

- 【明文传输】所有数据的传输都以明文的方式传输，没有加密

- 【B/S模式】客户端、服务器模式

- 【简单快速】client发送请求只需要发送方法and地址。HTTP协议简单，因此HTTP服务器程序规模小，通信速度快

- **灵活：** HTTP允许传输任意类型的数据对象。传输的类型由Content-Type加以标记。

- 【无连接】 限制每个连接只能处理一个请求。当处理完请求，连接就要断开。

- 【无状态】对于一个client的请求，在下一次时候Server是没有记忆的。比如第一次client请求了数据并且server发送了数据，但是server本身不会有任何发送了数据的记录。

  无状态可以用cookie session解决
  
   

参考链接

[如何理解HTTP的"无连接,无状态"特点](https://www.jianshu.com/p/4fcce41ed723)

[面试官：什么是HTTP? HTTP 和 HTTPS 的区别?](https://github.com/febobo/web-interview/issues/134#)

[十分钟搞懂HTTP和HTTPS协议？ - 程序员吾非同的文章 - 知乎]( https://zhuanlan.zhihu.com/p/72616216)

[HTTP 的基本性质](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Overview#http_的基本性质)





# 二、HTTPS

#### **1 是什么**

HTTPS并非是新的协议，HTTPS是`HTTP +SSL`两种协议的简称

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220329151213455.png" alt="image-20220329151213455" style="zoom: 67%;" />

#### **2 SSL/TLS** 

SSL(Secure Sockets Layer 安全套接层),及其继任者传输层安全(Transport Layer Security，TLS)是为网络通信提供安全及数据完整性的一种安全协议。

HTTPS用TLS对信息加密，用HTTP传输信息。

TLS使用了 `对称加密`对信息内容、`非对称加密`用于数字证书验证，的两种加密技术



#### 3 **HTTPS传输数据的过程**

1）客户端通过URL向服务器申请建立SSL连接， 服务器返回数字证书（证书中包含公钥）

2）服务器验证证书是否有效，如果有效则产生会话密钥（对称密钥：使用伪随机数生成）。

3） 使用上一步得到的公钥对会话密钥进行加密。 

4 ） 最后向客户端发送会话密钥， 服务器用自己私有的私钥解密，得到与客户端相同的对称密钥。

5） 双方都有了相同的对称密钥后，双方可以通过对称密钥对通信内容加密解密，使用HTTP协议进行传输。



<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220329152933216.png" alt="image-20220329152933216" style="zoom:50%;" />

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220329153423299.png" alt="image-20220329153423299" style="zoom:50%;" />

[图片来源](https://www.cnblogs.com/linianhui/p/security-https-workflow.html)



# 三、**为什么有了HTTPS就更安全了呢？**



## 1 加密算法

### 对称加密算法

【过程】：客户端and服务器分别有一把相同的钥匙(称为对称钥匙)，客户端用钥匙对明文加密后传输给服务器端，服务器端用对称钥匙(与客户端的相同)解密，获取明文。



【缺陷】：客户端在发送data的时候也需要将密钥发送过去，`对称钥匙` 在传输时使用的是明文传输，容易被拦截，密钥被获取之后传输的信息都会被看见

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324184435201.png" alt="image-20220324184435201" style="zoom: 33%;" />



【传输过程】：

1. 使用对称密钥传输：

   <img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324185414865.png" alt="image-20220324185414865" style="zoom: 33%;" />

2. 对称密钥被中间人拦截

   <img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324185438835.png" alt="image-20220324185438835" style="zoom:33%;" />

### 非对称加密算法 RSA

[RSA算法原理 阮一峰](https://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)

此处先介绍一下非对称密钥

【简介】：非对称密钥有2把钥匙，公钥：所有人都可以获取到。私钥：只有自己保管

是单向的。

即：公钥加密则只能私钥打开，私钥加密则只能公钥打开。

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324184456556.png" alt="image-20220324184456556" style="zoom:33%;" />

一般都是使用公钥加密，因此，只要私钥不泄露都是安全的

### 对称+非对称

HTTPS采用了两者结合的方式传输。

【采用的原因】：对称密钥加密方式很好，但密钥会在传输过程中看见。那么我们需要保证对称密钥的安全。用 `非对称密钥`来传输`对称密钥` 给服务器就可以保证 `对称密钥`不是明文传输了。

> 为什么要用对称密钥来加密数据而不直接用非对称密钥：因为非对称算法加密大量数据非常慢，所以要用对称算法

【缺陷】：中间人可以伪装成一个服务器and客户端结合体，并且自己创建一对公私钥。



【传输过程】：

- 对称+非对称发送方式

1. 服务器生成`公私钥`，并且将`公钥`告诉服务器
2. 客户端生成一对`对称密钥` ， 将 `对称密钥`用 `公钥` 加密后传输给服务器。 服务器用自己的 `私钥`解密后获得 和客户端一样的`对称密钥`
3. 现在客户端服务器都有了相同的 `对称密钥` 这时可以使用`对称密钥`对所有的请求and响应加密后直接传输

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324185717122.png" alt="image-20220324185717122" style="zoom: 50%;" />



- 被中间人拦截:中间人伪造一个 `客户端+服务器结合体`并自己产生公私钥

   对客户端来说他是 `服务器`，对服务器来说他是客户端。 

   这时候真正的client server都和中间人对话，他们都以为自己在和对方对话

   ![image-20220324190242087](pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324190242087.png)



[面试官：为什么HTTPS是安全的](https://link.juejin.cn/?target=https%3A%2F%2Fmp.weixin.qq.com%2Fs%2FeAXZ-SIrO3roN2dxdy-A2Q)

[为什么说HTTPS比HTTP安全呢](https://juejin.cn/post/6968825562429128712#heading-7)

## 3 CA认证体系



浏览器拿到了服务端的[数字证书](https://www.zhihu.com/search?q=数字证书&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1914075935})后，要怎么校验该数字证书是真实有效的呢？

#### 数字证书

**是什么**？ 数字证书包含了：

- 公钥；
- 持有者信息；
- 证书认证机构（CA）的信息；
- CA 对这份文件的数字签名及使用的算法；
- [证书有效期](https://www.zhihu.com/search?q=证书有效期&search_source=Entity&hybrid_search_source=Entity&hybrid_search_extra={"sourceType"%3A"answer"%2C"sourceId"%3A1914075935})；
- 还有一些其他额外信息；



**作用**：

如上面 `对称+非对称`方式传输数据的缺陷。为了保证公钥来源可信，防止是中间人伪造的



#### CA是什么

 CA （*Certificate Authority*，证书认证机构）签名的，CA 就是网络世界里的公安局、公证中心，具有极高的可信度，所以由它来给各个公钥签名，信任的一方签发的证书，那必然证书也是被信任的。



#### **数字证书的签发&校验过程**

<img src="pic/HTTP%20%E5%92%8C%20HTTPS%20%E7%9A%84%E5%8C%BA%E5%88%AB.assets/image-20220324200950556.png" alt="image-20220324200950556" style="zoom:50%;" />

- **数字签名**过程：
1. CA将持有者（服务器）的公钥、用途、颁发者、有效时间等信息打成一个包，并进行hash计算得到`Hash Value` 

2. CA用自己的私钥加密 `Hash Value` 生成数字签名。 至此数字证书生成(包含刚刚的打包文件and数字签名)

- 客户端校验过程：

   1. client收到数字证书后对那一包蓝色信息也进行Hash算法，生成 `Hash Value 1` 。 
   2. 用公钥对数字签名解密得到 `Hash Value 2`

   3. 如果H1 == H2则说明证书可以信任。

[浏览器如何验证HTTPS证书的合法性？ - 小林coding的回答 - 知乎](https://www.zhihu.com/question/37370216/answer/1914075935)

#### 证书链

[证书链](https://www.jianshu.com/p/46e48bc517d0)





## 参考

【全部参考链接汇总】

[浏览器如何验证HTTPS证书的合法性？ - 小林coding的回答 - 知乎]( https://www.zhihu.com/question/37370216/answer/1914075935)

[为什么说HTTPS比HTTP安全呢：科普性最好](https://juejin.cn/post/6968825562429128712)



# 四、HTTPS与HTTP的区别？