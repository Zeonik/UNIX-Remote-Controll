#!/usr/bin/perl

use librs::basic;

@F = split "::", $ARGV[0];
for $i (0..$#F)
 { ($k, $v) = split "=", $F[$i];
   ${$k} = $v;
 }

$string=`/usr/sbin/pw groupshow -g $gid`;
($groupname,$pass,$gid,$memb)=split(/:/,$string,4);

$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);
foreach (@Form)
{if($_=~/metka1/){print qq{     <form action="dbase.pl" method="POST">
				<tr bgcolor="#666666"><td width="100%">
				<h3>Изменение данных о группе</h3>
				<input name="service" type="hidden" value="group">
				<input name="cmd" type="hidden" value=".modgroup">
				<input  name="groupname" value="$groupname" type="text" size=60>:::::Название группы<br>
				<input  name="gid" value="$gid" type="hidden">
				<input  name="memb" value="$memb" type="text" size=60>:::::Сменить членов группы<br>
				<input value="Изменить" type="submit">
				</td></tr>
				</form>
			  }
		}
		
	elsif($_=~/metka2/){
				print qq{<a href=dbase.pl?service=group&cmd=mod><center><h3> Назад</h3></center></a>};
			   }
else{print $_;}
}
