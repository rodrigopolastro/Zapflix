class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]
  
  # GET /artists
  def index
    @artists = Artist.all                                                  
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/:id/edit
  def edit
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_url, notice: "O artista #{@artist.name} foi registrado." 
    else
      render :new, status: :unprocessable_entity 
    end
  end   

  # PUT/PATCH /artists
  def update
    if @artist.update(artist_params)
      redirect_to artists_url, notice: "O artista #{@artist.name} foi atualizado."
    else
      render :new, status: :unprocessable_entity  
    end
  end

  # DELETE /artists
  def destroy
    @artist.destroy

    redirect_to artists_url, notice: "O artista #{@artist.name} foi apagado."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artist_params
    params.require(:artist).permit(:name)
  end
end
