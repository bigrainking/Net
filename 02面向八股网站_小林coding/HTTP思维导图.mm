
<map>
  <node ID="root" TEXT="HTTP">
    <node TEXT="HTTP缓存" ID="NORG4edMUb" _mubu_text="%3Cspan%3EHTTP%E7%BC%93%E5%AD%98%3C/span%3E" STYLE="bubble" POSITION="default">
      <node TEXT="强制缓存" ID="YKLINP4Q8O" _mubu_text="%3Cspan%3E%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%3C/span%3E" STYLE="fork">
        <node TEXT="HTTP/1.0：Expires" ID="hMQ8tDHfuV" _mubu_text="%3Cspan%3EHTTP/1.0%EF%BC%9AExpires%3C/span%3E" STYLE="fork">
          <node TEXT="客户端通过本地时间与Expires绝对时间判断资源是否过期" ID="6zo4ozWYFD" _mubu_text="%3Cspan%3E%E5%AE%A2%E6%88%B7%E7%AB%AF%E9%80%9A%E8%BF%87%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%E4%B8%8EExpires%E7%BB%9D%E5%AF%B9%E6%97%B6%E9%97%B4%E5%88%A4%E6%96%AD%E8%B5%84%E6%BA%90%E6%98%AF%E5%90%A6%E8%BF%87%E6%9C%9F%3C/span%3E" STYLE="fork"/>
          <node TEXT="缺点：Expires是绝对时间，如果修改本地时间就可能导致强制缓存无法命中" ID="6vAGHtK83E" _mubu_text="%3Cspan%3E%E7%BC%BA%E7%82%B9%EF%BC%9AExpires%E6%98%AF%E7%BB%9D%E5%AF%B9%E6%97%B6%E9%97%B4%EF%BC%8C%E5%A6%82%E6%9E%9C%E4%BF%AE%E6%94%B9%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%E5%B0%B1%E5%8F%AF%E8%83%BD%E5%AF%BC%E8%87%B4%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%E6%97%A0%E6%B3%95%E5%91%BD%E4%B8%AD%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="HTTP/1.1：Cache-Control:max-age" ID="LZk7YwFAVB" _mubu_text="%3Cspan%3EHTTP/1.1%EF%BC%9ACache-Control:max-age%3C/span%3E" STYLE="fork">
          <node TEXT="Cache-Control是一个时间段，客户端用本地第一次请求的时间计算出过期时间，再用当前本地时间与之对比，来确定资源是否过期" ID="yR7T0xOpeW" _mubu_text="%3Cspan%3ECache-Control%E6%98%AF%E4%B8%80%E4%B8%AA%E6%97%B6%E9%97%B4%E6%AE%B5%EF%BC%8C%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%94%A8%E6%9C%AC%E5%9C%B0%E7%AC%AC%E4%B8%80%E6%AC%A1%E8%AF%B7%E6%B1%82%E7%9A%84%E6%97%B6%E9%97%B4%E8%AE%A1%E7%AE%97%E5%87%BA%E8%BF%87%E6%9C%9F%E6%97%B6%E9%97%B4%EF%BC%8C%E5%86%8D%E7%94%A8%E5%BD%93%E5%89%8D%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%E4%B8%8E%E4%B9%8B%E5%AF%B9%E6%AF%94%EF%BC%8C%E6%9D%A5%E7%A1%AE%E5%AE%9A%E8%B5%84%E6%BA%90%E6%98%AF%E5%90%A6%E8%BF%87%E6%9C%9F%3C/span%3E" STYLE="fork"/>
          <node TEXT="优点：两次都是使用的本地时间，因此无论本地时间如何变化修改，不会导致命中失败" ID="9YqD77ZwUc" _mubu_text="%3Cspan%3E%E4%BC%98%E7%82%B9%EF%BC%9A%E4%B8%A4%E6%AC%A1%E9%83%BD%E6%98%AF%E4%BD%BF%E7%94%A8%E7%9A%84%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%EF%BC%8C%E5%9B%A0%E6%AD%A4%E6%97%A0%E8%AE%BA%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%E5%A6%82%E4%BD%95%E5%8F%98%E5%8C%96%E4%BF%AE%E6%94%B9%EF%BC%8C%E4%B8%8D%E4%BC%9A%E5%AF%BC%E8%87%B4%E5%91%BD%E4%B8%AD%E5%A4%B1%E8%B4%A5%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="Cache-Control优先级高于Expires" ID="tp4tDJRIs3" _mubu_text="%3Cspan%3ECache-Control%E4%BC%98%E5%85%88%E7%BA%A7%E9%AB%98%E4%BA%8EExpires%3C/span%3E" STYLE="fork"/>
      </node>
      <node TEXT="区别" ID="RqEyItCcV2" _mubu_text="%3Cspan%3E%E5%8C%BA%E5%88%AB%3C/span%3E" STYLE="fork">
        <node TEXT="强制缓存：是否使用缓存资源的决定权在Client。协商缓存：决定权在Server" ID="9tUs1wMqEy" _mubu_text="%3Cspan%3E%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%EF%BC%9A%E6%98%AF%E5%90%A6%E4%BD%BF%E7%94%A8%E7%BC%93%E5%AD%98%E8%B5%84%E6%BA%90%E7%9A%84%E5%86%B3%E5%AE%9A%E6%9D%83%E5%9C%A8Client%E3%80%82%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%EF%BC%9A%E5%86%B3%E5%AE%9A%E6%9D%83%E5%9C%A8Server%3C/span%3E" STYLE="fork"/>
        <node TEXT="协商缓存会请求服务器，强制缓存不会" ID="PNe7lROkRz" _mubu_text="%3Cspan%3E%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%E4%BC%9A%E8%AF%B7%E6%B1%82%E6%9C%8D%E5%8A%A1%E5%99%A8%EF%BC%8C%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%E4%B8%8D%E4%BC%9A%3C/span%3E" STYLE="fork"/>
      </node>
      <node TEXT="共同点" ID="8z4ppkxeaC" _mubu_text="%3Cspan%3E%E5%85%B1%E5%90%8C%E7%82%B9%3C/span%3E" STYLE="fork">
        <node TEXT="都是从client缓存中加载资源" ID="4IExgVerBv" _mubu_text="%3Cspan%3E%E9%83%BD%E6%98%AF%E4%BB%8Eclient%E7%BC%93%E5%AD%98%E4%B8%AD%E5%8A%A0%E8%BD%BD%E8%B5%84%E6%BA%90%3C/span%3E" STYLE="fork"/>
      </node>
      <node TEXT="协商缓存" ID="zf50nBGhS5" _mubu_text="%3Cspan%3E%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%3C/span%3E" STYLE="fork">
        <node TEXT="原理：" ID="Gi9PgGpJmp" _mubu_text="%3Cspan%3E%E5%8E%9F%E7%90%86%EF%BC%9A%3C/span%3E" STYLE="fork">
          <node TEXT="没有命中强制缓存，则向服务器请求验证是否命中协商缓存。如果命中则返回304Not-Modified" ID="cmMvG3shzu" _mubu_text="%3Cspan%3E%E6%B2%A1%E6%9C%89%E5%91%BD%E4%B8%AD%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%EF%BC%8C%E5%88%99%E5%90%91%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%AF%B7%E6%B1%82%E9%AA%8C%E8%AF%81%E6%98%AF%E5%90%A6%E5%91%BD%E4%B8%AD%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%E3%80%82%E5%A6%82%E6%9E%9C%E5%91%BD%E4%B8%AD%E5%88%99%E8%BF%94%E5%9B%9E304Not-Modified%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="协商缓存是建立在强制缓存的基础之上的，没有强缓存，协商缓存没有意义" ID="fW3y8CgozW" _mubu_text="%3Cspan%3E%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%E6%98%AF%E5%BB%BA%E7%AB%8B%E5%9C%A8%E5%BC%BA%E5%88%B6%E7%BC%93%E5%AD%98%E7%9A%84%E5%9F%BA%E7%A1%80%E4%B9%8B%E4%B8%8A%E7%9A%84%EF%BC%8C%E6%B2%A1%E6%9C%89%E5%BC%BA%E7%BC%93%E5%AD%98%EF%BC%8C%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%E6%B2%A1%E6%9C%89%E6%84%8F%E4%B9%89%3C/span%3E" STYLE="fork"/>
        <node TEXT="HTTP/1.0:Last-Modified If-Modified-Since" ID="bu1uf6oYjK" _mubu_text="%3Cspan%3EHTTP/1.0:%3C/span%3E%3Cspan%20class=%22codespan%22%3ELast-Modified%3C/span%3E%3Cspan%3E%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EIf-Modified-Since%3C/span%3E" STYLE="fork">
          <node TEXT="判断过程" ID="pODlG1qTP6" _mubu_text="%3Cspan%3E%E5%88%A4%E6%96%AD%E8%BF%87%E7%A8%8B%3C/span%3E" STYLE="fork">
            <node TEXT="Last-Modified:第一次请求Response给出的资源最后修改时间" ID="D2Zv11gT7g" _mubu_text="%3Cspan%20class=%22codespan%22%3ELast-Modified%3C/span%3E%3Cspan%3E:%E7%AC%AC%E4%B8%80%E6%AC%A1%E8%AF%B7%E6%B1%82Response%E7%BB%99%E5%87%BA%E7%9A%84%E8%B5%84%E6%BA%90%E6%9C%80%E5%90%8E%E4%BF%AE%E6%94%B9%E6%97%B6%E9%97%B4%3C/span%3E" STYLE="fork"/>
            <node TEXT=" If-Modified-Since：第二次请求时，requests带有此字段来让服务器判断资源是否过期，字段的值 = Last-Modified" ID="CTgL8kfpfo" _mubu_text="%3Cspan%3E%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EIf-Modified-Since%3C/span%3E%3Cspan%3E%EF%BC%9A%E7%AC%AC%E4%BA%8C%E6%AC%A1%E8%AF%B7%E6%B1%82%E6%97%B6%EF%BC%8Crequests%E5%B8%A6%E6%9C%89%E6%AD%A4%E5%AD%97%E6%AE%B5%E6%9D%A5%E8%AE%A9%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%88%A4%E6%96%AD%E8%B5%84%E6%BA%90%E6%98%AF%E5%90%A6%E8%BF%87%E6%9C%9F%EF%BC%8C%E5%AD%97%E6%AE%B5%E7%9A%84%E5%80%BC%20=%20%3C/span%3E%3Cspan%20class=%22codespan%22%3ELast-Modified%3C/span%3E" STYLE="fork"/>
            <node TEXT="服务器对比当前资源最新修改时间和 If-Modified-Since的时间查看是否过期" ID="Caz4ZAt4mB" _mubu_text="%3Cspan%3E%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%AF%B9%E6%AF%94%E5%BD%93%E5%89%8D%E8%B5%84%E6%BA%90%E6%9C%80%E6%96%B0%E4%BF%AE%E6%94%B9%E6%97%B6%E9%97%B4%E5%92%8C%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EIf-Modified-Since%3C/span%3E%3Cspan%3E%E7%9A%84%E6%97%B6%E9%97%B4%E6%9F%A5%E7%9C%8B%E6%98%AF%E5%90%A6%E8%BF%87%E6%9C%9F%3C/span%3E" STYLE="fork"/>
            <node TEXT="没有过期，response 304 Not Modified，Client从本地读取资源" ID="f9UrB834qu" _mubu_text="%3Cspan%3E%E6%B2%A1%E6%9C%89%E8%BF%87%E6%9C%9F%EF%BC%8Cresponse%20304%20Not%20Modified%EF%BC%8CClient%E4%BB%8E%E6%9C%AC%E5%9C%B0%E8%AF%BB%E5%8F%96%E8%B5%84%E6%BA%90%3C/span%3E" STYLE="fork"/>
            <node TEXT="过期了，从服务器获取资源，并更新Last-Modified" ID="EPrC9dnnOP" _mubu_text="%3Cspan%3E%E8%BF%87%E6%9C%9F%E4%BA%86%EF%BC%8C%E4%BB%8E%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%8E%B7%E5%8F%96%E8%B5%84%E6%BA%90%EF%BC%8C%E5%B9%B6%E6%9B%B4%E6%96%B0%3C/span%3E%3Cspan%20class=%22codespan%22%3ELast-Modified%3C/span%3E" STYLE="fork"/>
          </node>
          <node TEXT="缺点：" ID="obYaj8SvCC" _mubu_text="%3Cspan%3E%E7%BC%BA%E7%82%B9%EF%BC%9A%3C/span%3E" STYLE="fork">
            <node TEXT="服务器会出现修改了资源，但资源更新时间还是上一次的情况。导致Client使用了过期资源" ID="9ZCs6UdAu7" _mubu_text="%3Cspan%3E%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%BC%9A%E5%87%BA%E7%8E%B0%E4%BF%AE%E6%94%B9%E4%BA%86%E8%B5%84%E6%BA%90%EF%BC%8C%E4%BD%86%E8%B5%84%E6%BA%90%E6%9B%B4%E6%96%B0%E6%97%B6%E9%97%B4%E8%BF%98%E6%98%AF%E4%B8%8A%E4%B8%80%E6%AC%A1%E7%9A%84%E6%83%85%E5%86%B5%E3%80%82%E5%AF%BC%E8%87%B4Client%E4%BD%BF%E7%94%A8%E4%BA%86%E8%BF%87%E6%9C%9F%E8%B5%84%E6%BA%90%3C/span%3E" STYLE="fork"/>
            <node TEXT="依赖于本地时间、服务器时间。两个任何一个被篡改都会影响命中协商缓存" ID="M92JLm69YG" _mubu_text="%3Cspan%3E%E4%BE%9D%E8%B5%96%E4%BA%8E%E6%9C%AC%E5%9C%B0%E6%97%B6%E9%97%B4%E3%80%81%E6%9C%8D%E5%8A%A1%E5%99%A8%E6%97%B6%E9%97%B4%E3%80%82%E4%B8%A4%E4%B8%AA%E4%BB%BB%E4%BD%95%E4%B8%80%E4%B8%AA%E8%A2%AB%E7%AF%A1%E6%94%B9%E9%83%BD%E4%BC%9A%E5%BD%B1%E5%93%8D%E5%91%BD%E4%B8%AD%E5%8D%8F%E5%95%86%E7%BC%93%E5%AD%98%3C/span%3E" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="HTTP1.1: ETag If-None-Match" ID="4FwNY5yNJA" _mubu_text="%3Cspan%3EHTTP1.1:%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EETag%3C/span%3E%3Cspan%3E%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EIf-None-Match%3C/span%3E" STYLE="fork">
          <node TEXT="ETag:第一次请求，Response发送资源并为资源当前的样子生成一个ETag" ID="mdHdGAKJEh" _mubu_text="%3Cspan%20class=%22codespan%22%3EETag%3C/span%3E%3Cspan%3E:%E7%AC%AC%E4%B8%80%E6%AC%A1%E8%AF%B7%E6%B1%82%EF%BC%8CResponse%E5%8F%91%E9%80%81%E8%B5%84%E6%BA%90%E5%B9%B6%E4%B8%BA%E8%B5%84%E6%BA%90%E5%BD%93%E5%89%8D%E7%9A%84%E6%A0%B7%E5%AD%90%E7%94%9F%E6%88%90%E4%B8%80%E4%B8%AAETag%3C/span%3E" STYLE="fork"/>
          <node TEXT="If-None-Match:第二次请求，带上 If-None-Match:ETag值 是之前Reponse资源的ETag, 服务器对自己当前的资源生成新的ETag。对比两个Etag是否相同" ID="RhE47yWYbC" _mubu_text="%3Cspan%20class=%22codespan%22%3EIf-None-Match%3C/span%3E%3Cspan%3E:%E7%AC%AC%E4%BA%8C%E6%AC%A1%E8%AF%B7%E6%B1%82%EF%BC%8C%E5%B8%A6%E4%B8%8A%20%3C/span%3E%3Cspan%20class=%22codespan%22%3EIf-None-Match:ETag%3C/span%3E%3Cspan%3E%E5%80%BC%20%E6%98%AF%E4%B9%8B%E5%89%8DReponse%E8%B5%84%E6%BA%90%E7%9A%84ETag,%20%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%AF%B9%E8%87%AA%E5%B7%B1%E5%BD%93%E5%89%8D%E7%9A%84%E8%B5%84%E6%BA%90%E7%94%9F%E6%88%90%E6%96%B0%E7%9A%84ETag%E3%80%82%E5%AF%B9%E6%AF%94%E4%B8%A4%E4%B8%AAEtag%E6%98%AF%E5%90%A6%E7%9B%B8%E5%90%8C%3C/span%3E" STYLE="fork"/>
          <node TEXT="【相同】：没有过期，返回304，同时返回新的ETag   (即使没有更新)" ID="J5duesz999" _mubu_text="%3Cspan%3E%E3%80%90%E7%9B%B8%E5%90%8C%E3%80%91%EF%BC%9A%E6%B2%A1%E6%9C%89%E8%BF%87%E6%9C%9F%EF%BC%8C%E8%BF%94%E5%9B%9E304%EF%BC%8C%3C/span%3E%3Cspan%20class=%22%20highlight-yellow%22%3E%E5%90%8C%E6%97%B6%E8%BF%94%E5%9B%9E%E6%96%B0%E7%9A%84ETag%20%20%20(%E5%8D%B3%E4%BD%BF%E6%B2%A1%E6%9C%89%E6%9B%B4%E6%96%B0)%3C/span%3E" STYLE="fork"/>
          <node TEXT="【不同】：过期了，从服务器获取资源，同时更新新的ETag" ID="RF6Hjx5ADz" _mubu_text="%3Cspan%3E%E3%80%90%E4%B8%8D%E5%90%8C%E3%80%91%EF%BC%9A%E8%BF%87%E6%9C%9F%E4%BA%86%EF%BC%8C%E4%BB%8E%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%8E%B7%E5%8F%96%E8%B5%84%E6%BA%90%EF%BC%8C%E5%90%8C%E6%97%B6%E6%9B%B4%E6%96%B0%E6%96%B0%E7%9A%84ETag%3C/span%3E" STYLE="fork"/>
        </node>
      </node>
    </node>
    <node TEXT="HTTP特性" ID="Gm8M237m4z" _mubu_text="%3Cspan%3EHTTP%E7%89%B9%E6%80%A7%3C/span%3E" STYLE="bubble" POSITION="default">
      <node TEXT="优点*3" ID="Mg3alZWiI9" _mubu_text="%3Cspan%3E%E4%BC%98%E7%82%B9*3%3C/span%3E" STYLE="fork">
        <node TEXT="简单" ID="n6c7nv3nLm" _mubu_text="%3Cspan%3E%E7%AE%80%E5%8D%95%3C/span%3E" STYLE="fork">
          <node TEXT="简单易读,header+body,header:key-value" ID="A5GnOgQ68U" _mubu_text="%3Cspan%3E%E7%AE%80%E5%8D%95%E6%98%93%E8%AF%BB,header+body,header:key-value%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="灵活易于扩展" ID="21sUErAMAw" _mubu_text="%3Cspan%3E%E7%81%B5%E6%B4%BB%E6%98%93%E4%BA%8E%E6%89%A9%E5%B1%95%3C/span%3E" STYLE="fork">
          <node TEXT="字段可以扩展" ID="uxq7IHZfL0" _mubu_text="%3Cspan%3E%E5%AD%97%E6%AE%B5%E5%8F%AF%E4%BB%A5%E6%89%A9%E5%B1%95%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="应用广泛，跨平台，跨系统" ID="8iyzBL5N2O" _mubu_text="%3Cspan%3E%E5%BA%94%E7%94%A8%E5%B9%BF%E6%B3%9B%EF%BC%8C%E8%B7%A8%E5%B9%B3%E5%8F%B0%EF%BC%8C%E8%B7%A8%E7%B3%BB%E7%BB%9F%3C/span%3E" STYLE="fork">
          <node TEXT="HTTP不限制语言，操作系统，任何语言都有调用HTTP的库。应用于APP浏览器等" ID="0eLEH8ONoh" _mubu_text="%3Cspan%3EHTTP%E4%B8%8D%E9%99%90%E5%88%B6%E8%AF%AD%E8%A8%80%EF%BC%8C%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F%EF%BC%8C%E4%BB%BB%E4%BD%95%E8%AF%AD%E8%A8%80%E9%83%BD%E6%9C%89%E8%B0%83%E7%94%A8HTTP%E7%9A%84%E5%BA%93%E3%80%82%E5%BA%94%E7%94%A8%E4%BA%8EAPP%E6%B5%8F%E8%A7%88%E5%99%A8%E7%AD%89%3C/span%3E" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="缺点" ID="iHqmdLGBOQ" _mubu_text="%3Cspan%3E%E7%BC%BA%E7%82%B9%3C/span%3E" STYLE="fork">
        <node TEXT="无状态【双刃剑】" ID="D101tFWuVH" _mubu_text="%3Cspan%3E%E6%97%A0%E7%8A%B6%E6%80%81%E3%80%90%E5%8F%8C%E5%88%83%E5%89%91%E3%80%91%3C/span%3E" STYLE="fork">
          <node TEXT="操作失去连贯性、浪费信息传输流量：Cookie" ID="atAwW4Vp7Z" _mubu_text="%3Cspan%3E%E6%93%8D%E4%BD%9C%E5%A4%B1%E5%8E%BB%E8%BF%9E%E8%B4%AF%E6%80%A7%E3%80%81%E6%B5%AA%E8%B4%B9%E4%BF%A1%E6%81%AF%E4%BC%A0%E8%BE%93%E6%B5%81%E9%87%8F%EF%BC%9ACookie%3C/span%3E" STYLE="fork"/>
          <node TEXT="减少了服务器资源占用" ID="AdIAYfEs55" _mubu_text="%3Cspan%3E%E5%87%8F%E5%B0%91%E4%BA%86%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%B5%84%E6%BA%90%E5%8D%A0%E7%94%A8%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="明文传输【双刃剑】" ID="FPUCqQ7u8l" _mubu_text="%3Cspan%3E%E6%98%8E%E6%96%87%E4%BC%A0%E8%BE%93%E3%80%90%E5%8F%8C%E5%88%83%E5%89%91%E3%80%91%3C/span%3E" STYLE="fork">
          <node TEXT="好：便于调试和阅读" ID="f87ajoXaeB" _mubu_text="%3Cspan%3E%E5%A5%BD%EF%BC%9A%E4%BE%BF%E4%BA%8E%E8%B0%83%E8%AF%95%E5%92%8C%E9%98%85%E8%AF%BB%3C/span%3E" STYLE="fork"/>
          <node TEXT="坏：HTTP链路上所有信息都被窥探，信息不安全" ID="Nc7W1swK7s" _mubu_text="%3Cspan%3E%E5%9D%8F%EF%BC%9AHTTP%E9%93%BE%E8%B7%AF%E4%B8%8A%E6%89%80%E6%9C%89%E4%BF%A1%E6%81%AF%E9%83%BD%E8%A2%AB%E7%AA%A5%E6%8E%A2%EF%BC%8C%E4%BF%A1%E6%81%AF%E4%B8%8D%E5%AE%89%E5%85%A8%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="不安全的体现在" ID="dMTow4Hxpd" _mubu_text="%3Cspan%3E%E4%B8%8D%E5%AE%89%E5%85%A8%E7%9A%84%E4%BD%93%E7%8E%B0%E5%9C%A8%3C/span%3E" STYLE="fork">
          <node TEXT="信息完整性校验没有：没有加密，会被篡改" ID="oGcM4giyal" _mubu_text="%3Cspan%3E%E4%BF%A1%E6%81%AF%E5%AE%8C%E6%95%B4%E6%80%A7%E6%A0%A1%E9%AA%8C%E6%B2%A1%E6%9C%89%EF%BC%9A%E6%B2%A1%E6%9C%89%E5%8A%A0%E5%AF%86%EF%BC%8C%E4%BC%9A%E8%A2%AB%E7%AF%A1%E6%94%B9%3C/span%3E" STYLE="fork"/>
          <node TEXT="身份校验机制：hacker会伪造网站" ID="2SsjaulxAX" _mubu_text="%3Cspan%3E%E8%BA%AB%E4%BB%BD%E6%A0%A1%E9%AA%8C%E6%9C%BA%E5%88%B6%EF%BC%9Ahacker%E4%BC%9A%E4%BC%AA%E9%80%A0%E7%BD%91%E7%AB%99%3C/span%3E" STYLE="fork"/>
          <node TEXT="HTTPS完美解决" ID="JoZb6ZQZef" _mubu_text="%3Cspan%3EHTTPS%E5%AE%8C%E7%BE%8E%E8%A7%A3%E5%86%B3%3C/span%3E" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="性能:不好不坏*3" ID="qEOzyCjFtJ" _mubu_text="%3Cspan%3E%E6%80%A7%E8%83%BD:%E4%B8%8D%E5%A5%BD%E4%B8%8D%E5%9D%8F*3%3C/span%3E" STYLE="fork">
        <node TEXT="长连接" ID="ssqoUvb7KW" _mubu_text="%3Cspan%3E%E9%95%BF%E8%BF%9E%E6%8E%A5%3C/span%3E" STYLE="fork">
          <node TEXT="没有一方提出断开连接则保持连接" ID="AyYZTlVASz" _mubu_text="%3Cspan%3E%E6%B2%A1%E6%9C%89%E4%B8%80%E6%96%B9%E6%8F%90%E5%87%BA%E6%96%AD%E5%BC%80%E8%BF%9E%E6%8E%A5%E5%88%99%E4%BF%9D%E6%8C%81%E8%BF%9E%E6%8E%A5%3C/span%3E" STYLE="fork"/>
          <node TEXT="减少了Server与Client建立连接断开连接浪费的通信开销and时间" ID="EuHX9o9xqj" _mubu_text="%3Cspan%3E%E5%87%8F%E5%B0%91%E4%BA%86Server%E4%B8%8EClient%E5%BB%BA%E7%AB%8B%E8%BF%9E%E6%8E%A5%E6%96%AD%E5%BC%80%E8%BF%9E%E6%8E%A5%E6%B5%AA%E8%B4%B9%E7%9A%84%E9%80%9A%E4%BF%A1%E5%BC%80%E9%94%80and%E6%97%B6%E9%97%B4%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="管道机制" ID="5gM6M4vGiM" _mubu_text="%3Cspan%3E%E7%AE%A1%E9%81%93%E6%9C%BA%E5%88%B6%3C/span%3E" STYLE="fork">
          <node TEXT="解决了请求的队头堵塞" ID="uQBGsJRFrk" _mubu_text="%3Cspan%3E%E8%A7%A3%E5%86%B3%E4%BA%86%E8%AF%B7%E6%B1%82%E7%9A%84%E9%98%9F%E5%A4%B4%E5%A0%B5%E5%A1%9E%3C/span%3E" STYLE="fork"/>
          <node TEXT="减少了整体请求响应的时间" ID="5cGrFhl9ka" _mubu_text="%3Cspan%3E%E5%87%8F%E5%B0%91%E4%BA%86%E6%95%B4%E4%BD%93%E8%AF%B7%E6%B1%82%E5%93%8D%E5%BA%94%E7%9A%84%E6%97%B6%E9%97%B4%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="response的队头堵塞" ID="I9R3996GPH" _mubu_text="%3Cspan%3Eresponse%E7%9A%84%E9%98%9F%E5%A4%B4%E5%A0%B5%E5%A1%9E%3C/span%3E" STYLE="fork">
          <node TEXT="管道机制只能不断地发送请求，但response必须按照请求到达的顺序返回。如果有个请求阻塞会导致后面的请求都被阻塞" ID="j0zthRoVQq" _mubu_text="%3Cspan%3E%E7%AE%A1%E9%81%93%E6%9C%BA%E5%88%B6%E5%8F%AA%E8%83%BD%E4%B8%8D%E6%96%AD%E5%9C%B0%E5%8F%91%E9%80%81%E8%AF%B7%E6%B1%82%EF%BC%8C%E4%BD%86response%E5%BF%85%E9%A1%BB%E6%8C%89%E7%85%A7%E8%AF%B7%E6%B1%82%E5%88%B0%E8%BE%BE%E7%9A%84%E9%A1%BA%E5%BA%8F%E8%BF%94%E5%9B%9E%E3%80%82%E5%A6%82%E6%9E%9C%E6%9C%89%E4%B8%AA%E8%AF%B7%E6%B1%82%E9%98%BB%E5%A1%9E%E4%BC%9A%E5%AF%BC%E8%87%B4%E5%90%8E%E9%9D%A2%E7%9A%84%E8%AF%B7%E6%B1%82%E9%83%BD%E8%A2%AB%E9%98%BB%E5%A1%9E%3C/span%3E" STYLE="fork"/>
          <node TEXT="完全解决是在HTTP/2" ID="ZRz6EqeiKd" _mubu_text="%3Cspan%3E%E5%AE%8C%E5%85%A8%E8%A7%A3%E5%86%B3%E6%98%AF%E5%9C%A8HTTP/2%3C/span%3E" STYLE="fork"/>
        </node>
      </node>
    </node>
    <node TEXT="HTTPS" ID="3INofHif75" _mubu_text="%3Cspan%3EHTTPS%3C/span%3E" STYLE="bubble" POSITION="default">
      <node TEXT="与HTTP区别？4" ID="evPjqiBbxd" _mubu_text="%3Cspan%3E%E4%B8%8EHTTP%E5%8C%BA%E5%88%AB%EF%BC%9F4%3C/span%3E" STYLE="fork">
        <node TEXT="端口：80  443" ID="7C5TpxQyVZ" _mubu_text="%3Cspan%3E%E7%AB%AF%E5%8F%A3%EF%BC%9A80%20%20443%3C/span%3E" STYLE="fork"/>
        <node TEXT="传输：明文传输；加密传输，在应用层有TCP层之间添加了TLS层" ID="MX1W7D4UOS" _mubu_text="%3Cspan%3E%E4%BC%A0%E8%BE%93%EF%BC%9A%E6%98%8E%E6%96%87%E4%BC%A0%E8%BE%93%EF%BC%9B%E5%8A%A0%E5%AF%86%E4%BC%A0%E8%BE%93%EF%BC%8C%E5%9C%A8%E5%BA%94%E7%94%A8%E5%B1%82%E6%9C%89TCP%E5%B1%82%E4%B9%8B%E9%97%B4%E6%B7%BB%E5%8A%A0%E4%BA%86TLS%E5%B1%82%3C/span%3E" STYLE="fork"/>
        <node TEXT="数字证书：HTTPS中服务器需要在CA认证机构认证服务器的身份信息" ID="r9HaPLP3hS" _mubu_text="%3Cspan%3E%E6%95%B0%E5%AD%97%E8%AF%81%E4%B9%A6%EF%BC%9AHTTPS%E4%B8%AD%E6%9C%8D%E5%8A%A1%E5%99%A8%E9%9C%80%E8%A6%81%E5%9C%A8CA%E8%AE%A4%E8%AF%81%E6%9C%BA%E6%9E%84%E8%AE%A4%E8%AF%81%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%9A%84%E8%BA%AB%E4%BB%BD%E4%BF%A1%E6%81%AF%3C/span%3E" STYLE="fork"/>
        <node TEXT="连接建立：HTTP只需要三次握手；HTTPS还要TLS四次握手" ID="5GRl8s7Qy6" _mubu_text="%3Cspan%3E%E8%BF%9E%E6%8E%A5%E5%BB%BA%E7%AB%8B%EF%BC%9AHTTP%E5%8F%AA%E9%9C%80%E8%A6%81%E4%B8%89%E6%AC%A1%E6%8F%A1%E6%89%8B%EF%BC%9BHTTPS%E8%BF%98%E8%A6%81TLS%E5%9B%9B%E6%AC%A1%E6%8F%A1%E6%89%8B%3C/span%3E" STYLE="fork"/>
      </node>
      <node TEXT="解决了HTTPS什么问题？3" ID="hH9cP2XOTR" _mubu_text="%3Cspan%3E%E8%A7%A3%E5%86%B3%E4%BA%86HTTPS%E4%BB%80%E4%B9%88%E9%97%AE%E9%A2%98%EF%BC%9F3%3C/span%3E" STYLE="fork">
        <node TEXT="窃听风险" ID="83UW3veCHL" _mubu_text="%3Cspan%3E%E7%AA%83%E5%90%AC%E9%A3%8E%E9%99%A9%3C/span%3E" STYLE="fork">
          <node TEXT="信息加密" ID="2QM8JJhamo" _mubu_text="%3Cspan%3E%E4%BF%A1%E6%81%AF%E5%8A%A0%E5%AF%86%3C/span%3E" STYLE="fork">
            <node TEXT="混合加密传输会话密钥，防止hacker窃听密钥，窃听信息" ID="CmGdcRoljr" _mubu_text="%3Cspan%20class=%22bold%22%3E%E6%B7%B7%E5%90%88%E5%8A%A0%E5%AF%86%3C/span%3E%3Cspan%3E%E4%BC%A0%E8%BE%93%E4%BC%9A%E8%AF%9D%E5%AF%86%E9%92%A5%EF%BC%8C%E9%98%B2%E6%AD%A2hacker%E7%AA%83%E5%90%AC%E5%AF%86%E9%92%A5%EF%BC%8C%E7%AA%83%E5%90%AC%E4%BF%A1%E6%81%AF%3C/span%3E" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="篡改风险" ID="WfqKT0G636" _mubu_text="%3Cspan%3E%E7%AF%A1%E6%94%B9%E9%A3%8E%E9%99%A9%3C/span%3E" STYLE="fork">
          <node TEXT="校验机制" ID="olzn81mhhE" _mubu_text="%3Cspan%3E%E6%A0%A1%E9%AA%8C%E6%9C%BA%E5%88%B6%3C/span%3E" STYLE="fork">
            <node TEXT="数字签名+摘要算法" ID="jaxOAns9Tk" _mubu_text="%3Cspan%3E%E6%95%B0%E5%AD%97%E7%AD%BE%E5%90%8D+%E6%91%98%E8%A6%81%E7%AE%97%E6%B3%95%3C/span%3E" STYLE="fork">
              <node TEXT="保证数据的完整性" ID="tQhOeclUZs" _mubu_text="%3Cspan%3E%E4%BF%9D%E8%AF%81%E6%95%B0%E6%8D%AE%E7%9A%84%E5%AE%8C%E6%95%B4%E6%80%A7%3C/span%3E" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="伪造风险:假淘宝" ID="pVJXh8TTpP" _mubu_text="%3Cspan%3E%E4%BC%AA%E9%80%A0%E9%A3%8E%E9%99%A9:%E5%81%87%E6%B7%98%E5%AE%9D%3C/span%3E" STYLE="fork">
          <node TEXT="身份认证" ID="zSIiS46VMa" _mubu_text="%3Cspan%3E%E8%BA%AB%E4%BB%BD%E8%AE%A4%E8%AF%81%3C/span%3E" STYLE="fork">
            <node TEXT="数字证书" ID="sTMsVyOVD3" _mubu_text="%3Cspan%3E%E6%95%B0%E5%AD%97%E8%AF%81%E4%B9%A6%3C/span%3E" STYLE="fork">
              <node TEXT="证书的权威性让hacker无法冒充" ID="DGOEg4WM2p" _mubu_text="%3Cspan%3E%E8%AF%81%E4%B9%A6%E7%9A%84%E6%9D%83%E5%A8%81%E6%80%A7%E8%AE%A9hacker%E6%97%A0%E6%B3%95%E5%86%92%E5%85%85%3C/span%3E" STYLE="fork"/>
            </node>
          </node>
        </node>
      </node>
      <node TEXT="HTTPS的连接建立过程？交换了什么信息？" ID="NAnjoEhg7X" _mubu_text="%3Cspan%3EHTTPS%E7%9A%84%E8%BF%9E%E6%8E%A5%E5%BB%BA%E7%AB%8B%E8%BF%87%E7%A8%8B%EF%BC%9F%E4%BA%A4%E6%8D%A2%E4%BA%86%E4%BB%80%E4%B9%88%E4%BF%A1%E6%81%AF%EF%BC%9F%3C/span%3E" STYLE="fork">
        <node TEXT="TLS连接建立过程" ID="6g7ypv2MRp" _mubu_text="%3Cspan%3ETLS%E8%BF%9E%E6%8E%A5%E5%BB%BA%E7%AB%8B%E8%BF%87%E7%A8%8B%3C/span%3E" STYLE="fork">
          <node TEXT="1. Client向Server索要数字证书获得Server公钥" ID="8wLdXr9imA" _mubu_text="%3Cspan%3E1.%20Client%E5%90%91Server%E7%B4%A2%E8%A6%81%E6%95%B0%E5%AD%97%E8%AF%81%E4%B9%A6%E8%8E%B7%E5%BE%97Server%E5%85%AC%E9%92%A5%3C/span%3E" STYLE="fork"/>
          <node TEXT="2.公钥加密传输会话密钥(实际上是传输(Pre-master随机数)" ID="NcFi4NzsxR" _mubu_text="%3Cspan%3E2.%E5%85%AC%E9%92%A5%E5%8A%A0%E5%AF%86%E4%BC%A0%E8%BE%93%E4%BC%9A%E8%AF%9D%E5%AF%86%E9%92%A5(%E5%AE%9E%E9%99%85%E4%B8%8A%E6%98%AF%E4%BC%A0%E8%BE%93(Pre-master%E9%9A%8F%E6%9C%BA%E6%95%B0)%3C/span%3E" STYLE="fork"/>
          <node TEXT="3.双方同时拥有会话密钥，告诉对方" ID="tajox4Fb4C" _mubu_text="%3Cspan%3E3.%E5%8F%8C%E6%96%B9%E5%90%8C%E6%97%B6%E6%8B%A5%E6%9C%89%E4%BC%9A%E8%AF%9D%E5%AF%86%E9%92%A5%EF%BC%8C%E5%91%8A%E8%AF%89%E5%AF%B9%E6%96%B9%3C/span%3E" STYLE="fork"/>
          <node TEXT="4.每次信息传输采用会话密钥加密" ID="JUn2kfTqnA" _mubu_text="%3Cspan%3E4.%E6%AF%8F%E6%AC%A1%E4%BF%A1%E6%81%AF%E4%BC%A0%E8%BE%93%E9%87%87%E7%94%A8%E4%BC%9A%E8%AF%9D%E5%AF%86%E9%92%A5%E5%8A%A0%E5%AF%86%3C/span%3E" STYLE="fork"/>
        </node>
        <node TEXT="交换信息" ID="sa7idpEFRg" _mubu_text="%3Cspan%3E%E4%BA%A4%E6%8D%A2%E4%BF%A1%E6%81%AF%3C/span%3E" STYLE="fork">
          <node TEXT="1.【Client Hello】 Client生成的客户端随机数" ID="n5d38IPewm" _mubu_text="%3Cspan%3E1.%E3%80%90Client%20Hello%E3%80%91%20Client%E7%94%9F%E6%88%90%E7%9A%84%E5%AE%A2%E6%88%B7%E7%AB%AF%E9%9A%8F%E6%9C%BA%E6%95%B0%3C/span%3E" STYLE="fork"/>
          <node TEXT="2. 【Server Hello】Server的Server Random， Server公钥" ID="aP1Empajig" _mubu_text="%3Cspan%3E2.%20%E3%80%90Server%20Hello%E3%80%91Server%E7%9A%84Server%20Random%EF%BC%8C%20Server%E5%85%AC%E9%92%A5%3C/span%3E" STYLE="fork"/>
          <node TEXT="3. 【Key Exchange】Client生成的Pre-master发送给Server" ID="ywWjjO7yuK" _mubu_text="%3Cspan%3E3.%20%E3%80%90Key%20Exchange%E3%80%91Client%E7%94%9F%E6%88%90%E7%9A%84Pre-master%E5%8F%91%E9%80%81%E7%BB%99Server%3C/span%3E" STYLE="fork"/>
        </node>
      </node>
    </node>
  </node>
</map>