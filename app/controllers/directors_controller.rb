class DirectorsController < ApplicationController
  before_action :set_director, only: %i[ show edit update destroy ]
  
  # GET /directors
  def index
    @directors = Director.all                                                  
  end

  # GET /directors/new
  def new
    @director = Director.new
  end

  # GET /directors/:id/edit
  def edit
  end

  # POST /directors
  def create
    @director = Director.new(director_params)

    if @director.save
      redirect_to directors_url, notice: "#{@director.name} was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end   

  # PUT/PATCH /directors
  def update
    if @director.update(director_params)
      redirect_to directors_url, notice: "#{@director.name} was successfully updated." 
    else
      render :new, status: :unprocessable_entity  
    end
  end

  # DELETE /directors
  def destroy
    @director.destroy

    redirect_to directors_url, notice: "#{@director.name} was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_director
    @director = Director.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def director_params
    params.require(:director).permit(:name)
  end
end
