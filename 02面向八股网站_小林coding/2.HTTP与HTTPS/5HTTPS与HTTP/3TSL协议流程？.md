

[toc]



# HTTPS的建立



## 一、TSL协议流程

[下面图片来源-B站视频讲解](https://www.bilibili.com/video/BV1Sg411A79a?p=4&vd_source=47272764e1eb400edc65776bfe6a48af)

1. 【为了安全传递对称密钥】Client向Server请求公钥证书
2. 【传递对称密钥】Client用获得的公钥加密`对称密钥`传递给Server
3. 【传递信息】Client与Server同时拥有对称密钥，可以安全地直接传递报文信息

> 前面两步是TSL握手阶段，也就是建立过程

### 1 向Server请求公钥证书：

![image-20220613212416096](pic/2HTTPS%E5%A6%82%E4%BD%95%E5%BB%BA%E7%AB%8B%E8%BF%9E%E6%8E%A5%E7%9A%84%EF%BC%9F.assets/image-20220613212416096.png)

> 【保证`会话密钥`安全 】为了能够安全地将`对称密钥`(也叫会话密钥)传递到Server手中，需要对`对称密钥`加密。



##### 1)加密的办法：

用Server发来的公钥A对`会话密钥`加密，然后传输给Server,Server用私钥解开。

- 因为是用公钥A加密的，因此有且只能由Server手里的配对的私钥A才能解开



##### 2)公钥的生成与发送

- 这一步使用了公私钥非对称加密，后续就不会再使用

> Hacker会伪造一对公私钥，Client如果用Hacker的公钥对自己的会话密钥加密后，Hacker就可以用自己的私钥解开获得`会话密钥` 
>
> - 因此需要确定保证 公钥的来源是服务器



**为服务器的公钥配证书，确保公钥来源**



1. **认证机构颁发证书**
   1. 认证机构用`机构私钥B`为Server的公钥A、Server的域名等等的集合 加密生成 `ServerA的公钥证书`
   2. 认证机构的`机构公钥B`分发到各个客户端中
2. **Client请求服务器证书**
   1. Client想要公钥，Server将自己的 `ServerA的公钥证书`发送给Client
   2. Client通过`机构公钥B`对服务器 `ServerA的公钥证书`解密，能够解开则说明这是Server发来的公钥
      - 不能解开说明是hacker的公钥
3. 至此，Client成功拥有了服务器的公钥





### 2 生成会话密钥

浏览器用 服务器的公钥加密后 将自己的会话密钥发送给 服务器

> 为了传递信息，对信息加密，需要用`会话密钥`对信息加密。因此需要生成会话密钥 `会话密钥`，并安全地传递给Server
>
> - Hacker可能截取`会话密钥`，因此需要Client对 `会话密钥`加密



##### 1)会话密钥加密过程：

- 用Server的`公钥A` 对 自己生成的`会话密钥` 加密 ， 生成密文， 传输

- Server收到密文后，用 `公钥A`对应的`私钥A`解密，获得 `会话密钥`

![image-20220613213116378](pic/1HTTPS%E5%A6%82%E4%BD%95%E5%BB%BA%E7%AB%8B%E8%BF%9E%E6%8E%A5%E7%9A%84%EF%BC%9F.assets/image-20220613213116378.png)



### 3 用会话密钥 加密报文 从此以后可以传输

- 至此，Server Client可以使用 `会话密钥` 对报文加密解密来传递报文信息







## 二、TLS握手过程

[小林-代码图片来源](https://mp.weixin.qq.com/s?__biz=MzUxODAzNDg4NQ==&mid=2247487650&idx=1&sn=dfee83f6773a589c775ccd6f40491289&scene=21#wechat_redirect)[小林面试题总结-抽象图片来源](https://xiaolincoding.com/network/2_http/http_interview.html#https-%E6%98%AF%E5%A6%82%E4%BD%95%E5%BB%BA%E7%AB%8B%E8%BF%9E%E6%8E%A5%E7%9A%84-%E5%85%B6%E9%97%B4%E4%BA%A4%E4%BA%92%E4%BA%86%E4%BB%80%E4%B9%88)

> 上面只是抽象地说明了TLS发送信息的过程，下面从实际说明
>
> - TLS握手一共需要发送四个信息，2个RTT时延

<img src="pic/6HTTP%E5%BB%BA%E7%AB%8B%E8%BF%9E%E6%8E%A5%E7%9A%84%E8%BF%87%E7%A8%8B%EF%BC%9F%E4%BA%A4%E6%8D%A2%E4%BA%86%E5%93%AA%E4%BA%9B%E4%BF%A1%E6%81%AF%EF%BC%9F.assets/23-HTTPS%E5%B7%A5%E4%BD%9C%E6%B5%81%E7%A8%8B.webp" style="zoom: 67%;" />

### 1 建立TLS连接的详细流程：

四次握手建立连接后，开始建立TLS连接

![image-20220615175652991](pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615175652991.png)

#### 1)Client Hello

Client发送三个信息

- 客户端随机数Random
- Client版本号
- 密码套件列表

<img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615175719494.png" alt="image-20220615175719494" style="zoom: 25%;" />

#### 2)Server Hello

<img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615180100174.png" alt="image-20220615180100174" style="zoom: 50%;" />

Server 发送三个信息：

- `Server Hello`：Hello、服务器随机数、确认TLS的版本

   <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615175842650.png" alt="image-20220615175842650" style="zoom:25%;" />

- `Certificate`：数字证书 包含Server的公钥

<img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615175930112.png" alt="image-20220615175930112" style="zoom:25%;" />

- `Server Hello Done`：表明所有信息已经发送完毕

   <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615180020603.png" alt="image-20220615180020603" style="zoom:25%;" />

#### 3)Client Key Exchange\Change\Finished

<img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615182644779.png" alt="image-20220615182644779" style="zoom: 50%;" /> <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615182658727.png" alt="image-20220615182658727" style="zoom:50%;" />

客户端拿到信息之后

1. 用缓存的机构公钥验证数字证书，验证成功后获得 `Server公钥`；
2. 自己生成 `Pre-master`
3. Client发送的信息：

- `Client Key Exchange`：该报文包含了被 Server公钥加密的`Pre-master`

   > 此时，双方都拥有了合成 `会话密钥` 的三件套信息

   <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615181959684.png" alt="image-20220615181959684" style="zoom: 33%;" />

- `Change Cipher Spec`【告诉你以后都用会话密钥】:表明之后使用`会话密钥`通信

   <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615182151734.png" alt="image-20220615182151734" style="zoom: 33%;" />

- `Encrypted Handshake Message`【所有数据的加密】：

   客户端保证之前发送的信息没有被篡改过，因此将之前发送的信息全部打包生成一个摘要并用会话密钥加密，发送给Server，Server解密

   <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615182338471.png" alt="image-20220615182338471" style="zoom:33%;" />

#### 4)Server Finished

Server同样发送 `Change Cipher Spec` +`Encrypted Handshake Message`

> 如果双方用 `会话密钥`加密解密后都没有问题，TLS正式握手完成



### 2 客户端生成会话密钥全过程

在第一部分中，我们简化为客户端直接用Server的公钥加密 `会话密钥`然后传输给Server，实际上非也。公钥加密的是一个`Pre-meter`随机数，并且传给了Server



**过程如下**

1. Client 在 `Client Hello` 第一次发出信息时候发送 `Client随机数`

2. Server 在 `Server Hello` 第一次回应Client时候发送 `Server随机数`

3. Client第二次请求：Client验证数字证书真实后获得 `服务器公钥`，生成 `Pre-master` 

   **用Server公钥加密 `Pre-master`并发送给Server**

   同时自己手里的 **`Pre-master` 此时还有 `Client随机数` + `Server随机数` **：**凑齐一整套生成`会话密钥`**

4. Server私钥解密获得 **`Pre-master` 此时还有 `Client随机数` + `Server随机数` ：凑齐一整套生成`会话密钥`**



<img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615181127046.png" alt="image-20220615181127046" style="zoom: 50%;" />            <img src="pic/3TSL%E5%8D%8F%E8%AE%AE%E6%B5%81%E7%A8%8B%EF%BC%9F.assets/image-20220615181434866.png" alt="image-20220615181434866" style="zoom: 50%;" /> 

