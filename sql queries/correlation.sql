select 
    (sum((rating - avg_rating) * (number_of_reviews - avg_number_of_reviews)) / count(rating)) /
    (sqrt(sum(pow(rating - avg_rating, 2)) / count(rating)) * sqrt(sum(pow(number_of_reviews - avg_number_of_reviews, 2)) / count(number_of_reviews))) as correlation
from 
    (select 
        rating 
        ,number_of_reviews
        ,(select avg(rating) from video_games where rating is not null) as avg_rating
        ,(select avg(number_of_reviews) from video_games where number_of_reviews is not null) as avg_number_of_reviews
     from video_games
     where rating is not null and number_of_reviews is not null) as subquery;
