xquery version "1.0";
(: Comment :)
declare default element namespace "http://www.fh-hagenberg.at/projectteam";
<result>
  {
    (:let $doc := doc("person_dtd.xml"):)
    let $doc := doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/person.xml")
    
    for $pers in $doc//Person
    let $persId := $pers/@id
    let $persName := $pers/LastName
    
    (: persId entweder ssn1000 oder ssn1001 :)
    (: where $persId = 'ssn1000' or $persId = 'ssn1001' :)
    (: die einen MiddleName hat :)
     where $pers/MiddleName
    (: sortiert nach LastName (aufsteigend) :)
    order by $pers/LastName descending
    return
      (: fuer Personen mit dem Namen "Markus" :)
      if ($pers/FirstName = 'Markus')
      then
        element {node-name($pers)} {attribute ide {$pers/@id}, element lastname {data($pers/LastName)}}
      else
        element {node-name($pers)} {attribute ide {$pers/@id}, attribute ggg {"sss"}, element lastname {data($pers/LastName)}}
  }
</result>
