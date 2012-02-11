#!/usr/local/bin/perl

use Socket;
use IO::Handle;

use librs::basic;

readParam($ARGV[0]);

dbconnect($service, $name ,$cmd ,$ARGV[0]);
