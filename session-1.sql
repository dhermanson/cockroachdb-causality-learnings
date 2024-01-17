
-- create a table which has a column for our transaction commit timestamp ("causality token")
create table items (
  id text,
  causality_token decimal
  );


begin;

-- insert multiple records and include the causality token as a value
insert into items (id, causality_token)
select records.*, truetime.cluster_logical_timestamp
from (values (1), (2), (3) ) records
cross join (select cluster_logical_timestamp from cluster_logical_timestamp()) truetime

end;


select * from items
order by causality_token, id;
