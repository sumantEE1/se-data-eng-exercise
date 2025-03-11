{{ config(
    materialized='table', alias='ratings_curate') 
}}
    
with ratings as (
  select
    cast(timestamp as INT) as timestamp,
    cast(userId as INT) as user_id,
    cast(movieId as INT) as movie_id,
    cast(rating as DECIMAL) as rating
  from ee-india-se-data.movie_data_mar25_sumant.ratings_table_mar25
),
final(
  select 
      a.timestamp,
      a.user_id,
      a.movie_id,
      a.rating
    from ratings a 
    join ratings b on 
      a.movie_id = b.movie_id 
        and
      a.user_id = b.user_id
    where a.timestamp > b.timestamp
)

select * from final