with movie_curate as (
  select 
    cast(adult as BOOLEAN) as adult,
cast(belongs_to_collection as JSON),
cast(budget as Float),
cast(genres as  JSON),
homepage
cast(id as Integer) as movie_id,
imdb_id,
original_language,
original_title,
overview,
cast(popularity as Float) as popularity,
poster_path,
cast(production_companies as JSON) as production_companies,
cast(production_countries as JSON) as production_countries,
cast(release_date as DATE) as release_date,
cast(revenue as Integer) as revenue,
cast(runtime as Integer) as runtime,
cast(spoken_languages as JSON) as spoken_languages,
status,    
tagline,
title,
cast(video as BOOLEAN) as video,
cast(vote_average as Float) as vote_average,
cast(vote_count as Integer) as vote_count
  from ee-india-se-data.movie_data_mar25_sumant.movie_data_raw_table_mar25
)

select * from movie_curate