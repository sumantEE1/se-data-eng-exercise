{{ config(
    materialized='table', alias='ratings_curate') 
}}
    
with ratings_curate as (
  select
    cast(timestamp as INT) as timestamp,
    cast(userId as INT) as user_id,
    cast(movieId as INT) as movie_id,
    cast(rating as DECIMAL) as rating
  from ee-india-se-data.movie_data_mar25_sumant.ratings_table_mar25
),
final as ( 
  select * from ratings_curate
)

select * from final