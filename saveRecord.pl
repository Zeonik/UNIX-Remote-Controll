#!/usr/local/bin/perl

use Socket;
use IO::Handle;

use exec::libs::basic;
use exec::libs::error;

use exec::sock::db_connect;

$Base = $ARGV[0];                    # Имя файла базы данных
$Name = $ARGV[1];                    # Имя пользователя
$Addr = $ARGV[2];                    # IP адрес компьютера пользователя

if (($Name eq "") or ($Addr eq ""))
 { showError $Error{"001"}." [001]"
 }

# Чтение значений параметров запроса
readURL $ARGV[3];

if ($Save eq "yes")
 { # Сохранение записи
   ($Number, $Rule, @Record) = dbconnect ($Base, $Name, "saveRecord", $Number, $ARGV[3]); trim $_ foreach @Record;
   # 
   if ($Record[0] eq "ERR")
    { showError $Error{$Record[1]}." [".$Record[1]."]"
    }
 }

# Снятие блокировки записи
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

# Возврат к странице просмотра записи
print "  <script language='JavaScript'>\n";
print "  //<!--\n";
print "   parent.window.location='$ScrBase?Service=viewRecord&Base=$Base&Number=$Number'\n";
print "  //-->\n";
print "  </SCRIPT>\n";
