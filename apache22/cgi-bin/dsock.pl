#!/usr/local/bin/perl

use Socket;
use IO::Handle;
# use execs::sock::dbselector;      # Модуль, распределяющий функции системы
use locale;
use POSIX qw(setlocale LC_ALL);
setlocale(LC_ALL, "ru_RU.KOI8-R");

$Version = "2.0 (2006)";         # Версия ядра БД

$port = 42512;                   # Порт подключения

$STOP = "no";                    # Флаг

$Temp;                           # Временная переменная

$Serv;                           #
$Name;                           # Имя пользователя
$Cmds;                           # Команда запроса
$Rule;                           # Права текущего пользователя

# Глобальные массивы
@Parm;                           # Параметры

%User;                           # Идентификатор пользователя

# Удаление конечных специальных символов и пробелов
sub trimright
 { while (($_[0] ne "") and (substr($_[0], length($_[0])-1, 1) le " "))
    { chop $_[0]
    }
 }

# Создание дочернего процесса-демона
#if (($PIDSERVER = fork()) == 0)
 { # Создание сокета
   socket (SOCK, AF_INET, SOCK_STREAM, getprotobyname('tcp'));
   # Привязка сокета к локальному адресу (принимать запросы только от 127.0.0.1)
   bind (SOCK, sockaddr_in ($port, INADDR_LOOPBACK));
   # Регистрация сокета в качестве приемного, создание очереди подключения
   listen (SOCK, SOMAXCONN);
   # Переопределение диспозиции сигналов
   $SIG{USR1} = 'IGNORE';           # Отключить обработку сигнала USR1
   $SIG{USR2} = 'IGNORE';           # Отключить обработку сигнала USR2
   # Цикл "прослушивания" запроса на подключение
   while ($STOP eq "no")
    { # Ожидание нового подключения
      $remote_addr = accept (SESSION, SOCK);
      if (length($remote_addr) > 0)
       { ($port, $hiaddr) = sockaddr_in ($remote_addr);
         $ip_addr = inet_ntoa ($hiaddr);
	 # Обработка запроса
	 trimright ($Temp = <SESSION>);
	 print $Temp."\n";
	 # Идентификатор
         if ($Temp eq "UNIX")
	  { trimright ($Serv = <SESSION>); # Имя БД
	    trimright ($Name = <SESSION>); # Имя пользователя
	    trimright ($Cmds = <SESSION>); # Команда запроса
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

# Завершение работы родительского процесса
exit 0
