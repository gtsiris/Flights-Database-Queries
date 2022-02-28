select count(p.id)
from passengers p
where p.id in (
	select p.id
	from passengers p, flights_has_passengers fhp, flights f, routes r, airports prt
	where p.id=fhp.passengers_id and fhp.flights_id=f.id and f.routes_id=r.id and r.source_id=prt.id
		and prt.city="Athens" and f.date>='2010-01-01' and f.date<='2015-01-01'
	group by p.id
	having count(f.id)>5
)