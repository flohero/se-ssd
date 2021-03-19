xquery version "1.0";
(:Comment:) 
declare default element namespace "http://www.fh-hagenberg.at/projectteam";
<result>
{
let $doc := doc("/home/florian/Projects/fh/semester4/ssd/ueb/20210318/person.xml")

for $pers in $doc//Person

(:1. alle Personen, die 'Ma' enthalten:)
where

(: some $elem in $pers/* satisfies (contains($elem, 'Ma')) :)

(: $pers/FirstName = 'Markus' :)
(:2. alle Personen, die ein 'i' enthalten :)
(: every $elem in $pers/* satisfies (contains($elem, 'i')) :)
(:3. alle Personen, mit Textlaenge < 120:)

every $elem in $pers//text() satisfies (string-length($elem) < 120)
return 
(:Nachname (Text) in Namen-Tag:)
 <name>{$pers/LastName/text()}</name>
}
</result>

