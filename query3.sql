select distinct p.name, p.surname, count(f.id)
from flights f, passengers p, airports prt, routes r, flights_has_passengers fhp
where fhp.passengers_id=p.id and fhp.flights_id=f.id and f.routes_id=r.id and r.source_id=prt.id
	and f.date>='2014-01-01' and f.date<='2015-01-01' and prt.name="Athens El. Venizelos" 
group by p.id
having count(f.id)>4
order by p.name