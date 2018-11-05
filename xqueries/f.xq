<result> {
  for $b in /congress/people/person
  where not (some $p in //member satisfies ($p[@id = $b/@id]))
  return <person>{string($b/@name)}</person>
} </result>
