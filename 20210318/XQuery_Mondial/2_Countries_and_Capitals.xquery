element countries_and_capitals
{
  let $doc := doc('mondial.xml')
  for $country in $doc//country
  let $capital := $doc//city[@id = $country/@capital]
  return element country {
    attribute name {$country/name/text()},
    attribute capital {$capital/name[1]}
  }
}
