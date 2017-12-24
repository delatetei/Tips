# SSL化したサイトにXMLRPC::Client.newでポストすると301
「wordpress XMLRPC ruby」でググると以下のようなコードが見つかる。
```
server = XMLRPC::Client.new('hogehoge.com', '/xmlrpc.php')
```
これでポストするとこんなのでてくる。
```
/usr/share/ruby/xmlrpc/client.rb:486:in `do_rpc': HTTP-Error: 301 Moved Permanently (RuntimeError)
        from /usr/share/ruby/xmlrpc/client.rb:279:in `call2'
        from /usr/share/ruby/xmlrpc/client.rb:260:in `call'
```

newだとhttp/httpsを明記できないのでnew2を使う。
```
server = XMLRPC::Client.new2('https://hogehoge.com/xmlrpc.php')
```

これで大丈夫。
