<result> {
   for $b in /congress/people/person
   where (some $p in $b/role satisfies $p[@type='sen'])
      and (some $e in $b/role satisfies $e[@type='rep' and @current='1'])
   stable order by $b/@name
   return <member>{$b/@name}</member>
} </result>
