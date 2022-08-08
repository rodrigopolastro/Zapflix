class HomeController < ApplicationController
  def index

    
    @last_movie        = Movie.order(id: :desc).limit(1).take
    @second_last_movie = Movie.order(id: :desc).limit(1).offset(1).take
    @third_last_movie  = Movie.order(id: :desc).limit(1).offset(2).take
    @fourth_last_movie = Movie.order(id: :desc).limit(1).offset(3).take
  end
end
