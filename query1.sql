select count(f.id)
from flights f, routes r, airports prt
where f.routes_id=r.id and r.source_id=prt.id and prt.city="Athens" and (
	select count(p.id) between 5 and 7
	from flights_has_passengers fhp, passengers p
	where f.id=fhp.flights_id and fhp.passengers_id=p.id
)