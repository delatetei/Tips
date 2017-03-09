#!/usr/bin/env perl
use strict;
use warnings;
 
# cronで1分おきに呼ぶことを想定

# 時刻取得
my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
  = localtime(time);
 
my %execNumPerHour = (
  # 30分に一回実行
  0 => 30,
  1 => 30,
  2 => 30,
  3 => 30,
  4 => 30,
  5 => 30,
  # 15分に一回実行
  6 => 15,
  7 => 15,
  8 => 15,
  9 => 15,
  10 => 15,
  11 => 15,
  # 10分に一回実行
  12 => 10,
  13 => 10,
  14 => 10,
  15 => 10,
  16 => 10,
  17 => 10,
  # 5分に一回実行
  18 => 5,
  19 => 5,
  20 => 5,
  21 => 5,
  22 => 5,
  23 => 5,
);

&exec_timer($min, $execNumPerHour{$hour});
 
sub exec_timer {
  (my $min, my $cnt) = @_;
  # 任意のコマンド
  system("date") if($min % $cnt == 0)
}
