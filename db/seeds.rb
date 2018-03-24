more_movies = [ {:title => 'Aladin2', :rating => 'G', :release_date => '25-Nov-1992'} ]

more_movies.each do |movie|
 Movie.create!(movie)
end
