# 環境によるtest([)コマンドの挙動の違い

Solaris 10とCentOS 7で複数の引数を取った場合の挙動が違ったのでメモ

## Solaris 10

### 下準備

```
# echo $SHELL
/sbin/sh

# which test
/usr/bin/test

# which [
no [ in /usr/sbin /usr/bin /usr/dt/bin /usr/openwin/bin /usr/ucb
```
シェルはBourne Shell。

testは外部コマンドだけど、[は内部コマンドになってる。

### 確認
```
# ls
hoge

# [ -f hoge ]
# echo $?
0

# [ -f hoge piyo ]
# echo $?
0

# [ -f hoge piyo foo ]
# echo $?
0
```
存在しないファイルを第二引数以降に指定しても特にエラーにはならない。
```
# [ -f piyo hoge]
# echo $?
1
```
これは評価した結果が異常。第一引数だけ評価してるっぽい。

## CentOS 7

### 下準備

```
sh-4.2# echo $SHELL
/bin/bash

sh-4.2# which test
/usr/bin/test

sh-4.2# which [
/usr/bin/[
```
シェルはBash。

testも[も外部コマンド。

（なんだけど、内部／外部コマンドのどちらが優先して呼ばれるのか、実装が違うのかとかはよく分からない。。。）

### 確認
```
# ls
hoge

sh-4.2#  [ -f hoge ]
sh-4.2# echo $?
0

sh-4.2# [ -f hoge piyo ]
sh: [: hoge: binary operator expected
sh-4.2# echo $?
2

sh-4.2# [ -f hoge piyo foo ]
sh: [: too many arguments
sh-4.2# echo $?
2
```
エラーになった。

## まとめ
Bourne Shellガバガバ。

testに複数のファイル名が渡る時点で使い方を完全に間違えてるんだけど、こういう挙動の違いもあるってことで学びがあった。

（他人のプログラム改修で発見した事象なので自分が間違ったコーディングしたわけではない）
