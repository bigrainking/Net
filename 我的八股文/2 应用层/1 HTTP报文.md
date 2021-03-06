[toc]



# 1 HTTP的请求和响应报文

HTTP的头域包括通用头、请求头、响应头和实体头四个部分。



**相关问题：**

- HTTP头部包含了哪些部分，分别说明？
- 请求报文的构成？

- 请求头(下图中仅有一部分)每个字段的含义？



## 1.0 几个头部的说明

- 通用头部：客户端、服务请均可使用的头部，在两者之间提供有用的功能，如Date
- 请求头部：客户端专用。向服务器提供额外信息，如客户端接收什么类型的数据
- 响应头部：服务器为了便于客户端，如让客户端知道自己在与什么样类型的服务器交互，Server字段
- 实体头部：指对应于实体部主体部分的头部，如Content-Type 说明了实体的类型

## 1.1 请求报文的构成

请求行、请求头部、空行、请求数据

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317145735683.png" alt="image-20220317145735683" style="zoom:50%;" />

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/HTTP_RequestMessageExample.png" style="zoom: 80%;" />

### 1. 常见字段

**通用字段**

| 协议头        |                            |
| ------------- | -------------------------- |
| Connection    | 客户端想优先使用的连接类型 |
| Cache-Control | 请求是否存在缓存机制       |
| Date          | 报文创建时间               |



**请求头部**

- 只在请求报文中， 说明了客户端的情况

| 协议头          |                                                  | 举例                      |
| --------------- | ------------------------------------------------ | ------------------------- |
| Host            | 服务器地址and端口号                              | `www.baidu.com:8080`      |
| Accept          | 接受什么样的媒体类型                             | Accept: text/plain        |
| user-agent      | 表示发出请求的具体程序，相当于是浏览器的自身标识 |                           |
| Accept-Encoding | 接受的编码方法                                   | Accept-Encoding:gzip,sdch |

user-agent : 表示发出请求的具体程序，相当于是浏览器的自身标识

- GET请求


<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220316211817083.png" alt="image-20220316211817083" style="zoom:50%;" />

请求由以下元素组成：

