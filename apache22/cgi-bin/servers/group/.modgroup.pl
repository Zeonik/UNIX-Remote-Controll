#!/usr/local/bin/perl
use librs::basic;
readParam($ARGV[0]);
print $ARGV[0];
$args="/usr/sbin/pw groupmod -l $groupname -g $gid -M $memb";
`exec $args;`