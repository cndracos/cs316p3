<result> {
   for $b in /congress/people/person/role[@state = "NC" and @current = "1"]
   stable order by $b/xs:date(@startdate)
   return
       <senator first_start="{$b/@startdate}" party="{$b/@party}"> 
          {$b/../@name}
       </senator>
} </result>
