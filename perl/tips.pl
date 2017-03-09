# セパレータで分割
my @words = split(/,/, $_);

# grep (iで大文字小文字無視) 配列を返す
grep(/$word/i, @words);

# 配列に追加
push(@to, @from);

# 配列の要素数
my @array;
$#array + 1;

# 出力をバッファするかどうか
# しない
$| = 1;
# する
$| = 0;

# キーが2つの連想配列（配列を格納）
@{$map{"key1"}{"key2"}}

# 重複削除
my %count;
@array = grep( !$count{$_}++, @array ) ;

# 配列内置換
s/before/after/ for @tmp;

# ソート(非破壊)
@tmp = sort(@tmp);

# csv出力
print join(",", @tmp). "\n";
