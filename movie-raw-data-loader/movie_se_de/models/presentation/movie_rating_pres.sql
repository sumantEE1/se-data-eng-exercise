{{ config(
    materialized='view'
    )
}}
with movie_rating_median as (
  select
    distinct ratings.movie_id as movie_id,
    PERCENTILE_CONT(ratings.rating,0.5)
      over (partition by ratings.movie_id) as median_rating
  from {{ ref('ratings_curate') }} as ratings
  
),
movie_rating_count as (
  select 
    ratings.movie_id,
    count(*) as ratings_count
  from {{ ref('ratings_curate') }} as ratings
  group by ratings.movie_id
),
final as (
  select 
    movies.movie_id as Movie_id,
    movies.title as Title,
    movie_rating_count.ratings_count as `Number of ratings`,
    movie_rating_median.median_rating as `Median rating`,
    rank() 
      over (order by movie_rating_median.median_rating desc)
      as `Movie Rank`
  from {{ ref( 'movies_curate') }} as movies 
    join movie_rating_count on movie_rating_count.movie_id = movies.movie_id
    join movie_rating_median on movie_rating_median.movie_id = movies.movie_id
)

select * from final