#!/usr/local/bin/perl
use librs::basic;
readParam($ARGV[0]);
$z=1;
while (${"gid".$z} ne "null")
    {if (${"chk".$z} eq "on")
	{print "delete".${"gid".$z}."<br>\n";
	$c=${"gid".$z};
	`pw groupdel -g $c`
	
	}else {print "nodelete".${"gid".$z}."<br>\n";
	}
	$z++;
	}