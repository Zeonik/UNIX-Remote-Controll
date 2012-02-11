#!/usr/local/bin/perl

use Socket;
use IO::Handle;

use exec::libs::basic;
use exec::libs::error;

use exec::sock::db_connect;

$Base = $ARGV[0];                    # ��� ����� ���� ������
$Name = $ARGV[1];                    # ��� ������������
$Addr = $ARGV[2];                    # IP ����� ���������� ������������

if (($Name eq "") or ($Addr eq ""))
 { showError $Error{"001"}." [001]"
 }

# ������ �������� ���������� �������
readURL $ARGV[3];

if ($Save eq "yes")
 { # ���������� ������
   ($Number, $Rule, @Record) = dbconnect ($Base, $Name, "saveRecord", $Number, $ARGV[3]); trim $_ foreach @Record;
   # 
   if ($Record[0] eq "ERR")
    { showError $Error{$Record[1]}." [".$Record[1]."]"
    }
 }

# ������ ���������� ������
if ($Number >= 0)
 { ($Number, $Rule, @Record) = dbconnect ($Base, $Name, "lockRecord", $Number, "UNLOCK"); trim $_ foreach @Record;
   # 
   if ($Record[0] ne "default")
    { if ($Record[0] eq "ERR")
       { showError $Error{$Record[1]}." [".$Record[1]."]"
       }
    }
 }

chomp $Number; chomp $Rule;

# ������� � �������� ��������� ������
print "  <script language='JavaScript'>\n";
print "  //<!--\n";
print "   parent.window.location='$ScrBase?Service=viewRecord&Base=$Base&Number=$Number'\n";
print "  //-->\n";
print "  </SCRIPT>\n";
