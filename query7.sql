select prt.name, count(distinct p.id)
from airlines ln, passengers p, routes r, flights f, airports prt, flights_has_passengers fhp
where fhp.passengers_id=p.id and fhp.flights_id=f.id and r.airlines_id=ln.id and f.routes_id=r.id 
	and (prt.id=r.source_id or prt.id=r.destination_id) and ln.name="Aegean Airlines" 
	and f.date>='2011-01-01' and f.date<='2015-01-01'
group by prt.name