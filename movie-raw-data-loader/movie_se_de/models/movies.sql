with movies as (
  select 
    id as movie_id,
    title as movie_title
  from ee-india-se-data.movie_data_mar25_sumant.movie_data_raw_table_mar25
),
final as (
  select
    movies.movie_id,
    movies.movie_title
  from movies
)

select * from final