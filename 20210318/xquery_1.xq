xquery version "1.0";
declare boundary-space preserve;
let $i := (1 to 3)
let $x := (3, 4, 5, 6, 7)
let $y := ()
let $avg := avg($x)
let $sum := sum($x)

return
(: some basics here :)
<e>
 {
  count(($x, $i, $avg))
 }
</e>

