#!/usr/bin/perl

use librs::basic;

@F = split "::", $ARGV[0];
for $i (0..$#F)
 { ($k, $v) = split "=", $F[$i];
   ${$k} = $v;
 }

$string=`/usr/sbin/pw usershow -u $uid`;
($username,$pass,$uid,$gid,$x,$x1,$x2,$comment,$dir,$shell)=split(/:/,$string,10);

$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);
foreach (@Form)
{if($_=~/metka1/){print qq{     <form action="dbase.pl" method="post">
				<tr bgcolor="#666666"><td width="100%">
				<h3>Изменение данных о пользователе</h3>
				
<input name="service" type="hidden" value="users">
<input name="cmd" type="hidden" value =".moduser">
<input name="uid" type="hidden" value="$uid">
<input  name="username" value="$username" type="text" size=60>:::::Имя пользователя<br>
<input  name="gid" value="$gid" type="text" size=60>:::::Сменить GID<br>
<input  name="comment" value="$comment" type="text" size=60 >:::::Сменить комментарии<br>
<input  name="directory" value="$dir" type="text" size=60 >:::::Сменить домашний каталог<br>
<input  name="shell" value="$shell" type="text" size=60>:::::Сменить Shell-оболочку<br>
<input value="Изменить" type="submit">
</td></tr>
</form>
  }
}
	
	elsif($_=~/metka2/){
				print qq{<a href=dbase.pl?service=users&cmd=mod><center><h3> Назад</h3></center></a>};
			   }
else{print $_;}
}
