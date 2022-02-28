select ln.name, count(distinct f.id)
from airlines ln, airplanes pl, routes r, flights f, airlines_has_airplanes aha
where ln.id=aha.airlines_id and pl.id=aha.airplanes_id and f.routes_id=r.id and r.airlines_id = ln.id and f.airplanes_id=pl.id
	and pl.manufacturer="Boeing"
group by ln.id
order by ln.name