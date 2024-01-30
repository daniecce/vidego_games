select 
	genres
	,count(*)	as number_of_games
from video_games vg 
group by 1
order by 2 desc 
limit 10
