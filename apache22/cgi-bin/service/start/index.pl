#!/usr/local/bin/perl

use librs::basic;

local @ServiceName;
local %ServiceInfo;
local @Temp;
$FormAddr="</usr/local/www/apache22/cgi-bin/forms/forms.html";
open(FH,$FormAddr);
@Form=<FH>;
close(FH);


opendir Dir, $DirService;
 while ($File = readdir Dir)
  { if (($File ne '.') and ($File ne '..') and ($File ne 'start'))
     { $ServiceName[$#ServiceName + 1] = $File;
     }
  }
close Dir;

@ServiceName = sort @ServiceName;

for $i (0..$#ServiceName)
 { if (-f $DirService.$ServiceName[$i]."/INFO")
    { open F, "< ".$DirService.$ServiceName[$i]."/INFO";
       @Temp = <F>;
      close F;
    }
   for $k (1..$#Temp)
    { $Temp[0] = $Temp[0].$Temp[$k];
    }
   $ServiceInfo{$ServiceName[$i]} = $Temp[0]
 }
foreach (@Form)
{if($_=~/metka1/)

	{print qq{<tr valign="top" bgcolor="#999999">
		  <td width="50%"><center><h2>Сервисы</h2></center></td><td width="50%"><center><h2>Описание</h2></center></td>
		  </tr>}; 

for $i (0..$#ServiceName)
 { 
	
	print qq{<tr bgcolor="#777777">};
	print qq{<td width="50%">
<a  href=dbase.pl?service=$ServiceName[$i]&cmd=index><img src="/img/img/chinaz31.png"align=middle>$ServiceName[$i] </a>					
</td>}; 
print qq{<td width="50%">
$ServiceInfo{$ServiceName[$i]}
</td>}; 			

print qq{</tr>}; 			
} 	} 






elsif($_=~/metka2/){ print qq{}; }else{ print $_;
}
}



