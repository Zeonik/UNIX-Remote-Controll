# use Socket;
# use IO::Handle;

$DirWWW  = "/usr/local/www/apache22/";

$DirBase = $DirWWW."cgi-bin/";

$DirService = $DirBase."service/";

sub readParam
 { @F = split "::", $_[0];
   for $i (0..$#F)
    { ($k, $v) = split "=", $F[$i];
      ${$k} = $v;
    }
print "<br><br><br><br><center><h1>�������� �������\n</h1></ceter>";
print"<a href='dbase.pl?service=start&cmd=index'><center><h3>� ������� ����</h3></center></a>";
}


sub dbconnect
 { local $p = join "\n", @_;
   # �������� ������
   socket (SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
   # ����������� � ������� ��
   connect (SOCK, sockaddr_in (42512, inet_aton ('127.0.0.1')));
   # ���������� ����� ������
   SOCK->autoflush(1);
   # ��������� ����������� � ������ (��, ������������, ������� � ���������)
   print SOCK "UNIX\n".$p."\n";
   # �������� ����� �� �������
   my @Record = <SOCK>;
   # ������� ����������
   close SOCK;
   # ������� ����� ��������� �������
   return @Record
 }
