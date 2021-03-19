for $begin in //*[@serienTermin="ja"]/Beginn
return concat($begin/@datum, 'T', $begin/@uhrzeit)