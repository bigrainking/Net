

# 回答

1. 【端口】：HTTPS：443 HTTP：80
2. 【CA认证服务器】HTTPS需要向CA认证机构申请数字证书，来确保服务器身份可信
3. 【连接建立】HTTP只需要四次握手协议建立即可传输，HTTPS需要握手后建立`TLS/SSL`的握手过程
4. 【明文密文传输】HTTP是信息明文传输，有安全隐患。HTTPS在TCP和HTTP应用层之间加入了TCL/SSL协议保证了安全，让报文可以加密传输

[小林](https://xiaolincoding.com/network/2_http/http_interview.html#http-%E4%B8%8E-https-%E6%9C%89%E5%93%AA%E4%BA%9B%E5%8C%BA%E5%88%AB)