xquery version "1.0";
declare namespace po = "http://www.marchal.com/2006/po";
declare namespace dt = "http://www.mybooks.com/details";
<result>
  {
    let $po := doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/PurchaseOrder.xml")//po:Line
    let $det := doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/BookDetails.xml")//dt:BookDetails
    
    for $code in $po/po:Code,
      $bk in $det/dt:Book
    where $code = $bk/@isbn and contains($code, '63')
      (: einschraenken auf alle, deren Code eine ISBN ist und 63 enthaelt :)
    return
      <el>
        {($code/text(), "    ", 
	   	  $code/../po:Description/text(), "     ", 
		  $bk/dt:Author/text(), "     ", 
		  $bk/dt:Editor/text()), "     ", 
		  $code/../po:Price/text()}
      </el>
  
  }
</result>
