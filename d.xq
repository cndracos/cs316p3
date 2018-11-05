<result> {
   for $b in /congress/people/person/role[@type='sen' and @state='NC' and @current='1']
   let $p := min(for $s in $b/../role[@type='sen']
	     where (every $r in $b/../role[@type='rep'] satisfies xs:date($s/@startdate) > xs:date($r/@startdate))
	     return xs:date($s/@startdate))
   stable order by $p
   return  <senator first_start="{$p}" party="{$b/@party}">{string($b/../@name)}</senator>
} </result>
