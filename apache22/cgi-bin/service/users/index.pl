#!/usr/local/bin/perl

use librs::basic;

local @CmdName;
local %CmdInfo;

$FormAddr=$DirBase."forms/forms.html";
open(FH,"< ".$FormAddr);
@Form=<FH>;
close(FH);

opendir Dir, $DirService."users/";
 while ($File = readdir Dir)
  { if (($File ne '.') and ($File ne '..') and ($File ne 'index.pl') and ($File ne 'INFO')  and ($File ne 'modification.pl')and ($File ne '.adduser.pl')and ($File ne '.deluser.pl')and ($File ne '.moduser.pl'))
     {  ($F, $t) = split '\.', $File;
       $CmdName[$#CmdName + 1] = $F;
     }
  }
close Dir;

@CmdName = sort @CmdName;
for $i (0..$#CmdName)
 { $n = $DirService."users/".$CmdName[$i].".pl";
   @Temp = `$n help`;
   for $k (1..$#Temp)
    { $Temp[0] = $Temp[0].$Temp[$k];
    }
   $CmdInfo{$CmdName[$i]} = $Temp[0]
 }


foreach (@Form)
{if($_=~/metka1/)

	{print qq{<tr valign="top" bgcolor="#999999">
		  <td width="50%"><center><h2>Модуль</h2></center></td><td width="50%"><center><h2>Описание</h2></center></td>
		  </tr>}; 


for $i (0..$#CmdName)
 { $c= $CmdName[$i];
print qq{<tr bgcolor="#777777">};
	print qq{<td width="50%"><img src="/img/img/chinaz31.png" align=middle><a href=dbase.pl?service=users&cmd=$c> User : $CmdName[$i]</a></td>};
print qq{<td width="50%">
$CmdInfo{$CmdName[$i]}</td>};
print qq{</tr>}; 			
} 
}
elsif($_=~/metka2/){ print qq{<a href=dbase.pl?service=start&cmd=index><center><h3> Назад</h3></center></a>}; }else{ print $_;
}
} 
 














