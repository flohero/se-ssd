let $doc := doc('/home/florian/Projects/fh/semester4/ssd/ueb/ueb03/src/TerminListe.xml')
return distinct-values($doc//*/@id | $doc//*/@terminErsteller | $doc//*/@ort)
