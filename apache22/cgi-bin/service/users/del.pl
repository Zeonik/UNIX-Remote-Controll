#!/usr/bin/perl

use librs::basic;

if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает удаление пользователей из системы";
 }
else {
$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);

$PasswdAddr="</etc/passwd";
open(FP,$PasswdAddr);
@Passwd=<FP>;
close(FH);
$count=@Passwd;

print qq{ <script language="JavaScript">
  <!-- hide
   function  naveli(temp){
temp.style.backgroundColor='#999999';
   }
    function  uveli(temp){
temp.style.backgroundColor='#FFFFFF';
   }
  // -->
 </script>};

foreach (@Form)
{if($_=~/metka1/){
print qq{<form action="dbase.pl" method="POST">};
print qq{<input name="service" type="hidden" value="users">};
print qq{<input name="cmd" type="hidden" value =".deluser">};
print qq{<td colspan=20><center><h2>Удаление пользователей</h2></center></td>};
print qq{
<TR bgcolor="#777777"><TH>Отметить</TH><TH>Имя</TH><TH>Uid</TH><TH>Gid</TH><TH>Комментарий</TH><TH>Домашний каталог</TH><TH>Shell-оболочка</TH></TR>};
$z=0;
for($i=2;$i<$count;++$i){
$z=$z+1;
($username,$pass,$uid,$gid,$comment,$dir,$shell)=split(/:/,$Passwd[$i],7);
print qq{<TR onmouseover="naveli(this)"   onmouseout ="uveli(this)" ><td><input type="checkbox" name = "chk$z"><input type="hidden" name="uid$z" value=$uid>
<td>$username</td><TD>$uid</TD><TD>$gid</TD><TD>$comment</TD><TD>$dir</TD><TD>$shell</TD></TR>};

}
$z++;
print qq{<input type="hidden" name="uid$z" value="null">};
print qq{<td colspan=20><input type="submit" value="Удалить отмеченные"></td>};
print qq{</form>};
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=users&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;
	      }}
}
