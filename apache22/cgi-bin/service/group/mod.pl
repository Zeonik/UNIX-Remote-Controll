#!/usr/bin/perl
use librs::basic;
if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает возможность изменения данных о группе";
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
print qq{<TR bgcolor="#777777"><TH>Название группы</TH><TH>GID</TH><TH>Члены группы</TH></TR>};
for($i=2;$i<$count;++$i){
($groupname,$pass,$gid,$memb)=split(/:/,$Group[$i],4);
print qq{<TR onmouseover="naveli(this)"   onmouseout ="uveli(this)" ><Th><a href="dbase.pl?service=group&cmd=modification&gid=$gid">$groupname</a></Th><TD>$gid</TD><TD>$memb</TD></TR>};
}
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=group&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;
	      }}





}