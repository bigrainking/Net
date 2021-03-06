

# 未解决问题

> 1. HTTP`灵活易于扩展`



# 一、简单回答



# 一、HTTP优点缺点有哪些-详细说明

此处说的是HTTP/1.1, HTTP/1.1目前已经使用20年，是目前最流行的版本



## HTTP优点

> 简单、`灵活易于扩展`|应用广泛跨平台
>
> - 灵活易于扩展需要补充



#### 1)**简单**

构成简单，**易于理解**.HTTP报文由header+body组成，header中由key-value 构成。





#### 2)**灵活易于扩展**

抄的[地址，还没有理解知识ku](https://xiaolincoding.com/network/2_http/http_interview.html#http-1-1-%E7%9A%84%E4%BC%98%E7%82%B9%E6%9C%89%E5%93%AA%E4%BA%9B)

- HTTP的请求方法、状态码、头字段等没有被"写死", 因此开发人员可以自定and扩充。缺功能可以自己补上去一个字段

> “请勿跟踪”所使用的头字段 DNT（Do Not Track）就是一个很好的例子。它最早由 Mozilla 提出，用来保护用户隐私，防止网站监测追踪用户的偏好。不过可惜的是 DNT 从推出至今有差不多七八年的历史，但很多网站仍然选择“无视”DNT。虽然 DNT 基本失败了，但这也正说明 HTTP 协议是“灵活自由的”，不会受单方面势力的压制。

- HTTP还在可靠传输上表现灵活：HTTP属于应用层协议，他不限制下层协议，并且上层保持稳定。比如，SSL/TLS

   

3)**应用广泛and跨平台**

- 应用广泛：从台式机的浏览器到手机上的APP都可以用，应用广泛。

- ”跨平台、跨语言“：HTTP不限制语言和操作系统，每一种语言都有HTTP的调用库



## HTTP缺点

> [无状态、明文传输]双刃剑、不安全

#### 1）**无状态**：

服务器不会记录请求的状态信息，所有的客户端都是一样的无状态的

- 好处：

   1. 服务器不会浪费资源来记录状态信息，减轻服务器的负担，将更多的CPU用于对外提供服务
   2. ”无状态“表明服务器也是无状态的一样的，服务器易于组成集群，请求可以被负载均衡转发到任意一台服务器是上，不会因为服务器状态不一致导致差错

- 坏处：对于连贯性的操作不仅麻烦还浪费了信息传输的流量。

   执行“登录-下订单-结算-购买”这样的操作，每一步都需要用户信息，但是由于服务器没有“记忆功能”他需要每次都询问客户端用户信息。导致每次传输浪费流量

##### Cookie：

> 客户端第一次发出请求后，服务器会给客户端发送一个有客户端信息的“小甜饼”，每次客户端再请求就会带上 “小甜饼”，服务器一看到这个小甜饼就知道是哪个客户端了

cookie可以让HTTP既减轻Server负担，又可以记住状态

1. Client第一次发出请求

2. server收到请求，并在response中加入Cookie，cookie中记住客户端状态

3. Client收到Response并保存Cookie

   --------------------------------

4. Client第二次请求，Requests中带上Cookie

5. Server查看Cookie，获得上次请求后Client的状态信息

6. 响应

<img src="pic/1HTTP(1.1)%E7%9A%84%E4%BC%98%E7%BC%BA%E7%82%B9%E6%9C%89%E5%93%AA%E4%BA%9B%EF%BC%9F.assets/image-20220613161250598.png" alt="image-20220613161250598" style="zoom:33%;" /> 

 <img src="pic/1HTTP(1.1)%E7%9A%84%E4%BC%98%E7%BC%BA%E7%82%B9%E6%9C%89%E5%93%AA%E4%BA%9B%EF%BC%9F.assets/image-20220613161305429.png" alt="image-20220613161305429" style="zoom:33%;" />

#### 2）**明文传输**

“明文”是指报文的header不使用二进制数据，使用简单易读的文本形式

- 好处：相比于TCP、UDP这种二进制协议，他的优点明显，通过抓包获取数据后不需要借助任何软件肉眼可以查看and修改报文，**易于调试**

- 坏处：

   HTTP传输链路上所有信息都被暴露，非常的不安全，可以对整个通信进行窥探

#### 3）**不安全**：

不安全与 “明文传输”相关但不等同

不安全主要是： **身份认证**and **完整性校验**

- **身份校验机制**：HTTP没有身份校验机制，不会验证通信方的身份信息，可能会访问一个假的PDD、淘宝网站，那么钱没了

- **完整性校验**：信息在传输过程中可能被篡改，而不知道信息的真伪。

   虽然MD5可以给报文加上数字摘要，但由于HTTP是明文传输，因此Hacker可以直接修改数字摘要和报文。

# 参考文献

[技术文章摘抄](https://learn.lianglianglee.com/%E4%B8%93%E6%A0%8F/%E9%80%8F%E8%A7%86HTTP%E5%8D%8F%E8%AE%AE/14%20%20HTTP%E6%9C%89%E5%93%AA%E4%BA%9B%E4%BC%98%E7%82%B9%EF%BC%9F%E5%8F%88%E6%9C%89%E5%93%AA%E4%BA%9B%E7%BC%BA%E7%82%B9%EF%BC%9F.md)



[小林coding](https://xiaolincoding.com/network/2_http/http_interview.html#http-%E7%89%B9%E6%80%A7)







