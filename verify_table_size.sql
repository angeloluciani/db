select 
segment_name table_name,segment_type,
sum(bytes) table_size_bytes
from user_extents
group by segment_name, segment_type
ORDER BY 2 DESC;
