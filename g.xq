<result> {
   let $dems := (for $b in /congress/people/person
                    where $b/role[@current='1'] and $b/role[@party='Democrat']
		    return $b)
   let $m := count(for $p in $dems
		   where $p[@gender='M']
		   return $p) - 1
   let $f := count($dems) - $m - 1
   return <Democrat><M count="{$m}"/><F count="{$f}"/></Democrat>
}
{
   let $reps := (for $b in /congress/people/person
		 where $b/role[@current='1'] and $b/role[@party='Republican']
		return $b)
   let $m := count(for $p in $reps
	 	   where $p[@gender='M']
		   return $p)
   let $f := count($reps) - $m
   return <Republican><M count="{$m}"/><F count="{$f}"/></Republican> 
}
{
   let $ind := (for $b in /congress/people/person
		where $b/role[@current='1'] and $b/role[@party='Independent']
		return $b)
   let $m := count(for $p in $ind
		   where $p[@gender='M']
		   return $p) - 1
   let $f := count($ind) - $m - 1
   return <Independent><M count="{$m}"/><F count="{$f}"/></Independent>
} </result>
