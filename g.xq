<result> {
   let $dems := (for $b in /congress/people/person
                    where $b/role[@current='1'] and $b/role[@party='Democrat']
		    return $b)
   let $m := count(for $p in $dems
		   where $p[@gender='M']
		   return $p)
   let $f := count($dems) - $m
   return element {'Democrat'} {
	element {'M'} {
	   attribute count {$m}
	},
	element {'F'} {
	   attribute count {$f}
	}
   }
}
{
   let $reps := (for $b in /congress/people/person
		 where $b/role[@current='1'] and $b/role[@party='Republican']
		return $b)
   let $m := count(for $p in $reps
	 	   where $p[@gender='M']
		   return $p)
   let $f := count($reps) - $m
   return element {'Republican'} {
	element {'M'} {
	   attribute count {$m}
	},
	element {'F'} {
	   attribute count {$f}
	}
   }
}
{
   let $ind := (for $b in /congress/people/person
		where $b/role[@current='1'] and $b/role[@party='Independent']
		return $b)
   let $m := count(for $p in $ind
		   where $p[@gender='M']
		   return $p)
   let $f := count($ind) - $m
   return element {'Independent'} {
	element {'M'} {
	   attribute count {$m}
	},
	element {'F'} {
	   attribute count {$f}
	}
   }
} </result>
