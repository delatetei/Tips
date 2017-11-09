# bashのオプション
bashに引数として-o、-Oを渡してやると今の設定状況が見えます。
```
[root@localhost ~]# bash -o
allexport       off
braceexpand     on
emacs           on
errexit         off
errtrace        off
functrace       off
hashall         on
histexpand      on
history         on
ignoreeof       off
interactive-comments    on
keyword         off
monitor         off
noclobber       off
noexec          off
noglob          off
nolog           off
notify          off
nounset         off
onecmd          off
physical        off
pipefail        off
posix           off
privileged      off
verbose         off
vi              off
xtrace          off

[root@localhost ~]# bash -O
autocd          off
cdable_vars     off
cdspell         off
checkhash       off
checkjobs       off
checkwinsize    off
cmdhist         on
compat31        off
compat32        off
compat40        off
compat41        off
direxpand       off
dirspell        off
dotglob         off
execfail        off
expand_aliases  off
extdebug        off
extglob         off
extquote        on
failglob        off
force_fignore   on
globstar        off
gnu_errfmt      off
histappend      off
histreedit      off
histverify      off
hostcomplete    on
huponexit       off
interactive_comments    on
lastpipe        off
lithist         off
login_shell     off
mailwarn        off
no_empty_cmd_completion off
nocaseglob      off
nocasematch     off
nullglob        off
progcomp        on
promptvars      on
restricted_shell        off
shift_verbose   off
sourcepath      on
xpg_echo        off
```
多い！

オプションは引数からも設定できる。
```
[root@localhost ~]# bash --help
GNU bash, version 4.2.46(1)-release-(x86_64-redhat-linux-gnu)
Usage:  bash [GNU long option] [option] ...
        bash [GNU long option] [option] script-file ...
GNU long options:
        --debug
        --debugger
        --dump-po-strings
        --dump-strings
        --help
        --init-file
        --login
        --noediting
        --noprofile
        --norc
        --posix
        --protected
        --rcfile
        --rpm-requires
        --restricted
        --verbose
        --version
Shell options:
        -irsD or -c command or -O shopt_option          (invocation only)
        -abefhkmnptuvxBCHP or -o option
Type `bash -c "help set"' for more information about shell options.
Type `bash -c help' for more information about shell builtin commands.

```

## 使用例

### extglob
拡張グロブを使ってみる。

引数で指定された文字列の末尾に数字の連続がある場合にマッチ。
```
[root@localhost ~]# touch hoge.171109
[root@localhost ~]# cat extglob_test.sh
#!/bin/bash
shopt -s extglob

ls -l ${1}.+([0-9])
[root@localhost ~]# ./extglob_test.sh hoge
-rw-r--r-- 1 root root 0 Nov  9 22:17 hoge.171109
```
日付ファイルが消せる！と言い張れる程の表現力はないけど実用的には問題なさそう。
