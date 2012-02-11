#!/usr/local/bin/perl
use librs::basic;

readParam($ARGV[0]);
print "$name \n";
$args = "echo -n $password | /usr/sbin/pw useradd -n $name -u $uid -g $GID -d $Dir -s $Shell -c $Comment";
`exec $args`;


