#!/usr/bin/perl
use librs::basic;
if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает добавление пользователей в систему";
 }
else{
$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);
foreach (@Form)
{if($_=~/metka1/){print qq{<tr bgcolor="#666666"><td width="100%" ><center><h2>Добавление нового 					пользователя</h2></center>
			<form action="dbase.pl" method="POST">
			<input name="service" type="hidden" value="users">
			<input name="cmd" type="hidden" value=".adduser">
			<input align="middle" name="name" type="text" size=40>:::::Имя пользователя<br><br>
			<input name="Comment" type="text" size=40>:::::Комментарии<br><br>
			<input name="password" type="password" size=40>:::::Пароль<br><br>
			<input name="uid" type="text" size=40>:::::UID<br><br>
			<input name="GID" type="text" size=40>:::::GID<br><br>
			<input name="Dir" type="text"size=40>:::::Домашний каталог<br><br>
			<input name="Shell" type="text"size=40>:::::Shell-оболочка<br><br>
			<center><input value="Добавить нового пользователя" type="submit"></center>
			</form></td></tr>};
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=users&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;
	      }}














}