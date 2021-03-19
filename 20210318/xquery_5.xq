xquery version "1.0";
(: conditional und precedes op :)
declare default element namespace "http://www.fh-hagenberg.at/projectteam";

<result>
  {
    let $doc := fn:doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/person.xml")
    for $pers in $doc//Person
    return
(: JA- wenn Person nach der zweiten Person vorkommt, ansonsten NEIN- :)
      if ($pers >> $doc//Person[2]) then
        ("JA-")
      else
        ("NEIN-")
  
  }
</result>