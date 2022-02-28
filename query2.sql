select pl.manufacturer, pl.model, count(f.id)
from flights f, routes r, airports prt1, airports prt2, airplanes pl, airlines_has_airplanes aha, airlines ln
where f.routes_id=r.id and r.source_id=prt1.id and r.destination_id=prt2.id
	and prt1.city="Athens" and prt2.city="London" and f.date>='2011-02-01' and f.date<='2014-07-17' 
	and ln.id=aha.airlines_id and aha.airplanes_id=pl.id and ln.name="Olympic Airways" and f.airplanes_id=pl.id
group by f.airplanes_id
order by count(f.id) desc
limit 1
