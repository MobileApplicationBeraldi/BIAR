class Movie < ActiveRecord::Base
 def self.find_in_tmdb(search_string)
  Tmdb::Api.key("1cd706cde929a0008e0a3f4107380c73")
  #m=Tmdb::Search.movie('Harry potter')
  m=Tmdb::Search.movie(search_string)
 end
end
