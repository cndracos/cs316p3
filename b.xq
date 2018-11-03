<result> {
   let $b := /congress/committees/committee[@code = 'SSJU']/member[@role = 'Chairman']
   return /congress/people/person[@id = $b/@id]
} </result>
