#!/usr/bin/perl

use librs::basic;

if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает удаление существующих групп";
 }
else{ 
$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);

$GroupAddr="</etc/group";
open(FP,$GroupAddr);
@Group=<FP>;
close(FH);
$count=@Group;

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
print qq{<input name ="service" type="hidden" value="group">};
print qq{<input name ="cmd" type ="hidden" value=".delgroup">};
print qq{<td colspan=20><center><h2>Удаление групп</h2></center></td>};
print qq{
<TR bgcolor="#777777"><TH>Отметить</TH><TH>Имя</TH><TH>Gid</TH><TH>Члены группы</TH></TR>};
$z=0;
for($i=2;$i<$count;++$i){
$z=$z+1;
($groupname,$pass,$gid,$memb)=split(/:/,$Group[$i],4);
print qq{<TR onmouseover="naveli(this)"   onmouseout ="uveli(this)" >
<td><input type="checkbox" name="chk$z"><input type ="hidden" name ="gid$z" value=$gid>
</td><td>$groupname</td><TD>$gid</TD><TD>$memb</TD></TR>};
}
$z++;
print qq{<input type="hidden" name="gid$z" value="null">};
print qq{<td colspan=20><input type="submit" value="Удалить отмеченные"></td>};
print qq{</form>};
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=group&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;
	      }}}