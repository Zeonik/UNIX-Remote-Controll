#!/usr/bin/perl
use librs::basic;
if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает добавление новых групп";
 }
else{
$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);
foreach (@Form)
{if($_=~/metka1/){print qq{<tr bgcolor="#666666"><td width="100%" ><center><h2>Добавление новой группы</h2></center>
			<form action="dbase.pl" method="get">
			<input name ="service" type="hidden" value="group">
			<input name ="cmd" type ="hidden" value=".addgroup">
			<input align="middle" name="name" type="text" size=40>:::::Имя группы<br><br>
			<input name="gid" type="text" size=40>:::::GID<br><br>
			<input name = "memb" type="text" size=40>::::Members<br><br>
			<center><input value="Добавить новую группу" type="submit"></center>
			</form></td></tr>};
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=group&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;


}}}