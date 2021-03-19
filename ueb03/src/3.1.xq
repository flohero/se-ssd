element TerminEnde {
    let $doc := doc('/home/florian/Projects/fh/semester4/ssd/ueb/ueb03/src/TerminListe.xml')
    let $end := $doc//Termin[@id]
    return $doc//Termin/count(./@id = $doc//Termin/@id)
}