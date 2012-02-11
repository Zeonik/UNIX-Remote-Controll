#!/usr/bin/perl
use librs::basic;
if ($ARGV[0] eq "help")
 { print "Этот модуль обеспечивает вывод списка пользователей";
 }
else{
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
print qq{<TR bgcolor="#777777"><TH>User Name</TH><TH>Uid</TH><TH>Gid</TH><TH>Comment</TH><TH>User Directory</TH><TH>Shell</TH></TR>};
for($i=2;$i<$count;++$i){
($username,$pass,$uid,$gid,$comment,$dir,$shell)=split(/:/,$Passwd[$i],7);
print qq{<TR onmouseover="naveli(this)"   onmouseout ="uveli(this)" > <TD>$username</TD>
<TD>$uid</TD><TD>$gid</TD><TD>$comment</TD><TD>$dir</TD><TD>$shell</TD></TR>};
}
}
elsif($_=~/metka2/){
print qq{<a href=dbase.pl?service=users&cmd=index><center><h3> Назад</h3></center></a>};
}
else{
	print $_;
	      }}

}