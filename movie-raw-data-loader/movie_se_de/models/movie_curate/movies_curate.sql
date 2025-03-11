{{ config(
    materialized='table', alias='movies_curate') 
}}

with movies_curate as (
  select 
    SAFE_CAST(adult as BOOLEAN) as adult,
    belongs_to_collection,
    SAFE_CAST(budget as INT) as budget,
    genres,
    homepage,
    SAFE_CAST(id as INT) as movie_id,
    imdb_id,
    original_language,
    original_title,
    overview,
    SAFE_CAST(popularity as DECIMAL) as popularity,
    poster_path,
    production_companies,
    production_countries,
    SAFE_CAST(release_date as DATE) as release_date,
    SAFE_CAST(revenue as INT) as revenue,
    SAFE_CAST(runtime as INT) as runtime,
    spoken_languages,
    status,    
    tagline,
    title,
    SAFE_CAST(video as BOOLEAN) as video,
    SAFE_CAST(vote_average as DECIMAL) as vote_average,
    SAFE_CAST(vote_count as INT) as vote_count,
    load_date
  from ee-india-se-data.movie_data_mar25_sumant.movie_data_raw_table_mar25
),
final as (
  select * from movies_curate
)

select * from final