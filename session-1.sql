create table events (
  id UUID default gen_random_uuid(),
  payload TEXT,
  causality_token decimal
  );

begin;

-- insert multiple records and include the causality token as a value
insert into events (payload, causality_token)
select records.*, truetime.cluster_logical_timestamp
from (values ('foo'), ('bar'), ('baz')) records
cross join (select cluster_logical_timestamp from cluster_logical_timestamp()) truetime

end;


select * from events
order by causality_token, id;
