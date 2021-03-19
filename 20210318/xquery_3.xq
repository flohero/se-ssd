xquery version "1.0";
 
declare boundary-space strip;
(:declare boundary-space preserve;:)
declare variable $global1 := 23;
declare variable $person1 := doc('/home/florian/Projects/fh/semester4/ssd/ueb/20210318/person_dtd.xml')//Person[1];
<test>
  {
    for $x at $i in ("eins", "zwei", "drei")
    let $now := current-dateTime()
    let $dt:=xs:dateTime("2020-03-20T14:40:00")
    let $diff := $now - $dt
    let $a := hours-from-duration($diff)
    return
     
    element {$x} {
      attribute index {$i},
      attribute {$x} {$x},
      element Diff {attribute hours {$a}, $diff},
      element PersonStuff {$person1}
    },
    <myOwnElement>someText</myOwnElement>

}
</test>