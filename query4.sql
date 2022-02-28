select p.name, p.surname
from passengers p, airlines ln, flights f, flights_has_passengers fhp, routes r
where fhp.passengers_id=p.id and fhp.flights_id=f.id and f.routes_id=r.id and r.airlines_id=ln.id
	and ln.name="British Airways" and not exists (
    select *
    from airlines ln, flights f, flights_has_passengers fhp, routes r
    where fhp.passengers_id=p.id and fhp.flights_id=f.id and f.routes_id=r.id and r.airlines_id=ln.id and ln.name!="British Airways"
)
order by p.name