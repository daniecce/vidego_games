select 
	distinct release_year 
	,count(distinct title)	as number_of_games
from video_games vg 
group by 1
order by 1 asc
