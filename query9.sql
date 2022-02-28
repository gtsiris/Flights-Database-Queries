select prt.name, count(distinct ln.id)
from airports prt, routes r, airlines ln
where (prt.id=r.source_id or prt.id=r.destination_id) and r.airlines_id=ln.id and ln.active="Y"
group by prt.id
order by count(distinct ln.id) desc, count(distinct r.id) desc
limit 1
