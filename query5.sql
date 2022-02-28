select 'yes' as answer
from airports prt, routes r, airlines ln
where r.airlines_id=ln.id and (prt.id=r.source_id or prt.id=r.destination_id) 
	and prt.name="London Gatwick"
group by prt.id
having count(ln.id)>5
union
select 'no' as answer
from airports prt, routes r, airlines ln
where r.airlines_id=ln.id and (prt.id=r.source_id or prt.id=r.destination_id) 
	and prt.name="London Gatwick"
group by prt.id
having count(ln.id)<=5