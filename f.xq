<result> {
  for $b in /congress/people/person
  where (every $p in /congress/committees//member satisfies not($p[@id = $b/@id]))
  return <person>{$b/@name}</person>
} </result>
