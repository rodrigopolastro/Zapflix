class MoviesController < ApplicationController
  before_action :set_movie,  only: %i[ show edit update destroy ]

  # GET /movies
  def index
    @movies = Movie.all                                                 
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/:id/edit
  def edit
  end

  # POST /Movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      @movie.artist_ids.each do |artist_in_movie|
        Contract.new(movie_id: @movie.id, artist_id: artist_in_movie)
      end
      redirect_to movies_url, notice: "#{@movie.title} was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end   

  # PUT/PATCH /movies
  def update
     
    if @movie.update(movie_params)     
      redirect_to movies_url, notice: "#{@movie.title} was successfully updated." 
    else
      render :new, status: :unprocessable_entity  
    end
  end

  # DELETE /movies
  def destroy
    @movie.destroy

    redirect_to movies_url, notice: "#{@movie.title} was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end
  
  # Only allow a list of trusted parameters through.
  def movie_params  
    params.require(:movie).permit(:title, :cover_url, :published_at, :director_id, :movie_genre_id, :sinopse, artist_ids:[])
  end
end
