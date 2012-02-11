#!/usr/local/bin/perl

use librs::basic;

readParam($ARGV[0]);

`echo $ARGV[0] >> /root/1.log`;

$z = 1;

while (${"uid".$z} ne "null")
 { if (${"chk".$z} eq "on")
    { print "delete ".${"uid".$z}."<br>\n";
      $c = ${"uid".$z};
      `echo $c >> /root/1.log`;
      `pw userdel -u $c`
    }
   else { print "nodelete ".${"uid".$z}."<br>\n";
        }
   $z++;
 }
