element countries_and_lakes
{
	let $doc := doc('/home/florian/Projects/fh/semester4/ssd/ueb/20210318/XQuery_Mondial/mondial.xml')
	for $country in $doc//country 
	let $lakes := $doc//lake[@country = $country/@car_code]
	let $lakeCount := count($lakes)
	order by $lakeCount descending
	return element country {
	 attribute name {$country/name},
	 element lakes 
	  {
	  attribute count {$lakeCount},
	  for $lake in $lakes/name
	   order by $lake ascending 
	   return element lake {$lake/text()}
	  }
	}
}