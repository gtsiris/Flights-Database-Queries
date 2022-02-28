#select prt.name, count(distinct r.id)
#from airports prt, routes r, airlines ln
#where (prt.id=r.source_id or prt.id=r.destination_id) and r.airlines_id=ln.id and ln.active="Y"
#group by prt.id
#order by count(distinct ln.id) desc
#limit 1

select prt.name, count(distinct ln.id), count(r.id)
from airports prt, routes r, airlines ln
where (prt.id=r.source_id or prt.id=r.destination_id) and r.airlines_id=ln.id and prt.id in (
	select prt.id
	from airports prt, routes r1, airlines ln1, routes r2, airlines ln2
	where ln1.id!=ln2.id and ln1.active="Y" and ln2.active="Y"
    and r1.airlines_id=ln1.id and r2.airlines_id=ln2.id
    and (prt.id=r1.source_id or prt.id=r1.destination_id)
    and (prt.id=r2.source_id or prt.id=r2.destination_id)
)
group by prt.id
order by count(distinct ln.id) desc
limit 2

/*
select prt.name
from airports prt1
where not exists(
	select *
    from airports prt2, routes r, airlines ln
    where prt1.id!=prt2.id and (prt2.id=r.source_id or prt2.id=r.destination_id) and r.airlines_id=ln.id and ln.active="Y"
    group by prt2.id
    having count(r.id)
)
*/