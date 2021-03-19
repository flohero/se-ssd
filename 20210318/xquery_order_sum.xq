xquery version "1.0";

declare default element namespace "http://www.marchal.com/2006/po";

let $doc := doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/PurchaseOrder.xml")

return 
sum(
  for $line in $doc/PurchaseOrder/OrderLines/Line
  return ($line/Price * $line/Quantity)
)

