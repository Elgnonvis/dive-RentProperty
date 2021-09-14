class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @stations = @property.stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    2.times do
      @property.stations.build
    end
  end

  # GET /properties/1/edit
  def edit
    # @station = Station.new
    @stations = @property.stations.build
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
      if @property.save
        redirect_to @property, notice: "Property was successfully created."
      else
        render :new
      end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
   
      if @property.update(property_params)
        redirect_to @property, notice: "Property was successfully updated."
      else
        render :edit
      end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
      redirect_to properties_url, notice: "Property was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :rent, :age, :address, :remark, stations_attributes: [:id, :railway, :name, :walk])
    end
end
