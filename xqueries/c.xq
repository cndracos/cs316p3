<result> {
   for $b in /congress/people/person
   where $b[@gender = "F" and xs:date(@birthday) >=  xs:date("1960-01-01")]
     and (some $p in $b/role satisfies $p[@current='1' and @type='sen'])
   stable order by $b/@name  
   return <senator name="{$b/@name}"/>
} </result>
