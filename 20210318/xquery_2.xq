xquery version "1.0";
(: Sequences und Generelle Vergleichsop :)
<r>
{
 
    let $a := (1, 2)
    let $b := (3, 4)
    let $c := (2, 3)
    let $d := (1, 2)
    let $e := <y>3</y>
    return (
		<x>$e=3: {$e = 3}</x>,
		<x>a=b: {$a=$b}</x>,
		<x>a=c: {$a=$c}</x>,
		<x>a=d: {$a=$d}</x>,
		<x>a!=b: {$a!=$b}</x>,
		<x>a!=c: {$a!=$c}</x>,
		<x>a!=d: {$a!=$d}</x>,
		<z>{reverse($c)}</z>
	)
}
</r>