> - 【一个HTTP的[method](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)】，经常是由一个动词像[`GET`](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods/GET), [`POST`](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods/POST) 或者一个名词像[`OPTIONS`](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods/OPTIONS)，[`HEAD`](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Methods/HEAD)来定义客户端的动作行为。通常客户端的操作都是获取资源（GET方法）或者发送[HTML form](https://developer.mozilla.org/zh-CN/docs/Learn/Forms)表单（POST方法），虽然在一些情况下也会有其他操作。
> - 【请求的URL地址】，通常是上下文中就很明显的元素资源的URL，它没有[protocol](https://developer.mozilla.org/zh-CN/docs/Glossary/Protocol) （`http://`），[domain](https://developer.mozilla.org/zh-CN/docs/Glossary/Domain)（`developer.mozilla.org`），或是TCP的[port (en-US)](https://developer.mozilla.org/en-US/docs/Glossary/Port)（HTTP一般在80端口）。
> - HTTP协议版本号。
> - 【请求头】为服务端表达其他信息的可选头部[headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)。
> - 对于一些像POST这样的方法，报文的body就包含了发送的资源，这与响应报文的body类似。

- POST请求

   ![image-20220316211924611](pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220316211924611.png)



## 1.2 响应报文构成

响应报文的构成:

- 状态行、响应头部、空行、响应正文

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317145644806.png" alt="image-20220317145644806" style="zoom: 50%;" />

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317145627229.png" alt="image-20220317145627229" style="zoom: 50%;" />

### 1. **响应头部**

- 给客户端提供了额外的信息，让客户端做出更好的响应。 例如谁在发起响应， 响应者的一些功能



**常用字段**

| 字段           | 功能                 |      |
| -------------- | -------------------- | ---- |
| Server         | 告知客户端服务器信息 |      |
| Content-Length | 返回内容字节的长度   |      |
| Content-Type   | 响应正文的MIME类型   |      |



**200响应**

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317145928937.png" alt="image-20220317145928937" style="zoom:50%;" />

404响应

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317152043106.png" alt="image-20220317152043106" style="zoom:50%;" />

其他字段：

响应头部

<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317152231861.png" alt="image-20220317152231861" style="zoom:50%;" />

## 1.3  实体头部：

实体头部向接受者提供了关于实体的信息，如实体的类型、字段长度、对资源能够使用的有效请求方法等。

让接受者知道自己在处理什么样的信息。

请求报文and响应报文都可以包含实体信息。

- 实体信息由：实体头部and实体组成





<img src="pic/2%20%E5%BA%94%E7%94%A8%E5%B1%82.assets/image-20220317152258357.png" alt="image-20220317152258357" style="zoom:50%;" />





## 参考链接：

[HTTP头部](https://www.cnblogs.com/onepixel/articles/7545959.html)

[头部所有字段含义](https://juejin.cn/post/6932001161532669960#heading-9)

# 2 HTTP的方法有哪些？

HTTP/1.0定义了 GET、POST、HEAD

HTTP/1.1定义了六种OPTIONS, PUT, PATCH, DELETE, TRACE 和 CONNECT 

| 方法         | 作用                                                         |
| ------------ | ------------------------------------------------------------ |
| GET          | `获取资源` 客户端请求服务器指定页面资源                      |
| POST         | `传输实体` 主要用于传输数据，GET主要用于获取资源             |
| HEAD         | `获取资源首部` 作用与GET类似都是发出请求，但不会返回报文的实体主体部分。用于确认URL的有效性and资源的更新时间等 |
| PUT          | `上传文件` 替换指定文件,没有就新增。 自身不带验证机制，任何人都可以上传，有安全隐患。一般不使用 |
| DELETE       | `删除文件` 与PUT相反，也不带验证机制。客户端请求服务删除资源，但是否删由Server决定 |
| PATCH        | `修改文件` PUT可以直接替换文件造成完全修改， PATCH可以部分修改 |
| OPTIONS      | `获取方法` 查看某个URL支持哪些方法：如GET、PUT、POST等       |
| TRACE        | `追踪` 客户端请求发出后可能经过网关、代理，原始请求被改变，Client可以看到最终的请求是什么样子.  常用诊断请求能否到达服务器，且不能有主体部分 |
| Connect(no?) | 要求在与代理服务器通信时建立隧道                             |

主要参考：

[计算机网络突击面试](https://juejin.cn/post/6932001161532669960#heading-13)

[八股文](https://github.com/frank-lam/fullstack-tutorial/blob/master/notes/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%BD%91%E7%BB%9C.md#%E7%AC%AC%E4%BA%8C%E9%83%A8%E5%88%86%E5%BA%94%E7%94%A8%E5%B1%82http)

[这一次,让我们再深入一点 - HTTP报文](https://juejin.cn/post/6844903545339166727#heading-3)

# 3  响应状态码

[说说HTTP 常见的状态码有哪些，适用场景？](https://github.com/febobo/web-interview/issues/144)

### 各个状态码分类

| 1**  | 信息, Server成功收到请求，客户端需要继续发送信息 |
| ---- | ------------------------------------------------ |
| 2**  | 成功，Server成功处理请求并处理。                 |
| 3**  | 重定向：完成了请求，还需要进一步的操作           |
| 4**  | 客户端错误                                       |
| 5**  | 服务器错误                                       |

### 具体状态码

**1xx**

代表请求已被接受，需要继续处理。这类响应是临时响应，只包含状态行和某些可选的响应头信息，并以空行结束

常见的有：

- 100（客户端继续发送请求，这是临时响应）：这个临时响应是用来通知客户端它的部分请求已经被服务器接收，且仍未被拒绝。客户端应当继续发送请求的剩余部分，或者如果请求已经完成，忽略这个响应。服务器必须在请求完成后向客户端发送一个最终响应
- 101：服务器根据客户端的请求切换协议，主要用于websocket或http2升级

**2xx**

代表请求已成功被服务器接收、理解、并接受

常见的有：

- 200（成功）：请求已成功，请求所希望的响应头或数据体将随此响应返回
- 201（已创建）：请求成功并且服务器创建了新的资源
- 202（已创建）：服务器已经接收请求，但尚未处理
- 203（非授权信息）：服务器已成功处理请求，但返回的信息可能来自另一来源
- 204（无内容）：服务器成功处理请求，但没有返回任何内容
- 205（重置内容）：服务器成功处理请求，但没有返回任何内容
- 206（部分内容）：服务器成功处理了部分请求

**3xx**

表示要完成请求，需要进一步操作。 通常，这些状态代码用来重定向

常见的有：

- 300（多种选择）：针对请求，服务器可执行多种操作。 服务器可根据请求者 (user agent) 选择一项操作，或提供操作列表供请求者选择
- 301（永久移动）：请求的网页已永久移动到新位置。 服务器返回此响应（对 GET 或 HEAD 请求的响应）时，会自动将请求者转到新位置
- 302（临时移动）： 服务器目前从不同位置的网页响应请求，但请求者应继续使用原有位置来进行以后的请求
- 303（查看其他位置）：请求者应当对不同的位置使用单独的 GET 请求来检索响应时，服务器返回此代码
- 305 （使用代理）： 请求者只能使用代理访问请求的网页。 如果服务器返回此响应，还表示请求者应使用代理
- 307 （临时重定向）： 服务器目前从不同位置的网页响应请求，但请求者应继续使用原有位置来进行以后的请求

**4xx**

代表了客户端看起来可能发生了错误，妨碍了服务器的处理

常见的有：

- 400（错误请求）： 服务器不理解请求的语法
- 401（未授权）： 请求要求身份验证。 对于需要登录的网页，服务器可能返回此响应。
- 403（禁止）： 服务器拒绝请求
- 404（未找到）： 服务器找不到请求的网页
- 405（方法禁用）： 禁用请求中指定的方法
- 406（不接受）： 无法使用请求的内容特性响应请求的网页
- 407（需要代理授权）： 此状态代码与 401（未授权）类似，但指定请求者应当授权使用代理
- 408（请求超时）： 服务器等候请求时发生超时

**5xx**

表示服务器无法完成明显有效的请求。这类状态码代表了服务器在处理请求的过程中有错误或者异常状态发生

常见的有：

- 500（服务器内部错误）：服务器遇到错误，无法完成请求
- 501（尚未实施）：服务器不具备完成请求的功能。 例如，服务器无法识别请求方法时可能会返回此代码
- 502（错误网关）： 服务器作为网关或代理，从上游服务器收到无效响应
- 503（服务不可用）： 服务器目前无法使用（由于超载或停机维护）
- 504（网关超时）： 服务器作为网关或代理，但是没有及时从上游服务器收到请求
- 505（HTTP 版本不受支持）： 服务器不支持请求中所用的 HTTP 协议版本

### 常见状态码

100

200：【成功】 client收到 200说明 `get/post`请求成功。请求所想要的数据体也会跟着一起返回给client

301：【永久移动】请求的资源已经移动到新的URI，并且服务器会返回新的URI。 今后客户端的访问都会用新的URI代替

302：【临时移动】请求资源临时移动， 客户端继续使用原来的URI

403：【拒绝】Server理解client的请求，但是拒绝了该请求

404：【找不到】Server找不到所请求的网页

500：【内部错误】Server内部错误

503：【服务不可用】Server暂时不可用，如超载or停机维护中

504：【网关超时】Server作为网关or代理服务器，没有收到来自上游服务器的请求



**面试问题：**

说说几个状态码的区别



[说说HTTP常见状态码](https://github.com/febobo/web-interview/issues/144)

[菜鸟教程](https://www.runoob.com/http/http-status-codes.html)

[常见状态码-掘金](https://juejin.cn/post/6844904152179425294#heading-1)



# 4 Keepalive - 非keepalive的区别

HTTP/1.1 使用的是keep-alive保持连接， 而之前的版本使用的是非keep alive

- 【**非keep-alive**】 每次Server与Client都要建立TCP连接，请求处理完成之后立刻关闭连接，服务器不跟踪每个客户也不记录过去的请求。每次建立连接耗时耗费资源。为了节约时间资源，需要重用连接

- 【**keep-alive**】HTTP/1.1后默认使用keepalive，Server在响应后保持TCP连接，并且后续的响应报文和Client后面的请求可以同时使用该连接。甚至位于同一台服务器的多个 Web 页面在从该服务器发送给同一个客户机时，可以在单个持久 TCP 连接上进行

- 【**timeout的设置**】长时间保持连接容易导致资源被无效的占用，从而keep-alive比非ka更浪费资源时间，因此需要给keep-alive设置 timeout参数，在TCP连接完成最后一次响应之后，连接保持keep-alive timeout的时间之后断开连接。

   下面是两者的区别

<img src="pic/1 HTTP.assets/image-20220323162632150.png" alt="image-20220323162632150" style="zoom: 33%;" />

- 使用长连接的HTTP协议，会在响应头加入这行代码：

   ```http
   Connection:keep-alive
   ```



## 4.1 长短连接的使用场景

- 长：keep-alive ：用于 1. 频繁操作 2. 点对点通讯 3. 客户端连接较少的情况。 如即时通讯、网络游戏
- 短的：客户端数量庞大，如淘宝京东的客户端数量高达千万上亿， 使用短连接，避免长连接服务端大量资源被长时间占用

[LeetBook](https://juejin.cn/post/6932001161532669960#heading-11)

