update video_games 
set genres = trim(genres)
select genres from video_games vg 

delete 
from video_games 
where genres is null or genres = ""
