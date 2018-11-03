<result> {
   for $b in /congress/people/person
   where ends-with($b/@name, 'Price')
   return $b 
} </result>
