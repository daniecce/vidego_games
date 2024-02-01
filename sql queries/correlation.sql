with avg_values as (
	select 
		avg(rating)					as avg_rating
		,avg(number_of_reviews)		as avg_number_of_reviews
	from video_games
	where rating is not null and number_of_reviews is not null
), correlation as (
	select
		rating
		,number_of_reviews
		,avg_rating
		,avg_number_of_reviews
	from 
		video_games
		,avg_values
	where rating is not null and number_of_reviews is not null
)
select 
	(sum((rating - avg_rating) * (number_of_reviews - avg_number_of_reviews)) / count(rating)) /
	(sqrt(sum(pow(rating - avg_rating, 2)) / count(rating)) * sqrt(sum(pow(number_of_reviews - avg_number_of_reviews, 2)) / count(number_of_reviews)))	as correlation
from correlation
	
