<result> {
   for $b in //member
   let $p := /congress/people/person[@name='Steny H. Hoyer']
   where $b[@id = $p/@id]
   return $b
} </result> 
