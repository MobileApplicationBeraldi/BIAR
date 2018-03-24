#https://api.themoviedb.org/3/movie/550?api_key=1cd706cde929a0008e0a3f4107380c73
class MoviesController < ApplicationController

#:skip_before_filter
 
 def index
    #render plain: 'ok' 
    @movies=Movie.all
    #render json: Movie.all 
    #render xml: Movie.all #it doesn't show the list....
 end

 def show
    #render plain: 'show'
    id=params[:id]
    @movie=Movie.find(id)
    #render plain: @movie
 end
 def new

 end

 def create
  params.require(:movie)
  params[:movie].permit(:title,:rating,:release_date)
  t=params[:movie][:title]
  r=params[:movie][:rating]
  rd=params[:movie]["release_date(1i)"]+'-'+params[:movie]["release_date(2i)"]+'-'+params[:movie]["release_date(3i)"]
  @movie = Movie.create!(:title=>t,:rating=>r,:release_date=>rd)
  redirect_to movies_path
  #render plain: rd 
  #render plain: params[:movie][:release_date(1i)]
 end

 def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path
 end

 def search_tmdb
  #flash[:warning] = " '#{params[:search_terms]}' was not found in TMDb."
  #redirect_to movies_path
  @r=Movie.find_in_tmdb(params[:search_terms])
  render json: @r 
 end
end
