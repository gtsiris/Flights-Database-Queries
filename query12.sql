select ln.name, count(p.id)
from airlines ln, routes r, flights f, flights_has_passengers fhp, passengers p, airports prt
where ln.id=r.airlines_id and f.routes_id=r.id and fhp.flights_id=f.id and fhp.passengers_id=p.id
	and (r.source_id=prt.id or r.destination_id=prt.id) and prt.city="London"
group by ln.id
order by count(p.id) asc
limit 5