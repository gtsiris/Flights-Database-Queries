select ln.code, ln.name, count(distinct pl.id), count(distinct r.id)
from airlines ln, airplanes pl, routes r, airlines_has_airplanes aha
where aha.airlines_id=ln.id and aha.airplanes_id=pl.id and r.airlines_id=ln.id 
group by ln.id
having count(distinct pl.id)>5 and count(distinct r.id)>5
order by ln.name