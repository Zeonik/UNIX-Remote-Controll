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
print "<br><br><br><br><center><h1>Операция успешна\n</h1></ceter>";
print"<a href='dbase.pl?service=start&cmd=index'><center><h3>В главное меню</h3></center></a>";
}


sub dbconnect
 { local $p = join "\n", @_;
   # Создание сокета
   socket (SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
   # Подключится к серверу БД
   connect (SOCK, sockaddr_in (42512, inet_aton ('127.0.0.1')));
   # Освободить буфер обмена
   SOCK->autoflush(1);
   # Отправить приветствие и запрос (БД, пользователь, команда и параметры)
   print SOCK "UNIX\n".$p."\n";
   # Получить ответ от сервера
   my @Record = <SOCK>;
   # Закрыть соединение
   close SOCK;
   # Вернуть ответ источнику запроса
   return @Record
 }
