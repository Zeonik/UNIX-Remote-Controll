#!/usr/local/bin/perl
use librs::basic;
readParam($ARGV[0]);
print $ARGV[0];
$args ="/usr/sbin/pw usermod -l $username -g $gid -c $comment -d $directory -s $shell -u $uid";
`exec $args`;