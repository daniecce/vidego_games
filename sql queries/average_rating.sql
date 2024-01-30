select 
	genres
	,avg(rating)
from video_games 
group by 1 
order by 2 desc 
limit 10 
