#!/usr/local/bin/perl
use librs::basic;
readParam($ARGV[0]);
$args="/usr/sbin/pw groupadd -n $name -g $gid -M $memb ";
`exec $args;`
