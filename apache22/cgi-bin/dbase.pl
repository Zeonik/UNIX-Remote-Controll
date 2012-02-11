#!/usr/local/bin/perl

use CGI;

use librs::basic;

print "Content-type:text/html; charset=koi8-u; Cache-control:no-cache\n\n";

$Name = $ENV{'REMOTE_USER'}; 
$Addr = $ENV{'REMOTE_ADDR'};

$List = new CGI;
foreach $In_Name ($List -> param)
 { ${$In_Name} = $List -> param($In_Name);
   $parametr=$parametr.$In_Name."=".${$In_Name}."::"

 }
 
chop $parametr;
chop $parametr;

if(-f $DirService.$service."/".$cmd.".pl")
 { 
system($DirService.$service."/".$cmd.".pl"." ".$parametr);
 }
