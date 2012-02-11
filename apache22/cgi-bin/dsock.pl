#!/usr/local/bin/perl

use Socket;
use IO::Handle;
# use execs::sock::dbselector;      # ������, �������������� ������� �������
use locale;
use POSIX qw(setlocale LC_ALL);
setlocale(LC_ALL, "ru_RU.KOI8-R");

$Version = "2.0 (2006)";         # ������ ���� ��

$port = 42512;                   # ���� �����������

$STOP = "no";                    # ����

$Temp;                           # ��������� ����������

$Serv;                           #
$Name;                           # ��� ������������
$Cmds;                           # ������� �������
$Rule;                           # ����� �������� ������������

# ���������� �������
@Parm;                           # ���������

%User;                           # ������������� ������������

# �������� �������� ����������� �������� � ��������
sub trimright
 { while (($_[0] ne "") and (substr($_[0], length($_[0])-1, 1) le " "))
    { chop $_[0]
    }
 }

# �������� ��������� ��������-������
#if (($PIDSERVER = fork()) == 0)
 { # �������� ������
   socket (SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
   # �������� ������ � ���������� ������ (��������� ������� ������ �� 127.0.0.1)
   bind (SOCK, sockaddr_in ($port, INADDR_LOOPBACK));
   # ����������� ������ � �������� ���������, �������� ������� �����������
   listen (SOCK, SOMAXCONN);
   # ��������������� ���������� ��������
   $SIG{USR1} = 'IGNORE';           # ��������� ��������� ������� USR1
   $SIG{USR2} = 'IGNORE';           # ��������� ��������� ������� USR2
   # ���� "�������������" ������� �� �����������
   while ($STOP eq "no")
    { # �������� ������ �����������
      $remote_addr = accept (SESSION, SOCK);
      if (length($remote_addr) > 0)
       { ($port, $hiaddr) = sockaddr_in ($remote_addr);
         $ip_addr = inet_ntoa ($hiaddr);
	 # ��������� �������
	 trimright ($Temp = <SESSION>);
	 print $Temp."\n";
	 # �������������
         if ($Temp eq "UNIX")
	  { trimright ($Serv = <SESSION>); # ��� ��
	    trimright ($Name = <SESSION>); # ��� ������������
	    trimright ($Cmds = <SESSION>); # ������� �������
	    trimright ($Parm = <SESSION>); # 
	    
	    $Rule = 1023;

            print $Parm."\n";
	    
	    print "servers/".$Serv."/".$Cmds.".pl\n";
	    
             if (fork() == 0)
	     { if (-f "servers/".$Serv."/".$Cmds.".pl")
	        { print "YES\n";
		 
		  print SESSION `servers/$Serv/$Cmds.pl $Parm`;
		}
	       else { print SESSION "ERR\n"
	            }
	       exit 0
	     }
 	    else { wait ()
		 }

	    close SESSION
	  }
       }
    }
 }
#else { `echo "$PIDSERVER" > /var/run/dsock.pid`
#     }

# ���������� ������ ������������� ��������
exit 0
